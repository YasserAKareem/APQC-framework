-- ============================================================================
-- APQC PCF Report: Complete Process Table Report
-- ============================================================================
--
-- This report provides a complete table of all APQC processes with all
-- their attributes in a flat table format, suitable for Excel import
-- or further analysis.
--
-- Based on the HOPEX "APQC - Process Table" template
--
-- ============================================================================

-- ============================================================================
-- Report 1: Full Process Table with All Attributes
-- ============================================================================

SELECT
    p.process_code as "Process Code",
    p.process_name as "Process Name",
    p.process_type as "Process Type",
    p.hierarchy_level as "Level",
    p.parent_process_code as "Parent Code",
    c.category_code as "Category Code",
    c.category_name as "Category Name",
    c.category_type as "Category Type (Operating/Support)",
    p.process_description as "Description",
    p.is_leaf_node as "Is Leaf Node",
    p.process_number as "APQC Process Number",
    p.internal_id as "Internal ID",
    p.is_active as "Active",
    p.created_date as "Created Date",
    p.modified_date as "Modified Date"
FROM processes p
LEFT JOIN process_categories c ON p.category_code = c.category_code
WHERE p.is_active = TRUE
ORDER BY p.process_code;

-- ============================================================================
-- Report 2: Process Table by Category (Grouped)
-- ============================================================================

SELECT
    c.category_code as "Category",
    c.category_name as "Category Name",
    c.category_type as "Type",
    p.process_code as "Process Code",
    p.process_name as "Process Name",
    p.hierarchy_level as "Level",
    p.process_type as "Process Type",
    CASE
        WHEN LENGTH(p.process_description) > 200
        THEN SUBSTRING(p.process_description, 1, 200) || '...'
        ELSE p.process_description
    END as "Description"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code
WHERE p.is_active = TRUE OR p.process_id IS NULL
ORDER BY c.category_code, p.process_code;

-- ============================================================================
-- Report 3: Process Table with Parent-Child Relationships
-- ============================================================================

SELECT
    p.process_code as "Process Code",
    p.process_name as "Process Name",
    p.hierarchy_level as "Level",
    p.parent_process_code as "Parent Code",
    pp.process_name as "Parent Name",
    p.category_code as "Category",
    COUNT(cp.process_id) as "Number of Children",
    p.is_leaf_node as "Is Leaf"
FROM processes p
LEFT JOIN processes pp ON p.parent_process_code = pp.process_code
LEFT JOIN processes cp ON cp.parent_process_code = p.process_code
WHERE p.is_active = TRUE
GROUP BY p.process_code, p.process_name, p.hierarchy_level,
         p.parent_process_code, pp.process_name, p.category_code, p.is_leaf_node
ORDER BY p.process_code;

-- ============================================================================
-- Report 4: Pivot-Style Report (Level 1, 2, 3 as Columns)
-- ============================================================================

WITH process_hierarchy AS (
    SELECT
        p.process_code,
        p.process_name,
        p.hierarchy_level,
        p.category_code,
        p.parent_process_code,
        c.category_name
    FROM processes p
    LEFT JOIN process_categories c ON p.category_code = c.category_code
    WHERE p.is_active = TRUE
)
SELECT DISTINCT
    l1.category_name as "Level 1 - Category",
    l2.process_name as "Level 2 - Process Group",
    l3.process_name as "Level 3 - Process",
    COALESCE(l3.process_code, l2.process_code, l1.category_code) as "Process Code"
FROM process_hierarchy l1
LEFT JOIN process_hierarchy l2 ON l2.parent_process_code = l1.category_code AND l2.hierarchy_level = 2
LEFT JOIN process_hierarchy l3 ON l3.parent_process_code = l2.process_code AND l3.hierarchy_level = 3
WHERE l1.hierarchy_level = 1
ORDER BY
    l1.category_code,
    l2.process_code NULLS FIRST,
    l3.process_code NULLS FIRST;

-- ============================================================================
-- Report 5: Process Table with Full Path
-- ============================================================================

SELECT
    process_code as "Code",
    process_name as "Name",
    full_path as "Full Hierarchical Path",
    hierarchy_level as "Level",
    category_name as "Category",
    category_type as "Category Type"
FROM process_hierarchy_view
WHERE hierarchy_level > 0
ORDER BY process_code;

-- ============================================================================
-- Report Statistics
-- ============================================================================

SELECT '============================================================================' as separator
UNION ALL SELECT 'Process Table Statistics';

SELECT
    'Total Records' as "Metric",
    COUNT(*)::TEXT as "Value"
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Categories (Level 1)',
    COUNT(CASE WHEN hierarchy_level = 1 THEN 1 END)::TEXT
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Process Groups (Level 2)',
    COUNT(CASE WHEN hierarchy_level = 2 THEN 1 END)::TEXT
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Processes (Level 3)',
    COUNT(CASE WHEN hierarchy_level = 3 THEN 1 END)::TEXT
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Operating Categories',
    COUNT(DISTINCT category_code)::TEXT
FROM process_categories
WHERE category_type = 'Operating'

UNION ALL

SELECT
    'Management & Support Categories',
    COUNT(DISTINCT category_code)::TEXT
FROM process_categories
WHERE category_type = 'Management and Support';

-- ============================================================================
-- Export Instructions
-- ============================================================================
--
-- To generate this report:
--
-- 1. PostgreSQL:
--    psql -d apqc_pcf -f 02-process-table-report.sql > output.txt
--    or
--    \copy (SELECT ...) TO 'process_table.csv' CSV HEADER
--
-- 2. MySQL:
--    mysql apqc_pcf < 02-process-table-report.sql > output.txt
--    or use SELECT ... INTO OUTFILE
--
-- 3. SQL Server:
--    sqlcmd -d apqc_pcf -i 02-process-table-report.sql -o output.txt
--    or use SSIS for export
--
-- For Excel Import:
--   Export to CSV, then open in Excel
--   Or use Excel's "Data from Database" feature
--
-- ============================================================================
