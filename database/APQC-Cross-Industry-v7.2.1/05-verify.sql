-- ============================================================================
-- APQC PCF Database Verification Script
-- ============================================================================
--
-- Run this script after database setup to verify data integrity and
-- validate the installation.
--
-- ============================================================================

\echo '============================================================================'
\echo 'APQC PCF Database Verification'
\echo '============================================================================'
\echo ''

-- ============================================================================
-- Section 1: Record Counts
-- ============================================================================

\echo '1. RECORD COUNTS'
\echo '----------------'

SELECT
    'Framework Metadata' as table_name,
    COUNT(*) as record_count,
    CASE WHEN COUNT(*) = 1 THEN '✓ PASS' ELSE '✗ FAIL' END as status
FROM framework_metadata

UNION ALL

SELECT
    'Process Categories',
    COUNT(*),
    CASE WHEN COUNT(*) = 13 THEN '✓ PASS' ELSE '✗ FAIL' END
FROM process_categories

UNION ALL

SELECT
    'Processes',
    COUNT(*),
    CASE WHEN COUNT(*) = 413 THEN '✓ PASS' ELSE '✗ FAIL' END
FROM processes

UNION ALL

SELECT
    'Process Relationships',
    COUNT(*),
    '✓ INFO'
FROM process_relationships

UNION ALL

SELECT
    'Process Metrics',
    COUNT(*),
    '✓ INFO'
FROM process_metrics;

\echo ''

-- ============================================================================
-- Section 2: Hierarchy Distribution
-- ============================================================================

\echo '2. HIERARCHY DISTRIBUTION'
\echo '-------------------------'

SELECT
    hierarchy_level,
    process_type,
    COUNT(*) as count,
    CASE
        WHEN hierarchy_level = 1 AND COUNT(*) = 13 THEN '✓ PASS'
        WHEN hierarchy_level = 2 AND COUNT(*) = 72 THEN '✓ PASS'
        WHEN hierarchy_level = 3 AND COUNT(*) = 328 THEN '✓ PASS'
        ELSE '? CHECK'
    END as status
FROM processes
GROUP BY hierarchy_level, process_type
ORDER BY hierarchy_level;

\echo ''

-- ============================================================================
-- Section 3: Data Integrity Checks
-- ============================================================================

\echo '3. DATA INTEGRITY CHECKS'
\echo '------------------------'

-- Check 3.1: Orphaned Processes
\echo '3.1 Checking for orphaned processes...'
SELECT
    'Orphaned Processes' as check_name,
    COUNT(*) as issue_count,
    CASE WHEN COUNT(*) = 0 THEN '✓ PASS' ELSE '✗ FAIL' END as status
FROM processes p
WHERE p.parent_process_code IS NOT NULL
  AND p.parent_process_code NOT IN (SELECT process_code FROM processes);

-- Check 3.2: Invalid Category References
\echo '3.2 Checking for invalid category references...'
SELECT
    'Invalid Category Refs' as check_name,
    COUNT(*) as issue_count,
    CASE WHEN COUNT(*) = 0 THEN '✓ PASS' ELSE '✗ FAIL' END as status
FROM processes p
WHERE p.category_code IS NOT NULL
  AND p.category_code NOT IN (SELECT category_code FROM process_categories);

-- Check 3.3: Leaf Node Consistency
\echo '3.3 Checking leaf node consistency...'
SELECT
    'Leaf Node Inconsistencies' as check_name,
    COUNT(*) as issue_count,
    CASE WHEN COUNT(*) = 0 THEN '✓ PASS' ELSE '✗ FAIL' END as status
FROM (
    SELECT p1.process_code, p1.is_leaf_node, COUNT(p2.process_id) as children
    FROM processes p1
    LEFT JOIN processes p2 ON p1.process_code = p2.parent_process_code
    GROUP BY p1.process_code, p1.is_leaf_node
    HAVING (p1.is_leaf_node = TRUE AND COUNT(p2.process_id) > 0)
        OR (p1.is_leaf_node = FALSE AND COUNT(p2.process_id) = 0)
) issues;

-- Check 3.4: Category Code Consistency
\echo '3.4 Checking category code consistency...'
SELECT
    'Category Code Mismatches' as check_name,
    COUNT(*) as issue_count,
    CASE WHEN COUNT(*) = 0 THEN '✓ PASS' ELSE '✗ FAIL' END as status
FROM processes p
WHERE p.hierarchy_level > 1
  AND p.category_code != SUBSTRING(p.process_code FROM 1 FOR 1) || '.0';

-- Check 3.5: Active Process Count
\echo '3.5 Checking active processes...'
SELECT
    'Active Processes' as check_name,
    COUNT(*) as count,
    CASE WHEN COUNT(*) = 413 THEN '✓ PASS' ELSE '? CHECK' END as status
FROM processes
WHERE is_active = TRUE;

\echo ''

-- ============================================================================
-- Section 4: Category Summary
-- ============================================================================

\echo '4. CATEGORY SUMMARY'
\echo '-------------------'

SELECT
    c.category_code,
    c.category_name,
    c.category_type,
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 2 THEN p.process_id END) as process_groups,
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) as processes
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.hierarchy_level > 1
GROUP BY c.category_code, c.category_name, c.category_type
ORDER BY c.category_code;

\echo ''

-- ============================================================================
-- Section 5: View Verification
-- ============================================================================

\echo '5. VIEW VERIFICATION'
\echo '--------------------'

SELECT
    'process_hierarchy_view' as view_name,
    COUNT(*) as record_count,
    CASE WHEN COUNT(*) = 413 THEN '✓ PASS' ELSE '✗ FAIL' END as status
FROM process_hierarchy_view

UNION ALL

SELECT
    'category_summary',
    COUNT(*),
    CASE WHEN COUNT(*) = 13 THEN '✓ PASS' ELSE '✗ FAIL' END
FROM category_summary

UNION ALL

SELECT
    'leaf_processes',
    COUNT(*),
    CASE WHEN COUNT(*) > 0 THEN '✓ PASS' ELSE '✗ FAIL' END
FROM leaf_processes

UNION ALL

SELECT
    'process_tree',
    COUNT(*),
    CASE WHEN COUNT(*) = 413 THEN '✓ PASS' ELSE '✗ FAIL' END
FROM process_tree;

\echo ''

-- ============================================================================
-- Section 6: Sample Data Validation
-- ============================================================================

\echo '6. SAMPLE DATA VALIDATION'
\echo '-------------------------'

-- Check 6.1: Sample Category
\echo '6.1 Validating sample category (1.0)...'
SELECT
    'Category 1.0 Exists' as check_name,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM process_categories
            WHERE category_code = '1.0'
              AND category_name = 'Develop Vision and Strategy'
        ) THEN '✓ PASS'
        ELSE '✗ FAIL'
    END as status;

-- Check 6.2: Sample Process Group
\echo '6.2 Validating sample process group (1.1)...'
SELECT
    'Process 1.1 Exists' as check_name,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM processes
            WHERE process_code = '1.1'
              AND parent_process_code = '1.0'
        ) THEN '✓ PASS'
        ELSE '✗ FAIL'
    END as status;

-- Check 6.3: Sample Process
\echo '6.3 Validating sample process (1.1.1)...'
SELECT
    'Process 1.1.1 Exists' as check_name,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM processes
            WHERE process_code = '1.1.1'
              AND parent_process_code = '1.1'
              AND is_leaf_node = TRUE
        ) THEN '✓ PASS'
        ELSE '✗ FAIL'
    END as status;

\echo ''

-- ============================================================================
-- Section 7: Index Verification
-- ============================================================================

\echo '7. INDEX VERIFICATION'
\echo '---------------------'

SELECT
    schemaname,
    tablename,
    indexname,
    '✓ EXISTS' as status
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename IN ('framework_metadata', 'process_categories', 'processes',
                    'process_relationships', 'process_metrics')
ORDER BY tablename, indexname;

\echo ''

-- ============================================================================
-- Summary
-- ============================================================================

\echo '============================================================================'
\echo 'VERIFICATION COMPLETE'
\echo '============================================================================'
\echo ''
\echo 'Review the results above. All checks should show "✓ PASS" status.'
\echo 'If any checks show "✗ FAIL", please review the database setup.'
\echo ''
\echo 'For support, see the README.md file or visit https://www.apqc.org/'
\echo ''
\echo '============================================================================'
