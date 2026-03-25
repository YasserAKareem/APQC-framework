-- ============================================================================
-- APQC PCF Report: Category Summary Report
-- ============================================================================
--
-- This report provides executive summary information about each process
-- category, including counts, types, and hierarchical structure.
--
-- ============================================================================

-- ============================================================================
-- Report Header
-- ============================================================================

SELECT '============================================================================' as line
UNION ALL SELECT 'APQC Process Classification Framework'
UNION ALL SELECT 'Category Summary Report'
UNION ALL SELECT 'Cross Industry v7.2.1'
UNION ALL SELECT '============================================================================'
UNION ALL SELECT '';

-- ============================================================================
-- Report 1: Category Overview
-- ============================================================================

SELECT
    c.category_code as "Code",
    c.category_name as "Category Name",
    c.category_type as "Type",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 2 THEN p.process_id END) as "Process Groups",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) as "Processes",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level > 1 THEN p.process_id END) as "Total",
    ROUND(
        COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) * 100.0 /
        NULLIF((SELECT COUNT(*) FROM processes WHERE hierarchy_level = 3 AND is_active = TRUE), 0),
        2
    ) as "% of Total Processes"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.hierarchy_level > 1 AND p.is_active = TRUE
GROUP BY c.category_code, c.category_name, c.category_type
ORDER BY c.category_code;

-- ============================================================================
-- Report 2: Operating vs Management & Support Comparison
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Operating vs Management & Support Categories'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_type as "Category Type",
    COUNT(DISTINCT c.category_id) as "Number of Categories",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 2 THEN p.process_id END) as "Process Groups",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) as "Processes",
    ROUND(AVG(
        CASE WHEN p.hierarchy_level = 3 THEN 1 ELSE 0 END
    ), 2) as "Avg Processes per Category"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.is_active = TRUE
GROUP BY c.category_type
ORDER BY c.category_type;

-- ============================================================================
-- Report 3: Detailed Category Breakdown
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Detailed Category Information'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_code as "Code",
    c.category_name as "Category",
    c.category_type as "Type",
    c.category_description as "Description"
FROM process_categories c
ORDER BY c.category_code;

-- ============================================================================
-- Report 4: Top 5 Categories by Process Count
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Top 5 Categories by Process Count'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_name as "Category",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) as "Process Count",
    c.category_type as "Type"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.is_active = TRUE
GROUP BY c.category_id, c.category_name, c.category_type
ORDER BY COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) DESC
LIMIT 5;

-- ============================================================================
-- Report 5: Category Depth Analysis
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Category Depth Analysis'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_code as "Code",
    c.category_name as "Category",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 2 THEN p.process_id END) as "Level 2",
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) as "Level 3",
    ROUND(
        COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END)::NUMERIC /
        NULLIF(COUNT(DISTINCT CASE WHEN p.hierarchy_level = 2 THEN p.process_id END), 0),
        2
    ) as "Avg Processes per Group"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.is_active = TRUE
GROUP BY c.category_code, c.category_name
ORDER BY c.category_code;

-- ============================================================================
-- Report 6: Category Completeness Check
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Category Data Completeness'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_code as "Code",
    c.category_name as "Category",
    CASE WHEN c.category_description IS NOT NULL AND c.category_description != ''
         THEN 'Yes' ELSE 'No' END as "Has Description",
    COUNT(DISTINCT p.process_id) as "Total Items",
    COUNT(DISTINCT CASE WHEN p.process_description IS NOT NULL AND p.process_description != ''
                        THEN p.process_id END) as "Items with Desc",
    ROUND(
        COUNT(DISTINCT CASE WHEN p.process_description IS NOT NULL AND p.process_description != ''
                            THEN p.process_id END) * 100.0 /
        NULLIF(COUNT(DISTINCT p.process_id), 0),
        1
    ) as "% Complete"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.is_active = TRUE
GROUP BY c.category_code, c.category_name, c.category_description
ORDER BY c.category_code;

-- ============================================================================
-- Summary Totals
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Overall Summary'
UNION ALL SELECT '============================================================================';

SELECT
    'Total Categories' as "Metric",
    COUNT(*)::TEXT as "Count"
FROM process_categories

UNION ALL

SELECT
    'Operating Categories',
    COUNT(*)::TEXT
FROM process_categories
WHERE category_type = 'Operating'

UNION ALL

SELECT
    'Management & Support Categories',
    COUNT(*)::TEXT
FROM process_categories
WHERE category_type = 'Management and Support'

UNION ALL

SELECT
    'Total Process Groups',
    COUNT(*)::TEXT
FROM processes
WHERE hierarchy_level = 2 AND is_active = TRUE

UNION ALL

SELECT
    'Total Processes',
    COUNT(*)::TEXT
FROM processes
WHERE hierarchy_level = 3 AND is_active = TRUE;

-- ============================================================================
