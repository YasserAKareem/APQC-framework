-- ============================================================================
-- APQC PCF Report: Process Hierarchy Report
-- ============================================================================
--
-- This report provides a hierarchical view of all APQC processes
-- organized by category, process group, and process levels.
-- Similar to the HOPEX "Process Table Hierarchy" report template.
--
-- Output Format: Multi-level hierarchical table
-- Columns: Level 1, Level 2, Level 3, Process Code, Description
--
-- ============================================================================

-- Report Header
SELECT '============================================================================' as report_line
UNION ALL SELECT 'APQC Process Classification Framework - Process Hierarchy Report'
UNION ALL SELECT 'Cross Industry v7.2.1'
UNION ALL SELECT '============================================================================'
UNION ALL SELECT '';

-- Main Report Query
-- This query produces a denormalized view showing all three levels of hierarchy
SELECT
    -- Level 1: Category
    CASE WHEN p.hierarchy_level >= 1 THEN c.category_name ELSE '' END as "Level 1 - Category",

    -- Level 2: Process Group
    CASE
        WHEN p.hierarchy_level = 2 THEN p.process_name
        WHEN p.hierarchy_level = 3 THEN p2.process_name
        ELSE ''
    END as "Level 2 - Process Group",

    -- Level 3: Process
    CASE WHEN p.hierarchy_level = 3 THEN p.process_name ELSE '' END as "Level 3 - Process",

    -- Process Code
    p.process_code as "Process Code",

    -- Process Type
    p.process_type as "Type",

    -- Description (truncated for readability)
    CASE
        WHEN LENGTH(p.process_description) > 100
        THEN SUBSTRING(p.process_description, 1, 100) || '...'
        ELSE p.process_description
    END as "Description"

FROM processes p
LEFT JOIN process_categories c ON p.category_code = c.category_code
LEFT JOIN processes p2 ON p.parent_process_code = p2.process_code
WHERE p.is_active = TRUE
ORDER BY p.process_code;

-- Report Summary
SELECT '' as report_line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Report Summary'
UNION ALL SELECT '============================================================================';

SELECT
    'Total Categories' as metric,
    COUNT(DISTINCT CASE WHEN hierarchy_level = 1 THEN process_id END)::TEXT as value
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Total Process Groups',
    COUNT(DISTINCT CASE WHEN hierarchy_level = 2 THEN process_id END)::TEXT
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Total Processes',
    COUNT(DISTINCT CASE WHEN hierarchy_level = 3 THEN process_id END)::TEXT
FROM processes
WHERE is_active = TRUE

UNION ALL

SELECT
    'Grand Total',
    COUNT(*)::TEXT
FROM processes
WHERE is_active = TRUE;

-- ============================================================================
-- Alternative View: Indented Hierarchy (Tree View)
-- ============================================================================

SELECT '' as report_line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Process Hierarchy - Tree View'
UNION ALL SELECT '============================================================================'
UNION ALL SELECT '';

SELECT
    CASE hierarchy_level
        WHEN 1 THEN process_code || ' ' || process_name
        WHEN 2 THEN '  ├─ ' || process_code || ' ' || process_name
        WHEN 3 THEN '    └─ ' || process_code || ' ' || process_name
    END as "Process Hierarchy Tree"
FROM processes
WHERE is_active = TRUE
ORDER BY process_code
LIMIT 50;

-- ============================================================================
-- Export Instructions
-- ============================================================================
--
-- To export this report to CSV:
--   PostgreSQL: \copy (SELECT ...) TO 'process_hierarchy.csv' CSV HEADER
--   MySQL: SELECT ... INTO OUTFILE '/tmp/process_hierarchy.csv' ...
--
-- To export to HTML:
--   Use your database client's export functionality
--
-- To create a PDF:
--   Export to CSV first, then use reporting tools like Jasper Reports,
--   Crystal Reports, or Python libraries (pandas, reportlab)
--
-- ============================================================================
