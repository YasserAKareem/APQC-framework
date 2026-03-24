-- ============================================================================
-- APQC Process Classification Framework (PCF) - Cross Industry v7.2.1
-- Database Schema Definition
-- ============================================================================
--
-- This schema represents the APQC Process Classification Framework which
-- provides a common process model for organizations to use as a standard
-- for process improvement, benchmarking, and best practice sharing.
--
-- Version: 7.2.1
-- Framework: Cross Industry
-- Created: 2026-03-24
-- Database: PostgreSQL / MySQL / SQL Server compatible
--
-- ============================================================================

-- Drop existing tables if they exist (in reverse order of dependencies)
DROP TABLE IF EXISTS process_relationships CASCADE;
DROP TABLE IF EXISTS process_metrics CASCADE;
DROP TABLE IF EXISTS processes CASCADE;
DROP TABLE IF EXISTS process_categories CASCADE;
DROP TABLE IF EXISTS framework_metadata CASCADE;

-- ============================================================================
-- Framework Metadata Table
-- ============================================================================
-- Stores metadata about the APQC framework version and general information

CREATE TABLE framework_metadata (
    id INTEGER PRIMARY KEY,
    framework_name VARCHAR(255) NOT NULL,
    framework_version VARCHAR(50) NOT NULL,
    industry_type VARCHAR(100) NOT NULL,
    release_date DATE,
    description TEXT,
    source_system VARCHAR(100),
    import_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on framework version
CREATE INDEX idx_framework_version ON framework_metadata(framework_version);

-- ============================================================================
-- Process Categories Table
-- ============================================================================
-- Stores the top-level process categories (Level 1) in the APQC framework
-- These are the major operating and management support categories

CREATE TABLE process_categories (
    category_id INTEGER PRIMARY KEY,
    category_code VARCHAR(10) NOT NULL UNIQUE,
    category_name VARCHAR(255) NOT NULL,
    category_description TEXT,
    category_type VARCHAR(50), -- 'Operating' or 'Management and Support'
    sort_order INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for efficient querying
CREATE INDEX idx_category_code ON process_categories(category_code);
CREATE INDEX idx_category_type ON process_categories(category_type);

-- ============================================================================
-- Processes Table
-- ============================================================================
-- Main table storing all APQC processes across all hierarchy levels
-- Uses a self-referential design to maintain parent-child relationships

CREATE TABLE processes (
    process_id VARCHAR(50) PRIMARY KEY,
    process_code VARCHAR(20) NOT NULL UNIQUE,
    process_name VARCHAR(500) NOT NULL,
    process_description TEXT,
    process_number VARCHAR(20),
    internal_id VARCHAR(50),

    -- Hierarchy information
    hierarchy_level INTEGER NOT NULL,
    parent_process_code VARCHAR(20),
    category_code VARCHAR(10),

    -- Process classification
    process_type VARCHAR(50), -- 'Category', 'Process Group', 'Process', 'Activity', 'Task'
    is_leaf_node BOOLEAN DEFAULT FALSE,

    -- Metadata
    sort_order INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraints
    FOREIGN KEY (parent_process_code) REFERENCES processes(process_code) ON DELETE SET NULL,
    FOREIGN KEY (category_code) REFERENCES process_categories(category_code) ON DELETE SET NULL
);

-- Create indexes for efficient querying and joins
CREATE INDEX idx_process_code ON processes(process_code);
CREATE INDEX idx_process_number ON processes(process_number);
CREATE INDEX idx_hierarchy_level ON processes(hierarchy_level);
CREATE INDEX idx_parent_process ON processes(parent_process_code);
CREATE INDEX idx_category_ref ON processes(category_code);
CREATE INDEX idx_process_type ON processes(process_type);
CREATE INDEX idx_is_active ON processes(is_active);
CREATE INDEX idx_process_name ON processes(process_name);

-- Create a composite index for hierarchical queries
CREATE INDEX idx_hierarchy_composite ON processes(category_code, hierarchy_level, sort_order);

-- ============================================================================
-- Process Relationships Table
-- ============================================================================
-- Stores explicit relationships between processes beyond parent-child
-- Allows for documenting dependencies, interfaces, and other relationships

CREATE TABLE process_relationships (
    relationship_id SERIAL PRIMARY KEY,
    source_process_code VARCHAR(20) NOT NULL,
    target_process_code VARCHAR(20) NOT NULL,
    relationship_type VARCHAR(50) NOT NULL, -- 'depends_on', 'interfaces_with', 'enables', etc.
    relationship_description TEXT,
    strength VARCHAR(20), -- 'strong', 'medium', 'weak'
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (source_process_code) REFERENCES processes(process_code) ON DELETE CASCADE,
    FOREIGN KEY (target_process_code) REFERENCES processes(process_code) ON DELETE CASCADE,

    -- Ensure no duplicate relationships
    UNIQUE(source_process_code, target_process_code, relationship_type)
);

-- Create indexes for relationship queries
CREATE INDEX idx_source_process ON process_relationships(source_process_code);
CREATE INDEX idx_target_process ON process_relationships(target_process_code);
CREATE INDEX idx_relationship_type ON process_relationships(relationship_type);

-- ============================================================================
-- Process Metrics Table
-- ============================================================================
-- Stores performance metrics and KPIs associated with each process
-- Allows organizations to track and benchmark process performance

CREATE TABLE process_metrics (
    metric_id SERIAL PRIMARY KEY,
    process_code VARCHAR(20) NOT NULL,
    metric_name VARCHAR(255) NOT NULL,
    metric_description TEXT,
    metric_type VARCHAR(50), -- 'efficiency', 'effectiveness', 'quality', 'cycle_time', 'cost'
    unit_of_measure VARCHAR(50),
    target_value DECIMAL(15,2),
    industry_benchmark DECIMAL(15,2),
    data_source VARCHAR(100),
    measurement_frequency VARCHAR(50), -- 'daily', 'weekly', 'monthly', 'quarterly', 'annually'
    is_active BOOLEAN DEFAULT TRUE,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (process_code) REFERENCES processes(process_code) ON DELETE CASCADE
);

-- Create indexes for metric queries
CREATE INDEX idx_metric_process ON process_metrics(process_code);
CREATE INDEX idx_metric_type ON process_metrics(metric_type);
CREATE INDEX idx_metric_active ON process_metrics(is_active);

-- ============================================================================
-- Comments and Notes
-- ============================================================================
--
-- Design Decisions:
-- 1. VARCHAR sizes are chosen to accommodate APQC naming conventions
-- 2. Timestamps use DEFAULT CURRENT_TIMESTAMP for automatic tracking
-- 3. Foreign keys use appropriate CASCADE/SET NULL based on business rules
-- 4. Indexes are created on commonly queried and joined columns
-- 5. The schema is designed to be compatible with PostgreSQL, MySQL, and SQL Server
--    with minimal modifications
--
-- Hierarchy Levels:
-- Level 1: Categories (e.g., "1.0 Develop Vision and Strategy")
-- Level 2: Process Groups (e.g., "1.1 Define the business concept")
-- Level 3: Processes (e.g., "1.1.1 Assess the external environment")
-- Level 4: Activities (if applicable)
-- Level 5+: Tasks and sub-tasks (if applicable)
--
-- ============================================================================
