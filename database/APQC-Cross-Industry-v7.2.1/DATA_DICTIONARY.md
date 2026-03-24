# APQC PCF Database - Data Dictionary
## Cross Industry v7.2.1

### Document Information
- **Version:** 1.0
- **Date:** 2026-03-24
- **Framework Version:** APQC PCF 7.2.1
- **Industry:** Cross Industry

---

## Table Overview

The APQC PCF database consists of 5 main tables:

1. **framework_metadata** - Framework version and metadata
2. **process_categories** - Top-level process categories (Level 1)
3. **processes** - All processes across hierarchy
4. **process_relationships** - Inter-process relationships
5. **process_metrics** - Performance metrics and KPIs

---

## Table: framework_metadata

**Purpose:** Stores metadata about the APQC framework version and general information.

**Row Count:** 1 (single record for framework version)

| Column Name | Data Type | Nullable | Default | Description |
|-------------|-----------|----------|---------|-------------|
| id | INTEGER | NO | - | Primary key identifier |
| framework_name | VARCHAR(255) | NO | - | Full name of the framework (e.g., "APQC Process Classification Framework") |
| framework_version | VARCHAR(50) | NO | - | Version number in semantic versioning format (e.g., "7.2.1") |
| industry_type | VARCHAR(100) | NO | - | Industry classification: "Cross Industry" or specific industry name |
| release_date | DATE | YES | - | Official release date of this framework version |
| description | TEXT | YES | - | Comprehensive description of the framework and its purpose |
| source_system | VARCHAR(100) | YES | - | System from which data was extracted (e.g., "HOPEX V3.00.02") |
| import_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Timestamp when data was imported into this database |
| last_updated | TIMESTAMP | YES | CURRENT_TIMESTAMP | Timestamp of last update to this record |

**Primary Key:** id

**Indexes:**
- `idx_framework_version` on framework_version

**Sample Data:**
```sql
id: 1
framework_name: "APQC Process Classification Framework"
framework_version: "7.2.1"
industry_type: "Cross Industry"
release_date: 2019-12-18
```

---

## Table: process_categories

**Purpose:** Stores the top-level process categories (Level 1) in the APQC framework. These represent the highest level of process classification.

**Row Count:** 13 (6 Operating + 7 Management and Support categories)

| Column Name | Data Type | Nullable | Default | Description |
|-------------|-----------|----------|---------|-------------|
| category_id | INTEGER | NO | - | Primary key identifier |
| category_code | VARCHAR(10) | NO | - | Unique category code in format "X.0" (e.g., "1.0", "2.0") |
| category_name | VARCHAR(255) | NO | - | Full name of the category |
| category_description | TEXT | YES | - | Detailed description of the category scope and purpose |
| category_type | VARCHAR(50) | YES | - | Type of category: "Operating" (1.0-6.0) or "Management and Support" (7.0-13.0) |
| sort_order | INTEGER | YES | - | Display order for UI presentation |
| created_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Record creation timestamp |
| modified_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Last modification timestamp |

**Primary Key:** category_id

**Unique Constraints:** category_code

**Indexes:**
- `idx_category_code` on category_code
- `idx_category_type` on category_type

**Sample Data:**
```sql
category_id: 1
category_code: "1.0"
category_name: "Develop Vision and Strategy"
category_type: "Operating"
```

**Business Rules:**
- Category codes must end with ".0"
- Operating categories: 1.0 through 6.0
- Management and Support categories: 7.0 through 13.0
- category_code must be unique across all records

---

## Table: processes

**Purpose:** Main table storing all APQC processes across all hierarchy levels (1, 2, and 3). Uses self-referential design to maintain parent-child relationships.

**Row Count:** 413 (13 Level 1 + 72 Level 2 + 328 Level 3)

| Column Name | Data Type | Nullable | Default | Description |
|-------------|-----------|----------|---------|-------------|
| process_id | VARCHAR(50) | NO | - | Primary key in format "APQC_CI_X_Y_Z" where X_Y_Z is derived from process_code |
| process_code | VARCHAR(20) | NO | - | Unique hierarchical code (e.g., "1.1.1", "3.5.2") |
| process_name | VARCHAR(500) | NO | - | Full descriptive name of the process |
| process_description | TEXT | YES | - | Detailed description of process scope, objectives, and activities |
| process_number | VARCHAR(20) | YES | - | APQC internal reference number |
| internal_id | VARCHAR(50) | YES | - | APQC internal system identifier from source system |
| hierarchy_level | INTEGER | NO | - | Depth in hierarchy: 1 (Category), 2 (Process Group), 3 (Process) |
| parent_process_code | VARCHAR(20) | YES | - | Foreign key to parent process (NULL for Level 1) |
| category_code | VARCHAR(10) | YES | - | Foreign key to owning category |
| process_type | VARCHAR(50) | YES | - | Type classification: "Category", "Process Group", "Process", "Activity", "Task" |
| is_leaf_node | BOOLEAN | YES | FALSE | TRUE if process has no children; FALSE otherwise |
| sort_order | INTEGER | YES | - | Display order for hierarchical presentation |
| is_active | BOOLEAN | YES | TRUE | Active status flag; FALSE for deprecated processes |
| created_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Record creation timestamp |
| modified_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Last modification timestamp |

**Primary Key:** process_id

**Unique Constraints:** process_code

**Foreign Keys:**
- parent_process_code → processes(process_code) ON DELETE SET NULL
- category_code → process_categories(category_code) ON DELETE SET NULL

**Indexes:**
- `idx_process_code` on process_code
- `idx_process_number` on process_number
- `idx_hierarchy_level` on hierarchy_level
- `idx_parent_process` on parent_process_code
- `idx_category_ref` on category_code
- `idx_process_type` on process_type
- `idx_is_active` on is_active
- `idx_process_name` on process_name
- `idx_hierarchy_composite` on (category_code, hierarchy_level, sort_order)

**Sample Data:**
```sql
-- Level 1 (Category)
process_id: "APQC_CI_1_0"
process_code: "1.0"
process_name: "Develop Vision and Strategy"
hierarchy_level: 1
parent_process_code: NULL
category_code: "1.0"
process_type: "Category"
is_leaf_node: FALSE

-- Level 2 (Process Group)
process_id: "APQC_CI_1_1"
process_code: "1.1"
process_name: "Define the business concept and long-term vision"
hierarchy_level: 2
parent_process_code: "1.0"
category_code: "1.0"
process_type: "Process Group"
is_leaf_node: FALSE

-- Level 3 (Process)
process_id: "APQC_CI_1_1_1"
process_code: "1.1.1"
process_name: "Assess the external environment"
hierarchy_level: 3
parent_process_code: "1.1"
category_code: "1.0"
process_type: "Process"
is_leaf_node: TRUE
```

**Business Rules:**
- process_code must be unique
- Level 1 processes (categories) must have parent_process_code = NULL
- Level 2+ processes must have a valid parent_process_code
- category_code must match the first part of process_code
- is_leaf_node should be TRUE only if no child processes exist
- Hierarchy levels: 1 = Category, 2 = Process Group, 3 = Process
- Process codes follow dot notation: "X.0" (L1), "X.Y" (L2), "X.Y.Z" (L3)

**Validation Queries:**
```sql
-- Check for orphaned processes
SELECT * FROM processes
WHERE parent_process_code IS NOT NULL
  AND parent_process_code NOT IN (SELECT process_code FROM processes);

-- Verify is_leaf_node consistency
SELECT p1.process_code, p1.is_leaf_node, COUNT(p2.process_id) as child_count
FROM processes p1
LEFT JOIN processes p2 ON p1.process_code = p2.parent_process_code
GROUP BY p1.process_code, p1.is_leaf_node
HAVING (p1.is_leaf_node = TRUE AND COUNT(p2.process_id) > 0)
    OR (p1.is_leaf_node = FALSE AND COUNT(p2.process_id) = 0);
```

---

## Table: process_relationships

**Purpose:** Stores explicit relationships between processes beyond parent-child. Enables documenting dependencies, interfaces, and other process interactions.

**Row Count:** Variable (initially 0, grows as relationships are documented)

| Column Name | Data Type | Nullable | Default | Description |
|-------------|-----------|----------|---------|-------------|
| relationship_id | SERIAL | NO | auto-increment | Primary key (auto-incrementing) |
| source_process_code | VARCHAR(20) | NO | - | Foreign key to source process |
| target_process_code | VARCHAR(20) | NO | - | Foreign key to target process |
| relationship_type | VARCHAR(50) | NO | - | Type of relationship (see valid types below) |
| relationship_description | TEXT | YES | - | Detailed description of the relationship |
| strength | VARCHAR(20) | YES | - | Relationship strength: "strong", "medium", "weak" |
| created_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Record creation timestamp |

**Primary Key:** relationship_id

**Unique Constraints:** (source_process_code, target_process_code, relationship_type)

**Foreign Keys:**
- source_process_code → processes(process_code) ON DELETE CASCADE
- target_process_code → processes(process_code) ON DELETE CASCADE

**Indexes:**
- `idx_source_process` on source_process_code
- `idx_target_process` on target_process_code
- `idx_relationship_type` on relationship_type

**Valid Relationship Types:**
- `depends_on` - Source process depends on target process
- `interfaces_with` - Processes exchange information or materials
- `enables` - Source process enables or facilitates target process
- `precedes` - Source process occurs before target process
- `supports` - Source process supports target process
- `conflicts_with` - Processes may have conflicting objectives
- `complements` - Processes work together synergistically

**Valid Strength Values:**
- `strong` - Critical, tightly coupled relationship
- `medium` - Important but not critical relationship
- `weak` - Loose, optional relationship

**Sample Data:**
```sql
relationship_id: 1
source_process_code: "3.5.5"
target_process_code: "4.2.1"
relationship_type: "depends_on"
relationship_description: "Order processing depends on supplier management"
strength: "strong"
```

**Business Rules:**
- source_process_code and target_process_code must be different
- No duplicate relationships (same source, target, and type)
- Both processes must exist and be active
- Bidirectional relationships require two records

---

## Table: process_metrics

**Purpose:** Stores performance metrics and KPIs associated with each process. Enables process measurement, benchmarking, and continuous improvement.

**Row Count:** Variable (sample data included, expandable)

| Column Name | Data Type | Nullable | Default | Description |
|-------------|-----------|----------|---------|-------------|
| metric_id | SERIAL | NO | auto-increment | Primary key (auto-incrementing) |
| process_code | VARCHAR(20) | NO | - | Foreign key to associated process |
| metric_name | VARCHAR(255) | NO | - | Name of the metric or KPI |
| metric_description | TEXT | YES | - | Detailed description of what the metric measures |
| metric_type | VARCHAR(50) | YES | - | Category of metric (see valid types below) |
| unit_of_measure | VARCHAR(50) | YES | - | Unit (e.g., "days", "percentage", "USD", "count") |
| target_value | DECIMAL(15,2) | YES | - | Target or goal value for the metric |
| industry_benchmark | DECIMAL(15,2) | YES | - | Industry average or benchmark value |
| data_source | VARCHAR(100) | YES | - | Where measurement data originates |
| measurement_frequency | VARCHAR(50) | YES | - | How often measured (see valid frequencies below) |
| is_active | BOOLEAN | YES | TRUE | Active status flag |
| created_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Record creation timestamp |
| modified_date | TIMESTAMP | YES | CURRENT_TIMESTAMP | Last modification timestamp |

**Primary Key:** metric_id

**Foreign Keys:**
- process_code → processes(process_code) ON DELETE CASCADE

**Indexes:**
- `idx_metric_process` on process_code
- `idx_metric_type` on metric_type
- `idx_metric_active` on is_active

**Valid Metric Types:**
- `efficiency` - Resource utilization metrics (e.g., orders per employee)
- `effectiveness` - Goal achievement metrics (e.g., first call resolution rate)
- `quality` - Accuracy and correctness metrics (e.g., error rate)
- `cycle_time` - Duration and speed metrics (e.g., time to process)
- `cost` - Financial impact metrics (e.g., cost per transaction)

**Valid Measurement Frequencies:**
- `real-time` - Continuous measurement
- `hourly` - Measured every hour
- `daily` - Measured every day
- `weekly` - Measured once per week
- `monthly` - Measured once per month
- `quarterly` - Measured once per quarter
- `annually` - Measured once per year
- `on-demand` - Measured as needed

**Sample Data:**
```sql
metric_id: 1
process_code: "3.5.5"
metric_name: "Order Processing Time"
metric_description: "Average time to process a sales order"
metric_type: "cycle_time"
unit_of_measure: "hours"
target_value: 4.00
industry_benchmark: 6.00
measurement_frequency: "daily"
is_active: TRUE
```

**Business Rules:**
- metric_name should be unique per process_code
- target_value and industry_benchmark should be in the same unit_of_measure
- Inactive metrics (is_active = FALSE) should not be used for current reporting
- metric_type and unit_of_measure should be logically consistent

---

## Database Views

### process_hierarchy_view

**Purpose:** Complete hierarchical view with full path navigation

**Columns:**
- All columns from processes table
- category_name, category_type from process_categories
- full_path (computed) - Human-readable navigation path

**Usage:**
```sql
SELECT * FROM process_hierarchy_view WHERE hierarchy_level = 3;
```

---

### category_summary

**Purpose:** Summary statistics for each category

**Columns:**
- category_id, category_code, category_name, category_type
- process_group_count - Count of Level 2 processes
- process_count - Count of Level 3 processes
- total_subordinate_count - Total count of all subordinate processes

**Usage:**
```sql
SELECT * FROM category_summary ORDER BY category_code;
```

---

### leaf_processes

**Purpose:** All leaf-level processes (no children)

**Columns:**
- process_id, process_code, process_name, process_description
- hierarchy_level, category_code, category_name, process_type

**Usage:**
```sql
SELECT * FROM leaf_processes WHERE category_code = '3.0';
```

---

### process_tree

**Purpose:** Recursive CTE for complete tree navigation

**Columns:**
- process_id, process_code, process_name
- hierarchy_level, parent_process_code, root_code
- path (computed) - Full hierarchical path
- code_path (computed) - Full code path
- depth - Depth from root

**Usage:**
```sql
SELECT * FROM process_tree WHERE process_code = '1.1.1';
```

---

## Data Integrity Rules

### Referential Integrity

1. **process_categories ← processes**
   - All processes must reference a valid category
   - Deleting a category sets processes.category_code to NULL

2. **processes ← processes (self-reference)**
   - All non-Level 1 processes must reference a valid parent
   - Deleting a parent sets children's parent_process_code to NULL

3. **processes ← process_relationships**
   - All relationships must reference valid processes
   - Deleting a process cascades to delete its relationships

4. **processes ← process_metrics**
   - All metrics must reference a valid process
   - Deleting a process cascades to delete its metrics

### Business Logic Constraints

1. **Hierarchy Consistency**
   - Level 1 processes have no parent
   - Level 2+ processes must have a parent at level (n-1)
   - category_code must match process_code prefix

2. **Code Format**
   - Level 1: "X.0" format
   - Level 2: "X.Y" format (X matches category)
   - Level 3: "X.Y.Z" format (X.Y matches parent)

3. **Leaf Node Consistency**
   - is_leaf_node = TRUE only if no children exist
   - Should be maintained via triggers or application logic

---

## Maintenance Procedures

### Regular Checks

```sql
-- 1. Orphaned processes check
SELECT * FROM processes
WHERE parent_process_code IS NOT NULL
  AND parent_process_code NOT IN (SELECT process_code FROM processes);

-- 2. Invalid category references
SELECT * FROM processes
WHERE category_code NOT IN (SELECT category_code FROM process_categories);

-- 3. Leaf node consistency
SELECT p1.process_code, p1.is_leaf_node, COUNT(p2.process_id) as children
FROM processes p1
LEFT JOIN processes p2 ON p1.process_code = p2.parent_process_code
GROUP BY p1.process_code, p1.is_leaf_node
HAVING (p1.is_leaf_node = TRUE AND COUNT(p2.process_id) > 0);

-- 4. Record counts
SELECT 'Categories' as entity, COUNT(*) as count FROM process_categories
UNION ALL SELECT 'Processes', COUNT(*) FROM processes
UNION ALL SELECT 'Relationships', COUNT(*) FROM process_relationships
UNION ALL SELECT 'Metrics', COUNT(*) FROM process_metrics;
```

---

## Change Log

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-03-24 | System | Initial data dictionary creation |

---

**End of Data Dictionary**
