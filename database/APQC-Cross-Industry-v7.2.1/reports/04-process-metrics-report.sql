-- ============================================================================
-- APQC PCF Report: Process Metrics Report
-- ============================================================================
--
-- This report shows performance metrics and KPIs associated with processes
-- Useful for benchmarking and performance management
--
-- ============================================================================

-- ============================================================================
-- Report Header
-- ============================================================================

SELECT '============================================================================' as line
UNION ALL SELECT 'APQC Process Classification Framework'
UNION ALL SELECT 'Process Metrics & KPI Report'
UNION ALL SELECT 'Cross Industry v7.2.1'
UNION ALL SELECT '============================================================================'
UNION ALL SELECT '';

-- ============================================================================
-- Report 1: Processes with Metrics
-- ============================================================================

SELECT
    p.process_code as "Process Code",
    p.process_name as "Process Name",
    c.category_name as "Category",
    m.metric_name as "Metric Name",
    m.metric_type as "Type",
    m.unit_of_measure as "Unit",
    m.target_value as "Target",
    m.industry_benchmark as "Benchmark",
    m.measurement_frequency as "Frequency",
    CASE WHEN m.is_active THEN 'Active' ELSE 'Inactive' END as "Status"
FROM processes p
INNER JOIN process_metrics m ON p.process_code = m.process_code
LEFT JOIN process_categories c ON p.category_code = c.category_code
WHERE p.is_active = TRUE
ORDER BY p.process_code, m.metric_name;

-- ============================================================================
-- Report 2: Metrics Summary by Type
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Metrics by Type'
UNION ALL SELECT '============================================================================';

SELECT
    m.metric_type as "Metric Type",
    COUNT(*) as "Count",
    COUNT(DISTINCT m.process_code) as "Processes with Metrics",
    ROUND(AVG(m.target_value), 2) as "Avg Target Value",
    ROUND(AVG(m.industry_benchmark), 2) as "Avg Benchmark"
FROM process_metrics m
WHERE m.is_active = TRUE
GROUP BY m.metric_type
ORDER BY COUNT(*) DESC;

-- ============================================================================
-- Report 3: Metrics by Category
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Metrics by Category'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_code as "Code",
    c.category_name as "Category",
    COUNT(DISTINCT m.metric_id) as "Total Metrics",
    COUNT(DISTINCT m.process_code) as "Processes with Metrics",
    COUNT(DISTINCT CASE WHEN m.metric_type = 'efficiency' THEN m.metric_id END) as "Efficiency",
    COUNT(DISTINCT CASE WHEN m.metric_type = 'effectiveness' THEN m.metric_id END) as "Effectiveness",
    COUNT(DISTINCT CASE WHEN m.metric_type = 'quality' THEN m.metric_id END) as "Quality",
    COUNT(DISTINCT CASE WHEN m.metric_type = 'cycle_time' THEN m.metric_id END) as "Cycle Time",
    COUNT(DISTINCT CASE WHEN m.metric_type = 'cost' THEN m.metric_id END) as "Cost"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code
LEFT JOIN process_metrics m ON p.process_code = m.process_code AND m.is_active = TRUE
GROUP BY c.category_code, c.category_name
ORDER BY c.category_code;

-- ============================================================================
-- Report 4: Measurement Frequency Analysis
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Metrics by Measurement Frequency'
UNION ALL SELECT '============================================================================';

SELECT
    COALESCE(m.measurement_frequency, 'Not Specified') as "Frequency",
    COUNT(*) as "Metric Count",
    COUNT(DISTINCT m.process_code) as "Process Count",
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM process_metrics WHERE is_active = TRUE), 1) as "% of Total"
FROM process_metrics m
WHERE m.is_active = TRUE
GROUP BY m.measurement_frequency
ORDER BY COUNT(*) DESC;

-- ============================================================================
-- Report 5: Target vs Benchmark Comparison
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Target vs Industry Benchmark Comparison'
UNION ALL SELECT '============================================================================';

SELECT
    p.process_code as "Process Code",
    p.process_name as "Process Name",
    m.metric_name as "Metric",
    m.target_value as "Target",
    m.industry_benchmark as "Benchmark",
    m.unit_of_measure as "Unit",
    CASE
        WHEN m.target_value IS NULL OR m.industry_benchmark IS NULL THEN 'N/A'
        WHEN m.target_value < m.industry_benchmark THEN 'Better than Benchmark'
        WHEN m.target_value > m.industry_benchmark THEN 'Below Benchmark'
        ELSE 'At Benchmark'
    END as "Comparison"
FROM processes p
INNER JOIN process_metrics m ON p.process_code = m.process_code
WHERE m.is_active = TRUE
  AND m.target_value IS NOT NULL
  AND m.industry_benchmark IS NOT NULL
ORDER BY p.process_code, m.metric_name;

-- ============================================================================
-- Report 6: Processes Without Metrics
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Processes Without Defined Metrics'
UNION ALL SELECT '============================================================================';

SELECT
    p.process_code as "Process Code",
    p.process_name as "Process Name",
    c.category_name as "Category",
    p.process_type as "Type",
    p.hierarchy_level as "Level"
FROM processes p
LEFT JOIN process_categories c ON p.category_code = c.category_code
WHERE p.is_active = TRUE
  AND p.hierarchy_level = 3  -- Only leaf processes
  AND NOT EXISTS (
      SELECT 1 FROM process_metrics m
      WHERE m.process_code = p.process_code AND m.is_active = TRUE
  )
ORDER BY p.process_code
LIMIT 50;

-- ============================================================================
-- Report 7: Metric Coverage Analysis
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Metric Coverage by Category'
UNION ALL SELECT '============================================================================';

SELECT
    c.category_name as "Category",
    COUNT(DISTINCT p.process_id) as "Total Processes",
    COUNT(DISTINCT CASE WHEN m.metric_id IS NOT NULL THEN p.process_id END) as "With Metrics",
    ROUND(
        COUNT(DISTINCT CASE WHEN m.metric_id IS NOT NULL THEN p.process_id END) * 100.0 /
        NULLIF(COUNT(DISTINCT p.process_id), 0),
        1
    ) as "% Coverage"
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code AND p.hierarchy_level = 3 AND p.is_active = TRUE
LEFT JOIN process_metrics m ON p.process_code = m.process_code AND m.is_active = TRUE
GROUP BY c.category_code, c.category_name
ORDER BY c.category_code;

-- ============================================================================
-- Summary Statistics
-- ============================================================================

SELECT '' as line
UNION ALL SELECT '============================================================================'
UNION ALL SELECT 'Metrics Summary Statistics'
UNION ALL SELECT '============================================================================';

SELECT
    'Total Active Metrics' as "Metric",
    COUNT(*)::TEXT as "Value"
FROM process_metrics
WHERE is_active = TRUE

UNION ALL

SELECT
    'Processes with Metrics',
    COUNT(DISTINCT process_code)::TEXT
FROM process_metrics
WHERE is_active = TRUE

UNION ALL

SELECT
    'Avg Metrics per Process',
    ROUND(COUNT(*)::NUMERIC / NULLIF(COUNT(DISTINCT process_code), 0), 2)::TEXT
FROM process_metrics
WHERE is_active = TRUE

UNION ALL

SELECT
    'Metrics with Target Values',
    COUNT(*)::TEXT
FROM process_metrics
WHERE is_active = TRUE AND target_value IS NOT NULL

UNION ALL

SELECT
    'Metrics with Benchmarks',
    COUNT(*)::TEXT
FROM process_metrics
WHERE is_active = TRUE AND industry_benchmark IS NOT NULL;

-- ============================================================================
