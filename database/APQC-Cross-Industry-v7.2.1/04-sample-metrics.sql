-- ============================================================================
-- APQC Process Classification Framework (PCF) - Cross Industry v7.2.1
-- Sample Metrics and KPIs
-- ============================================================================
--
-- This file contains sample metrics that can be associated with APQC processes
-- These are examples that organizations can use as a starting point
--
-- ============================================================================

-- ============================================================================
-- Sample Process Metrics
-- ============================================================================

BEGIN;

-- Metrics for "1.1.1 Assess the external environment"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('1.1.1', 'Market Analysis Cycle Time', 'Time to complete external market analysis', 'cycle_time', 'days', 'quarterly'),
    ('1.1.1', 'Competitor Analysis Coverage', 'Percentage of key competitors analyzed', 'effectiveness', 'percentage', 'quarterly'),
    ('1.1.1', 'External Scan Completeness', 'Completeness of external environment assessment', 'quality', 'percentage', 'quarterly');

-- Metrics for "2.3.3 Design and develop product"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('2.3.3', 'Product Development Cycle Time', 'Average time from concept to launch', 'cycle_time', 'days', 'monthly'),
    ('2.3.3', 'First-Time Design Quality', 'Percentage of designs approved without rework', 'quality', 'percentage', 'monthly'),
    ('2.3.3', 'Product Development Cost', 'Average cost per product developed', 'cost', 'USD', 'monthly'),
    ('2.3.3', 'Time to Market', 'Time from product approval to market launch', 'cycle_time', 'days', 'monthly');

-- Metrics for "3.5.5 Process sales orders"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('3.5.5', 'Order Processing Time', 'Average time to process a sales order', 'cycle_time', 'hours', 'daily'),
    ('3.5.5', 'Order Accuracy Rate', 'Percentage of orders processed without errors', 'quality', 'percentage', 'daily'),
    ('3.5.5', 'Orders Processed Per Employee', 'Number of orders processed per employee per day', 'efficiency', 'count', 'daily'),
    ('3.5.5', 'Order Processing Cost', 'Average cost to process one order', 'cost', 'USD', 'weekly');

-- Metrics for "4.2.1 Select suppliers and develop/maintain contracts"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('4.2.1', 'Supplier Selection Cycle Time', 'Time to select and onboard a new supplier', 'cycle_time', 'days', 'monthly'),
    ('4.2.1', 'Contract Compliance Rate', 'Percentage of suppliers meeting contract terms', 'effectiveness', 'percentage', 'monthly'),
    ('4.2.1', 'Supplier Evaluation Score', 'Average score from supplier evaluations', 'quality', 'score', 'quarterly'),
    ('4.2.1', 'Active Suppliers Count', 'Number of active suppliers in the supply chain', 'efficiency', 'count', 'monthly');

-- Metrics for "6.2.2 Handle customer inquiries and requests"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('6.2.2', 'First Call Resolution Rate', 'Percentage of inquiries resolved on first contact', 'effectiveness', 'percentage', 'daily'),
    ('6.2.2', 'Average Handle Time', 'Average time to handle a customer inquiry', 'cycle_time', 'minutes', 'daily'),
    ('6.2.2', 'Customer Satisfaction Score', 'CSAT score for inquiry handling', 'quality', 'score', 'weekly'),
    ('6.2.2', 'Inquiry Response Time', 'Average time to first response', 'cycle_time', 'minutes', 'daily');

-- Metrics for "8.2.1 Manage accounts payable"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('8.2.1', 'Invoice Processing Time', 'Average time to process an invoice', 'cycle_time', 'days', 'weekly'),
    ('8.2.1', 'Invoice Accuracy Rate', 'Percentage of invoices processed without errors', 'quality', 'percentage', 'weekly'),
    ('8.2.1', 'Cost Per Invoice Processed', 'Average cost to process one invoice', 'cost', 'USD', 'monthly'),
    ('8.2.1', 'Early Payment Discount Capture Rate', 'Percentage of available discounts captured', 'effectiveness', 'percentage', 'monthly');

-- Metrics for "10.1.2 Manage employee onboarding"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('10.1.2', 'Time to Productivity', 'Days until new hire reaches full productivity', 'cycle_time', 'days', 'monthly'),
    ('10.1.2', 'Onboarding Completion Rate', 'Percentage of onboarding tasks completed on time', 'effectiveness', 'percentage', 'monthly'),
    ('10.1.2', 'New Hire Satisfaction', 'New employee satisfaction with onboarding', 'quality', 'score', 'monthly'),
    ('10.1.2', 'Onboarding Cost Per Employee', 'Average cost to onboard one employee', 'cost', 'USD', 'quarterly');

-- Metrics for "11.1.1 Develop and maintain IT services and solutions strategy"
INSERT INTO process_metrics (
    process_code, metric_name, metric_description, metric_type,
    unit_of_measure, measurement_frequency
) VALUES
    ('11.1.1', 'IT Strategy Alignment Score', 'Alignment of IT strategy with business strategy', 'effectiveness', 'score', 'quarterly'),
    ('11.1.1', 'IT Innovation Investment', 'Percentage of IT budget allocated to innovation', 'cost', 'percentage', 'quarterly'),
    ('11.1.1', 'Strategy Review Cycle Time', 'Time between IT strategy reviews', 'cycle_time', 'days', 'annually');

COMMIT;

-- ============================================================================
-- Query to view all metrics by process
-- ============================================================================

-- View all metrics for a specific process
-- SELECT
--     pm.metric_name,
--     pm.metric_description,
--     pm.metric_type,
--     pm.unit_of_measure,
--     pm.measurement_frequency,
--     p.process_name
-- FROM process_metrics pm
-- JOIN processes p ON pm.process_code = p.process_code
-- WHERE pm.process_code = '3.5.5';

-- ============================================================================
