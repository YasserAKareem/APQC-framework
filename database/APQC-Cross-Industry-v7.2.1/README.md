# APQC Process Classification Framework (PCF) Database
## Cross Industry v7.2.1

### Complete Database Documentation Package

---

## Table of Contents

1. [Overview](#overview)
2. [Database Schema](#database-schema)
3. [Installation Guide](#installation-guide)
4. [Data Dictionary](#data-dictionary)
5. [Usage Examples](#usage-examples)
6. [Best Practices](#best-practices)
7. [Maintenance](#maintenance)
8. [Appendix](#appendix)

---

## Overview

### What is APQC PCF?

The APQC Process Classification Framework (PCF) is a reliable and robust framework used by thousands of organizations worldwide. It allows organizations to objectively benchmark their processes against others, regardless of industry, size, or geography.

### Database Statistics

- **Framework Version:** 7.2.1
- **Industry Type:** Cross Industry
- **Total Processes:** 413
- **Hierarchy Levels:** 3
- **Categories:** 13 (6 Operating + 7 Management & Support)
- **Process Groups:** 72
- **Detailed Processes:** 328

### Framework Structure

The APQC PCF is organized in a hierarchical structure:

1. **Level 1 - Categories:** High-level process categories (e.g., "1.0 Develop Vision and Strategy")
2. **Level 2 - Process Groups:** Logical groupings of related processes (e.g., "1.1 Define the business concept")
3. **Level 3 - Processes:** Detailed process definitions (e.g., "1.1.1 Assess the external environment")

### Operating vs Management & Support Categories

**Operating Categories (1.0 - 6.0):**
- 1.0 Develop Vision and Strategy
- 2.0 Develop and Manage Products and Services
- 3.0 Market and Sell Products and Services
- 4.0 Deliver Physical Products
- 5.0 Deliver Services
- 6.0 Manage Customer Service

**Management and Support Categories (7.0 - 13.0):**
- 7.0 Develop and Manage Human Capital
- 8.0 Manage Financial Resources
- 9.0 Acquire, Construct, and Manage Assets
- 10.0 Manage Enterprise Risk, Compliance, Remediation, and Resiliency
- 11.0 Manage External Relationships
- 12.0 Develop and Manage Business Capabilities
- 13.0 Measure and Benchmark

---

## Database Schema

### Entity Relationship Diagram (ERD)

```
┌─────────────────────────────┐
│   framework_metadata         │
│─────────────────────────────│
│ + id (PK)                   │
│   framework_name            │
│   framework_version         │
│   industry_type             │
│   release_date              │
│   description               │
│   source_system             │
│   import_date               │
│   last_updated              │
└─────────────────────────────┘

┌─────────────────────────────┐
│   process_categories         │
│─────────────────────────────│
│ + category_id (PK)          │
│ * category_code (UK)        │
│   category_name             │
│   category_description      │
│   category_type             │
│   sort_order                │
│   created_date              │
│   modified_date             │
└─────────────────────────────┘
           │
           │ 1:N
           ▼
┌─────────────────────────────┐
│        processes             │
│─────────────────────────────│
│ + process_id (PK)           │
│ * process_code (UK)         │
│   process_name              │
│   process_description       │
│   process_number            │
│   internal_id               │
│   hierarchy_level           │
│   parent_process_code (FK)  │◄─┐
│   category_code (FK)        │  │
│   process_type              │  │ Self-referencing
│   is_leaf_node              │  │ for hierarchy
│   sort_order                │  │
│   is_active                 │  │
│   created_date              │  │
│   modified_date             │──┘
└─────────────────────────────┘
           │ 1:N
           ▼
┌─────────────────────────────┐
│   process_relationships      │
│─────────────────────────────│
│ + relationship_id (PK)      │
│   source_process_code (FK)  │
│   target_process_code (FK)  │
│   relationship_type         │
│   relationship_description  │
│   strength                  │
│   created_date              │
└─────────────────────────────┘

┌─────────────────────────────┐
│     process_metrics          │
│─────────────────────────────│
│ + metric_id (PK)            │
│   process_code (FK)         │
│   metric_name               │
│   metric_description        │
│   metric_type               │
│   unit_of_measure           │
│   target_value              │
│   industry_benchmark        │
│   data_source               │
│   measurement_frequency     │
│   is_active                 │
│   created_date              │
│   modified_date             │
└─────────────────────────────┘
```

### Table Descriptions

#### 1. framework_metadata
Stores metadata about the APQC framework version and general information.

#### 2. process_categories
Stores the top-level process categories (Level 1) in the APQC framework.

#### 3. processes
Main table storing all APQC processes across all hierarchy levels. Uses a self-referential design to maintain parent-child relationships.

#### 4. process_relationships
Stores explicit relationships between processes beyond parent-child (e.g., dependencies, interfaces).

#### 5. process_metrics
Stores performance metrics and KPIs associated with each process.

---

## Installation Guide

### Prerequisites

Choose one of the following database systems:
- **PostgreSQL** 10 or higher
- **MySQL** 5.7 or higher (or MariaDB 10.2+)
- **SQL Server** 2016 or higher

Ensure you have:
- Database administrator access
- Appropriate client tools installed (psql, mysql, or sqlcmd)
- At least 50MB of available disk space

### Quick Start Installation

1. **Clone or download the database files:**
   ```bash
   cd database/APQC-Cross-Industry-v7.2.1
   ```

2. **Run the automated setup script:**
   ```bash
   ./setup_database.sh [database_type] [database_name]
   ```

   Examples:
   ```bash
   # PostgreSQL (default)
   ./setup_database.sh postgresql apqc_pcf

   # MySQL
   ./setup_database.sh mysql apqc_pcf

   # SQL Server
   ./setup_database.sh sqlserver apqc_pcf
   ```

3. **Follow the prompts** to enter connection information.

### Manual Installation

If you prefer to install manually or the script doesn't work for your environment:

#### PostgreSQL

```bash
# Create database
createdb apqc_pcf

# Run scripts in order
psql -d apqc_pcf -f 01-schema.sql
psql -d apqc_pcf -f 02-data.sql
psql -d apqc_pcf -f 03-views.sql
psql -d apqc_pcf -f 04-sample-metrics.sql
```

#### MySQL

```bash
# Create database
mysql -u root -p -e "CREATE DATABASE apqc_pcf;"

# Run scripts in order
mysql -u root -p apqc_pcf < 01-schema.sql
mysql -u root -p apqc_pcf < 02-data.sql
mysql -u root -p apqc_pcf < 03-views.sql
mysql -u root -p apqc_pcf < 04-sample-metrics.sql
```

#### SQL Server

```bash
# Create database
sqlcmd -S localhost -Q "CREATE DATABASE apqc_pcf;"

# Run scripts in order
sqlcmd -S localhost -d apqc_pcf -i 01-schema.sql
sqlcmd -S localhost -d apqc_pcf -i 02-data.sql
sqlcmd -S localhost -d apqc_pcf -i 03-views.sql
sqlcmd -S localhost -d apqc_pcf -i 04-sample-metrics.sql
```

### Verification

After installation, verify the database was set up correctly:

```sql
-- Check record counts
SELECT 'Framework Metadata' as table_name, COUNT(*) as record_count FROM framework_metadata
UNION ALL
SELECT 'Process Categories', COUNT(*) FROM process_categories
UNION ALL
SELECT 'Processes', COUNT(*) FROM processes
UNION ALL
SELECT 'Process Metrics', COUNT(*) FROM process_metrics;

-- Expected results:
-- Framework Metadata: 1
-- Process Categories: 13
-- Processes: 413
-- Process Metrics: varies (sample data)
```

---

## Data Dictionary

### framework_metadata

| Column | Type | Description |
|--------|------|-------------|
| id | INTEGER | Primary key |
| framework_name | VARCHAR(255) | Name of the framework |
| framework_version | VARCHAR(50) | Version number (e.g., "7.2.1") |
| industry_type | VARCHAR(100) | Industry classification (e.g., "Cross Industry") |
| release_date | DATE | Official release date of this version |
| description | TEXT | Detailed description of the framework |
| source_system | VARCHAR(100) | Source system (e.g., "HOPEX V3") |
| import_date | TIMESTAMP | When data was imported |
| last_updated | TIMESTAMP | Last update timestamp |

### process_categories

| Column | Type | Description |
|--------|------|-------------|
| category_id | INTEGER | Primary key |
| category_code | VARCHAR(10) | Unique category code (e.g., "1.0") |
| category_name | VARCHAR(255) | Category name |
| category_description | TEXT | Detailed description |
| category_type | VARCHAR(50) | "Operating" or "Management and Support" |
| sort_order | INTEGER | Display order |
| created_date | TIMESTAMP | Creation timestamp |
| modified_date | TIMESTAMP | Last modification timestamp |

### processes

| Column | Type | Description |
|--------|------|-------------|
| process_id | VARCHAR(50) | Primary key (format: APQC_CI_X_Y_Z) |
| process_code | VARCHAR(20) | Unique process code (e.g., "1.1.1") |
| process_name | VARCHAR(500) | Process name |
| process_description | TEXT | Detailed description |
| process_number | VARCHAR(20) | APQC internal process number |
| internal_id | VARCHAR(50) | APQC internal identifier |
| hierarchy_level | INTEGER | Level in hierarchy (1, 2, or 3) |
| parent_process_code | VARCHAR(20) | Foreign key to parent process |
| category_code | VARCHAR(10) | Foreign key to category |
| process_type | VARCHAR(50) | "Category", "Process Group", or "Process" |
| is_leaf_node | BOOLEAN | TRUE if no children exist |
| sort_order | INTEGER | Display order |
| is_active | BOOLEAN | Active status flag |
| created_date | TIMESTAMP | Creation timestamp |
| modified_date | TIMESTAMP | Last modification timestamp |

### process_relationships

| Column | Type | Description |
|--------|------|-------------|
| relationship_id | SERIAL | Primary key (auto-increment) |
| source_process_code | VARCHAR(20) | Source process foreign key |
| target_process_code | VARCHAR(20) | Target process foreign key |
| relationship_type | VARCHAR(50) | Type: "depends_on", "interfaces_with", etc. |
| relationship_description | TEXT | Description of relationship |
| strength | VARCHAR(20) | "strong", "medium", or "weak" |
| created_date | TIMESTAMP | Creation timestamp |

### process_metrics

| Column | Type | Description |
|--------|------|-------------|
| metric_id | SERIAL | Primary key (auto-increment) |
| process_code | VARCHAR(20) | Process foreign key |
| metric_name | VARCHAR(255) | Metric name |
| metric_description | TEXT | Detailed description |
| metric_type | VARCHAR(50) | "efficiency", "effectiveness", "quality", "cycle_time", "cost" |
| unit_of_measure | VARCHAR(50) | Unit (e.g., "days", "percentage", "USD") |
| target_value | DECIMAL(15,2) | Target/goal value |
| industry_benchmark | DECIMAL(15,2) | Industry average/benchmark |
| data_source | VARCHAR(100) | Where data comes from |
| measurement_frequency | VARCHAR(50) | "daily", "weekly", "monthly", etc. |
| is_active | BOOLEAN | Active status flag |
| created_date | TIMESTAMP | Creation timestamp |
| modified_date | TIMESTAMP | Last modification timestamp |

---

## Usage Examples

### Basic Queries

#### 1. Get All Top-Level Categories

```sql
SELECT
    category_code,
    category_name,
    category_type
FROM process_categories
ORDER BY category_code;
```

#### 2. Get All Processes Under a Category

```sql
SELECT
    process_code,
    process_name,
    process_type,
    hierarchy_level
FROM processes
WHERE category_code = '1.0'
ORDER BY process_code;
```

#### 3. Get Process Hierarchy for a Specific Process

```sql
-- Get the full hierarchy path for process 1.1.1
WITH RECURSIVE hierarchy AS (
    -- Start with the target process
    SELECT
        process_id,
        process_code,
        process_name,
        parent_process_code,
        1 as level
    FROM processes
    WHERE process_code = '1.1.1'

    UNION ALL

    -- Recursively get parents
    SELECT
        p.process_id,
        p.process_code,
        p.process_name,
        p.parent_process_code,
        h.level + 1
    FROM processes p
    INNER JOIN hierarchy h ON p.process_code = h.parent_process_code
)
SELECT
    process_code,
    process_name,
    level
FROM hierarchy
ORDER BY level DESC;
```

#### 4. Get All Child Processes

```sql
SELECT
    process_code,
    process_name,
    process_type,
    is_leaf_node
FROM processes
WHERE parent_process_code = '1.1'
ORDER BY process_code;
```

#### 5. Search Processes by Keyword

```sql
SELECT
    p.process_code,
    p.process_name,
    p.hierarchy_level,
    c.category_name
FROM processes p
LEFT JOIN process_categories c ON p.category_code = c.category_code
WHERE LOWER(p.process_name) LIKE '%customer%'
   OR LOWER(p.process_description) LIKE '%customer%'
ORDER BY p.process_code;
```

### Using Views

#### 6. Get Process Hierarchy View

```sql
SELECT
    process_code,
    process_name,
    full_path,
    hierarchy_level,
    category_type
FROM process_hierarchy_view
WHERE hierarchy_level = 3
ORDER BY process_code
LIMIT 20;
```

#### 7. Category Summary

```sql
SELECT * FROM category_summary
ORDER BY category_code;
```

#### 8. Get All Leaf Processes

```sql
SELECT
    process_code,
    process_name,
    category_name
FROM leaf_processes
WHERE category_code = '3.0'
ORDER BY process_code;
```

### Advanced Queries

#### 9. Find Processes Without Children

```sql
SELECT
    process_code,
    process_name,
    hierarchy_level
FROM processes p
WHERE is_leaf_node = TRUE
  AND hierarchy_level < 3  -- Processes that could have children but don't
ORDER BY process_code;
```

#### 10. Get Process Count by Category and Level

```sql
SELECT
    c.category_code,
    c.category_name,
    p.hierarchy_level,
    p.process_type,
    COUNT(*) as process_count
FROM process_categories c
LEFT JOIN processes p ON c.category_code = p.category_code
WHERE p.hierarchy_level > 1  -- Exclude the category itself
GROUP BY c.category_code, c.category_name, p.hierarchy_level, p.process_type
ORDER BY c.category_code, p.hierarchy_level;
```

#### 11. Get Metrics for a Process

```sql
SELECT
    p.process_code,
    p.process_name,
    m.metric_name,
    m.metric_type,
    m.unit_of_measure,
    m.measurement_frequency
FROM processes p
INNER JOIN process_metrics m ON p.process_code = m.process_code
WHERE p.process_code = '3.5.5'
  AND m.is_active = TRUE
ORDER BY m.metric_type, m.metric_name;
```

---

## Best Practices

### Database Design Principles Used

1. **Normalization:** The schema follows 3rd Normal Form (3NF) to minimize redundancy
2. **Referential Integrity:** Foreign keys ensure data consistency
3. **Indexing Strategy:** Indexes on frequently queried columns for performance
4. **Self-Referencing:** Processes table uses self-referencing for hierarchy
5. **Audit Trail:** Created and modified timestamps on all tables

### Query Performance Tips

1. **Use Indexes:** The database includes indexes on commonly queried columns
2. **Limit Results:** Use LIMIT/TOP for large result sets
3. **Specific Columns:** SELECT only needed columns instead of SELECT *
4. **Use Views:** Pre-built views for common queries
5. **Parameterize:** Use prepared statements to prevent SQL injection

### Data Maintenance

1. **Keep is_active Flag Updated:** Mark processes as inactive rather than deleting
2. **Update Timestamps:** Use database triggers or application logic to update modified_date
3. **Regular Backups:** Schedule regular database backups
4. **Validate Hierarchy:** Periodically check for orphaned processes
5. **Monitor Performance:** Track query performance and add indexes as needed

### Extending the Database

#### Adding Custom Attributes

```sql
-- Example: Add industry-specific attributes
ALTER TABLE processes ADD COLUMN industry_specific_flag BOOLEAN DEFAULT FALSE;
ALTER TABLE processes ADD COLUMN custom_classification VARCHAR(100);
```

#### Adding Process Relationships

```sql
-- Example: Document that one process depends on another
INSERT INTO process_relationships (
    source_process_code,
    target_process_code,
    relationship_type,
    relationship_description,
    strength
) VALUES (
    '3.5.5',
    '4.2.1',
    'depends_on',
    'Order processing depends on supplier management',
    'strong'
);
```

#### Adding Custom Metrics

```sql
-- Example: Add organization-specific metrics
INSERT INTO process_metrics (
    process_code,
    metric_name,
    metric_description,
    metric_type,
    unit_of_measure,
    measurement_frequency
) VALUES (
    '1.1.1',
    'Competitive Intelligence Reports',
    'Number of competitive intelligence reports generated',
    'efficiency',
    'count',
    'monthly'
);
```

---

## Maintenance

### Backup Procedures

#### PostgreSQL
```bash
# Full database backup
pg_dump apqc_pcf > apqc_pcf_backup_$(date +%Y%m%d).sql

# Compressed backup
pg_dump apqc_pcf | gzip > apqc_pcf_backup_$(date +%Y%m%d).sql.gz
```

#### MySQL
```bash
# Full database backup
mysqldump apqc_pcf > apqc_pcf_backup_$(date +%Y%m%d).sql

# Compressed backup
mysqldump apqc_pcf | gzip > apqc_pcf_backup_$(date +%Y%m%d).sql.gz
```

#### SQL Server
```sql
-- Full database backup
BACKUP DATABASE apqc_pcf
TO DISK = 'C:\Backups\apqc_pcf_backup.bak'
WITH FORMAT, MEDIANAME = 'APQCBackup', NAME = 'Full Backup of apqc_pcf';
```

### Restore Procedures

#### PostgreSQL
```bash
# Restore from backup
psql apqc_pcf < apqc_pcf_backup_20260324.sql

# Restore from compressed backup
gunzip < apqc_pcf_backup_20260324.sql.gz | psql apqc_pcf
```

#### MySQL
```bash
# Restore from backup
mysql apqc_pcf < apqc_pcf_backup_20260324.sql

# Restore from compressed backup
gunzip < apqc_pcf_backup_20260324.sql.gz | mysql apqc_pcf
```

### Data Validation Queries

```sql
-- Check for orphaned processes (processes with invalid parent references)
SELECT p.process_code, p.process_name, p.parent_process_code
FROM processes p
WHERE p.parent_process_code IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM processes p2
      WHERE p2.process_code = p.parent_process_code
  );

-- Check for processes with invalid category references
SELECT p.process_code, p.process_name, p.category_code
FROM processes p
WHERE p.category_code IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM process_categories c
      WHERE c.category_code = p.category_code
  );

-- Verify hierarchy consistency
SELECT
    hierarchy_level,
    process_type,
    COUNT(*) as count
FROM processes
GROUP BY hierarchy_level, process_type
ORDER BY hierarchy_level;
```

---

## Appendix

### A. Complete Process Category List

| Code | Category Name | Type |
|------|---------------|------|
| 1.0 | Develop Vision and Strategy | Operating |
| 2.0 | Develop and Manage Products and Services | Operating |
| 3.0 | Market and Sell Products and Services | Operating |
| 4.0 | Deliver Physical Products | Operating |
| 5.0 | Deliver Services | Operating |
| 6.0 | Manage Customer Service | Operating |
| 7.0 | Develop and Manage Human Capital | Management and Support |
| 8.0 | Manage Financial Resources | Management and Support |
| 9.0 | Acquire, Construct, and Manage Assets | Management and Support |
| 10.0 | Manage Enterprise Risk, Compliance, Remediation, and Resiliency | Management and Support |
| 11.0 | Manage External Relationships | Management and Support |
| 12.0 | Develop and Manage Business Capabilities | Management and Support |
| 13.0 | Measure and Benchmark | Management and Support |

### B. Database File Manifest

| File | Description |
|------|-------------|
| 01-schema.sql | Database schema definition (DDL) |
| 02-data.sql | Process data insert statements |
| 03-views.sql | Useful views and sample queries |
| 04-sample-metrics.sql | Sample metrics and KPIs |
| setup_database.sh | Automated setup script |
| README.md | This documentation file |

### C. Metric Types Reference

| Metric Type | Description | Example |
|-------------|-------------|---------|
| efficiency | Measures resource utilization | Orders processed per employee |
| effectiveness | Measures goal achievement | First call resolution rate |
| quality | Measures accuracy/correctness | Error rate, defect rate |
| cycle_time | Measures duration | Time to process order |
| cost | Measures financial impact | Cost per transaction |

### D. Measurement Frequency Options

- **daily:** Measured every day
- **weekly:** Measured once per week
- **monthly:** Measured once per month
- **quarterly:** Measured once per quarter (3 months)
- **annually:** Measured once per year
- **real-time:** Continuous measurement
- **on-demand:** Measured as needed

### E. Relationship Types

| Type | Description |
|------|-------------|
| depends_on | Source process depends on target process |
| interfaces_with | Processes exchange information/materials |
| enables | Source process enables target process |
| precedes | Source occurs before target |
| supports | Source supports target |

### F. Contact and Support

For questions about APQC PCF content and methodology:
- Visit: https://www.apqc.org/
- Contact: APQC Customer Support

For database technical issues:
- Refer to your database vendor documentation
- Check database logs for error messages
- Validate SQL syntax for your specific database version

### G. Version History

| Version | Date | Changes |
|---------|------|---------|
| 7.2.1 | 2019-12-18 | Cross Industry framework (source data) |
| DB 1.0 | 2026-03-24 | Initial database implementation |

### H. License and Attribution

This database implementation is based on the APQC Process Classification Framework version 7.2.1 (Cross Industry).

**APQC PCF License:** Please refer to the LICENSE file in the repository root for licensing information.

**Database Implementation:** The database schema, documentation, and tooling are provided as-is for use with the APQC PCF content.

---

## Quick Reference Card

### Common Commands

```sql
-- List all categories
SELECT * FROM process_categories ORDER BY category_code;

-- Get processes in a category
SELECT * FROM processes WHERE category_code = '1.0' ORDER BY process_code;

-- Search for a process
SELECT * FROM process_hierarchy_view WHERE process_name LIKE '%customer%';

-- Get category summary
SELECT * FROM category_summary;

-- Get all leaf processes
SELECT * FROM leaf_processes ORDER BY category_code, process_code;

-- Count processes by level
SELECT hierarchy_level, COUNT(*) FROM processes GROUP BY hierarchy_level;
```

### Connection Strings

```bash
# PostgreSQL
psql -h localhost -p 5432 -U postgres -d apqc_pcf

# MySQL
mysql -h localhost -P 3306 -u root -p apqc_pcf

# SQL Server
sqlcmd -S localhost -U sa -P -d apqc_pcf
```

---

**End of Documentation**

For the latest version of this documentation and database updates, visit the project repository.
