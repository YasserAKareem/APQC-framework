-- ============================================================================
-- APQC Process Classification Framework (PCF) - Cross Industry v7.2.1
-- Database Views and Sample Queries
-- ============================================================================
--
-- This file contains useful views and sample queries for working with the
-- APQC PCF database
--
-- ============================================================================

-- ============================================================================
-- View: process_hierarchy_view
-- Purpose: Complete hierarchical view of all processes with their full path
-- ============================================================================

CREATE OR REPLACE VIEW process_hierarchy_view AS
SELECT
    p.process_id,
    p.process_code,
    p.process_name,
    p.process_description,
    p.hierarchy_level,
    p.parent_process_code,
    p.category_code,
    p.process_type,
    p.is_leaf_node,
    p.is_active,
    c.category_name,
    c.category_type,
    -- Build full path
    CASE
        WHEN p.hierarchy_level = 1 THEN p.process_name
        WHEN p.hierarchy_level = 2 THEN c.category_name || ' > ' || p.process_name
        WHEN p.hierarchy_level = 3 THEN
            c.category_name || ' > ' ||
            (SELECT p2.process_name FROM processes p2 WHERE p2.process_code = p.parent_process_code) ||
            ' > ' || p.process_name
    END as full_path
FROM processes p
LEFT JOIN process_categories c ON p.category_code = c.category_code
WHERE p.is_active = TRUE;

-- ============================================================================
-- View: category_summary
-- Purpose: Summary statistics for each category
-- ============================================================================

CREATE OR REPLACE VIEW category_summary AS
SELECT
    c.category_id,
    c.category_code,
    c.category_name,
    c.category_type,
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 2 THEN p.process_id END) as process_group_count,
    COUNT(DISTINCT CASE WHEN p.hierarchy_level = 3 THEN p.process_id END) as process_count,
    COUNT(DISTINCT p.process_id) as total_subordinate_count
FROM process_categories c
LEFT JOIN processes p ON p.category_code = c.category_code AND p.hierarchy_level > 1
GROUP BY c.category_id, c.category_code, c.category_name, c.category_type
ORDER BY c.category_code;

-- ============================================================================
-- View: leaf_processes
-- Purpose: All leaf-level processes (processes with no children)
-- ============================================================================

CREATE OR REPLACE VIEW leaf_processes AS
SELECT
    p.process_id,
    p.process_code,
    p.process_name,
    p.process_description,
    p.hierarchy_level,
    p.category_code,
    c.category_name,
    p.process_type
FROM processes p
LEFT JOIN process_categories c ON p.category_code = c.category_code
WHERE p.is_leaf_node = TRUE
  AND p.is_active = TRUE
ORDER BY p.process_code;

-- ============================================================================
-- View: process_tree
-- Purpose: Recursive CTE for complete process tree navigation
-- ============================================================================

CREATE OR REPLACE VIEW process_tree AS
WITH RECURSIVE tree AS (
    -- Base case: all level 1 categories
    SELECT
        p.process_id,
        p.process_code,
        p.process_name,
        p.hierarchy_level,
        p.parent_process_code,
        p.process_code as root_code,
        CAST(p.process_name AS VARCHAR(1000)) as path,
        CAST(p.process_code AS VARCHAR(200)) as code_path,
        1 as depth
    FROM processes p
    WHERE p.hierarchy_level = 1

    UNION ALL

    -- Recursive case: all children
    SELECT
        p.process_id,
        p.process_code,
        p.process_name,
        p.hierarchy_level,
        p.parent_process_code,
        t.root_code,
        CAST(t.path || ' > ' || p.process_name AS VARCHAR(1000)),
        CAST(t.code_path || ' > ' || p.process_code AS VARCHAR(200)),
        t.depth + 1
    FROM processes p
    INNER JOIN tree t ON p.parent_process_code = t.process_code
    WHERE p.is_active = TRUE
)
SELECT * FROM tree;

-- ============================================================================
-- Sample Queries
-- ============================================================================

-- Query 1: Get all categories with their process group counts
-- ----------------------------------------------------------------------------
-- SELECT * FROM category_summary ORDER BY category_code;

-- Query 2: Get all processes under a specific category
-- ----------------------------------------------------------------------------
-- SELECT
--     process_code,
--     process_name,
--     hierarchy_level,
--     process_type
-- FROM processes
-- WHERE category_code = '1.0'
-- ORDER BY process_code;

-- Query 3: Get the complete hierarchy for a specific process
-- ----------------------------------------------------------------------------
-- SELECT * FROM process_tree
-- WHERE process_code = '1.1.1'
-- ORDER BY depth;

-- Query 4: Get all immediate children of a process
-- ----------------------------------------------------------------------------
-- SELECT
--     process_code,
--     process_name,
--     process_type,
--     is_leaf_node
-- FROM processes
-- WHERE parent_process_code = '1.1'
-- ORDER BY process_code;

-- Query 5: Get all leaf processes in a specific category
-- ----------------------------------------------------------------------------
-- SELECT
--     process_code,
--     process_name,
--     process_description
-- FROM leaf_processes
-- WHERE category_code = '3.0'
-- ORDER BY process_code;

-- Query 6: Count processes by hierarchy level
-- ----------------------------------------------------------------------------
-- SELECT
--     hierarchy_level,
--     process_type,
--     COUNT(*) as count
-- FROM processes
-- WHERE is_active = TRUE
-- GROUP BY hierarchy_level, process_type
-- ORDER BY hierarchy_level;

-- Query 7: Get full path for all level 3 processes
-- ----------------------------------------------------------------------------
-- SELECT
--     process_code,
--     full_path
-- FROM process_hierarchy_view
-- WHERE hierarchy_level = 3
-- ORDER BY process_code
-- LIMIT 20;

-- Query 8: Search for processes by keyword
-- ----------------------------------------------------------------------------
-- SELECT
--     process_code,
--     process_name,
--     hierarchy_level,
--     category_name
-- FROM process_hierarchy_view
-- WHERE LOWER(process_name) LIKE '%customer%'
--    OR LOWER(process_description) LIKE '%customer%'
-- ORDER BY hierarchy_level, process_code;

-- Query 9: Get all Operating vs Management & Support categories
-- ----------------------------------------------------------------------------
-- SELECT
--     category_type,
--     COUNT(*) as category_count,
--     SUM(process_group_count) as total_process_groups,
--     SUM(process_count) as total_processes
-- FROM category_summary
-- GROUP BY category_type;

-- Query 10: Find processes without descriptions
-- ----------------------------------------------------------------------------
-- SELECT
--     process_code,
--     process_name,
--     hierarchy_level
-- FROM processes
-- WHERE (process_description IS NULL OR process_description = '')
--   AND is_active = TRUE
-- ORDER BY hierarchy_level, process_code;

-- ============================================================================
