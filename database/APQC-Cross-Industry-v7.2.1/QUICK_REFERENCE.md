# APQC Cross Industry v7.2.1 Database - Quick Reference

## Database at a Glance

```
┌─────────────────────────────────────────────────────────────────┐
│         APQC Process Classification Framework v7.2.1             │
│                     Cross Industry Database                       │
└─────────────────────────────────────────────────────────────────┘

📊 Statistics:
   • Total Processes: 413
   • Hierarchy Levels: 3
   • Categories: 13
   • Process Groups: 72
   • Detailed Processes: 328

🗄️ Database Tables: 5
   • framework_metadata (1 record)
   • process_categories (13 records)
   • processes (413 records)
   • process_relationships (extensible)
   • process_metrics (extensible)

🔍 Database Views: 4
   • process_hierarchy_view
   • category_summary
   • leaf_processes
   • process_tree

💾 Database Platforms:
   ✓ PostgreSQL 10+
   ✓ MySQL 5.7+ / MariaDB 10.2+
   ✓ SQL Server 2016+
```

## APQC Process Categories

### Operating Processes (1.0 - 6.0)

| Code | Category Name | Process Groups | Processes |
|------|---------------|----------------|-----------|
| 1.0 | Develop Vision and Strategy | 4 | 33 |
| 2.0 | Develop and Manage Products and Services | 6 | 47 |
| 3.0 | Market and Sell Products and Services | 8 | 65 |
| 4.0 | Deliver Physical Products | 5 | 46 |
| 5.0 | Deliver Services | 4 | 29 |
| 6.0 | Manage Customer Service | 4 | 24 |

### Management and Support Processes (7.0 - 13.0)

| Code | Category Name | Process Groups | Processes |
|------|---------------|----------------|-----------|
| 7.0 | Develop and Manage Human Capital | 7 | - |
| 8.0 | Manage Financial Resources | 6 | - |
| 9.0 | Acquire, Construct, and Manage Assets | 5 | - |
| 10.0 | Manage Enterprise Risk, Compliance, Remediation, and Resiliency | 6 | - |
| 11.0 | Manage External Relationships | 7 | - |
| 12.0 | Develop and Manage Business Capabilities | 8 | - |
| 13.0 | Measure and Benchmark | 4 | - |

## Installation - Quick Start

### Option 1: Automated Setup (Recommended)

```bash
cd database/APQC-Cross-Industry-v7.2.1
./setup_database.sh postgresql apqc_pcf
```

### Option 2: Manual Setup

```bash
# PostgreSQL
createdb apqc_pcf
psql -d apqc_pcf -f 01-schema.sql
psql -d apqc_pcf -f 02-data.sql
psql -d apqc_pcf -f 03-views.sql
psql -d apqc_pcf -f 04-sample-metrics.sql

# MySQL
mysql -u root -p -e "CREATE DATABASE apqc_pcf;"
mysql -u root -p apqc_pcf < 01-schema.sql
mysql -u root -p apqc_pcf < 02-data.sql
mysql -u root -p apqc_pcf < 03-views.sql
mysql -u root -p apqc_pcf < 04-sample-metrics.sql
```

## Most Common Queries

### 1. List All Categories
```sql
SELECT category_code, category_name, category_type
FROM process_categories
ORDER BY category_code;
```

### 2. Get Process Hierarchy
```sql
SELECT process_code, process_name, full_path
FROM process_hierarchy_view
WHERE category_code = '1.0'
ORDER BY process_code;
```

### 3. Search Processes
```sql
SELECT process_code, process_name, category_name
FROM process_hierarchy_view
WHERE LOWER(process_name) LIKE '%customer%'
ORDER BY process_code;
```

### 4. Get Category Summary
```sql
SELECT * FROM category_summary
ORDER BY category_code;
```

### 5. Get Process Children
```sql
SELECT process_code, process_name, process_type
FROM processes
WHERE parent_process_code = '1.1'
ORDER BY process_code;
```

## Sample Hierarchy

```
1.0 Develop Vision and Strategy
├── 1.1 Define the business concept and long-term vision
│   ├── 1.1.1 Assess the external environment
│   ├── 1.1.2 Survey market and determine customer needs and wants
│   ├── 1.1.3 Assess the internal environment
│   ├── 1.1.4 Establish strategic vision
│   └── 1.1.5 Conduct organization restructuring opportunities
├── 1.2 Develop business strategy
│   ├── 1.2.1 Develop overall mission statement
│   ├── 1.2.2 Formulate strategic objectives
│   ├── 1.2.3 Develop organization design
│   ├── 1.2.4 Develop and set organizational goals
│   └── 1.2.5 Formulate business unit strategies
├── 1.3 Execute and measure strategic initiatives
│   └── ...
└── 1.4 Develop and maintain business models
    └── ...
```

## Metric Types and Examples

| Type | Description | Example |
|------|-------------|---------|
| **efficiency** | Resource utilization | Orders per employee per day |
| **effectiveness** | Goal achievement | First call resolution rate (%) |
| **quality** | Accuracy | Order accuracy rate (%) |
| **cycle_time** | Duration | Average order processing time (hours) |
| **cost** | Financial impact | Cost per invoice processed (USD) |

## Key Features

### 🏗️ Schema Design
- Normalized 3NF database
- Self-referential hierarchy
- Full referential integrity
- Comprehensive indexing
- Audit timestamps

### 🔄 Hierarchy Support
- 3-level process hierarchy
- Parent-child relationships
- Category grouping
- Leaf node identification
- Recursive tree queries

### 📊 Extensibility
- Add custom metrics
- Define relationships
- Track performance
- Benchmark against industry
- Support multiple frequencies

### 🔍 Views and Queries
- Pre-built useful views
- 10+ sample queries
- Hierarchy navigation
- Full-text search
- Category summaries

### 📚 Documentation
- Complete README (24KB)
- Data dictionary (17KB)
- Installation guide
- Usage examples
- Best practices

## Use Case Examples

### Process Documentation
```sql
-- Document all processes in category 3.0
SELECT p.process_code, p.process_name, p.process_description
FROM processes p
WHERE p.category_code = '3.0'
ORDER BY p.process_code;
```

### Performance Tracking
```sql
-- Track metrics for a process
SELECT m.metric_name, m.metric_type, m.unit_of_measure,
       m.target_value, m.industry_benchmark
FROM process_metrics m
WHERE m.process_code = '3.5.5'
  AND m.is_active = TRUE;
```

### Process Dependencies
```sql
-- Find process relationships
SELECT pr.source_process_code, p1.process_name as source_name,
       pr.target_process_code, p2.process_name as target_name,
       pr.relationship_type, pr.strength
FROM process_relationships pr
JOIN processes p1 ON pr.source_process_code = p1.process_code
JOIN processes p2 ON pr.target_process_code = p2.process_code
WHERE pr.relationship_type = 'depends_on';
```

### Benchmarking
```sql
-- Compare actuals vs benchmarks
SELECT p.process_name, m.metric_name,
       m.target_value, m.industry_benchmark,
       ROUND((m.target_value / m.industry_benchmark) * 100, 2) as performance_pct
FROM process_metrics m
JOIN processes p ON m.process_code = p.process_code
WHERE m.industry_benchmark IS NOT NULL
  AND m.target_value IS NOT NULL;
```

## File Structure

```
database/APQC-Cross-Industry-v7.2.1/
│
├── 📄 README.md (24KB)              Complete documentation
├── 📄 DATA_DICTIONARY.md (17KB)    Detailed data dictionary
├── 🔧 setup_database.sh (7.6KB)    Automated setup script
│
├── 🗄️ 01-schema.sql (8.1KB)        Database schema
├── 💾 02-data.sql (267KB)          All process data
├── 🔍 03-views.sql (7.4KB)         Views and queries
└── 📊 04-sample-metrics.sql (6.5KB) Sample metrics
```

## Support Resources

### Documentation
- [README.md](./README.md) - Complete guide
- [DATA_DICTIONARY.md](./DATA_DICTIONARY.md) - Data dictionary
- [database/README.md](../README.md) - Package overview

### APQC Resources
- Website: https://www.apqc.org/
- PCF Info: https://www.apqc.org/process-frameworks

### Quick Tips
1. Always start with schema, then data, then views
2. Use views for complex queries
3. Index custom query columns
4. Back up before modifications
5. Validate data after imports

## Version Information

| Component | Version | Date |
|-----------|---------|------|
| APQC PCF | 7.2.1 | 2019-12-18 |
| Database Implementation | 1.0 | 2026-03-24 |
| Source System | HOPEX V3.00.02 | - |

---

**Ready to get started?** Run `./setup_database.sh` and start exploring the APQC Process Classification Framework!
