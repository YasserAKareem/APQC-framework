# APQC PCF Database Reports

## Overview

This directory contains SQL-based reports for the APQC Process Classification Framework (PCF) Cross Industry v7.2.1 database. These reports are designed to replace and extend the functionality of the HOPEX `.mgl` report template file.

## Available Reports

### 1. Process Hierarchy Report (`01-process-hierarchy-report.sql`)

**Purpose:** Provides a hierarchical view of all APQC processes organized by category, process group, and process levels.

**Key Features:**
- Multi-level hierarchical table with all three levels displayed
- Tree view with visual indentation
- Full process descriptions
- Summary statistics

**Output Columns:**
- Level 1 - Category
- Level 2 - Process Group
- Level 3 - Process
- Process Code
- Type
- Description

**Use Cases:**
- Understanding the complete APQC framework structure
- Process documentation and training materials
- Organizational process mapping
- Compliance and audit documentation

**Sample Output:**
```
Level 1                          | Level 2                                | Level 3                          | Code
---------------------------------|----------------------------------------|----------------------------------|-------
Develop Vision and Strategy      | Define the business concept...         | Assess the external environment  | 1.1.1
Develop Vision and Strategy      | Define the business concept...         | Survey market...                 | 1.1.2
```

---

### 2. Process Table Report (`02-process-table-report.sql`)

**Purpose:** Complete table of all APQC processes with all attributes in a flat format, suitable for Excel import or database analysis.

**Key Features:**
- Five different report views:
  1. Full Process Table with All Attributes
  2. Process Table by Category (Grouped)
  3. Process Table with Parent-Child Relationships
  4. Pivot-Style Report (Levels as Columns)
  5. Process Table with Full Path

**Output Columns:**
- Process Code, Name, Type, Level
- Parent Code, Category
- Description
- Metadata (dates, IDs, status)

**Use Cases:**
- Data analysis and manipulation in Excel
- Process inventory management
- Integration with other systems
- Custom reporting and dashboards

---

### 3. Category Summary Report (`03-category-summary-report.sql`)

**Purpose:** Executive summary information about each process category, including counts, types, and hierarchical structure.

**Key Features:**
- Category overview with counts
- Operating vs Management & Support comparison
- Detailed category breakdown
- Top 5 categories by process count
- Category depth analysis
- Data completeness check

**Output Sections:**
1. Category Overview (counts and percentages)
2. Operating vs Management & Support Comparison
3. Detailed Category Information
4. Top Categories
5. Depth Analysis
6. Completeness Check

**Use Cases:**
- Executive reporting and dashboards
- Framework analysis and statistics
- Identifying areas for process development
- Benchmarking category coverage

---

### 4. Process Metrics Report (`04-process-metrics-report.sql`)

**Purpose:** Shows performance metrics and KPIs associated with processes for benchmarking and performance management.

**Key Features:**
- Processes with defined metrics
- Metrics summary by type (efficiency, effectiveness, quality, cycle_time, cost)
- Metrics by category
- Measurement frequency analysis
- Target vs benchmark comparison
- Metric coverage analysis
- Identification of processes without metrics

**Output Columns:**
- Process information
- Metric name, type, unit
- Target values
- Industry benchmarks
- Measurement frequency
- Status

**Use Cases:**
- Performance management and KPI tracking
- Benchmarking against industry standards
- Identifying measurement gaps
- Process improvement initiatives
- Balanced scorecard development

---

## Running Reports

### Method 1: Direct SQL Execution

#### PostgreSQL
```bash
# Run report to screen
psql -d apqc_pcf -f reports/01-process-hierarchy-report.sql

# Export to file
psql -d apqc_pcf -f reports/01-process-hierarchy-report.sql > output.txt

# Export to CSV (use the main SELECT query)
psql -d apqc_pcf -c "COPY (SELECT ...) TO '/tmp/report.csv' CSV HEADER"
```

#### MySQL
```bash
# Run report to screen
mysql apqc_pcf < reports/01-process-hierarchy-report.sql

# Export to file
mysql apqc_pcf < reports/01-process-hierarchy-report.sql > output.txt

# Export to CSV
mysql apqc_pcf -e "SELECT ..." | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > report.csv
```

#### SQL Server
```bash
# Run report to screen
sqlcmd -d apqc_pcf -i reports/01-process-hierarchy-report.sql

# Export to file
sqlcmd -d apqc_pcf -i reports/01-process-hierarchy-report.sql -o output.txt
```

### Method 2: Python Report Generator

The included Python script can generate reports in multiple formats:

#### Installation
```bash
# Basic requirements
pip install pandas psycopg2-binary mysql-connector-python pyodbc

# For Excel support
pip install openpyxl

# For enhanced PDF support (optional)
pip install reportlab weasyprint
```

#### Usage

```bash
# Generate all reports in CSV format
python reports/generate_reports.py --db postgresql --report all --format csv

# Generate hierarchy report in HTML
python reports/generate_reports.py --db postgresql --report hierarchy --format html

# Generate metrics report in Excel
python reports/generate_reports.py --db postgresql --report metrics --format excel

# Generate all reports in all formats
python reports/generate_reports.py --db postgresql --report all --format all

# Specify custom connection parameters
python reports/generate_reports.py \
    --db postgresql \
    --host localhost \
    --port 5432 \
    --database apqc_pcf \
    --user myuser \
    --report all \
    --format csv \
    --output-dir my_reports
```

#### Report Types
- `hierarchy` - Process Hierarchy Report
- `table` - Process Table Report
- `category` - Category Summary Report
- `metrics` - Process Metrics Report
- `all` - Generate all reports

#### Output Formats
- `csv` - Comma-separated values (Excel compatible)
- `html` - Styled HTML report
- `excel` - Excel spreadsheet with formatting
- `all` - Generate in all formats

---

## Report Customization

### Modifying Reports

All reports are standard SQL files that can be easily modified:

1. **Adding Columns:** Add fields to the SELECT clause
2. **Filtering:** Add WHERE conditions
3. **Sorting:** Modify ORDER BY clauses
4. **Grouping:** Change GROUP BY for different aggregations

### Example Customizations

#### Filter by Category
```sql
-- Add to WHERE clause
WHERE p.category_code = '1.0'
```

#### Limit to Operating Categories Only
```sql
-- Add to WHERE clause
WHERE c.category_type = 'Operating'
```

#### Export Specific Columns Only
```sql
-- Modify SELECT clause
SELECT
    p.process_code,
    p.process_name,
    p.process_description
FROM processes p
```

---

## Integration with BI Tools

These reports can be integrated with Business Intelligence tools:

### Tableau
1. Connect to the APQC PCF database
2. Import the views (process_hierarchy_view, category_summary, etc.)
3. Create dashboards using the imported data

### Power BI
1. Get Data → Database → PostgreSQL/MySQL/SQL Server
2. Connect to apqc_pcf database
3. Load tables and views
4. Create visualizations

### Excel
1. Data → Get Data → From Database
2. Connect to database
3. Load process_hierarchy_view or run custom queries
4. Create PivotTables and charts

### Jasper Reports / Crystal Reports
1. Create data source connection to apqc_pcf
2. Use SQL queries from report files
3. Design report layout
4. Schedule automated report generation

---

## Scheduling Automated Reports

### Linux/Mac (cron)
```bash
# Edit crontab
crontab -e

# Add daily report generation at 6 AM
0 6 * * * cd /path/to/reports && python generate_reports.py --db postgresql --report all --format csv
```

### Windows (Task Scheduler)
1. Open Task Scheduler
2. Create Basic Task
3. Set trigger (daily, weekly, etc.)
4. Action: Start a program
5. Program: `python`
6. Arguments: `generate_reports.py --db postgresql --report all --format csv`
7. Start in: `C:\path\to\reports`

---

## Output Examples

### CSV Output
Reports in CSV format can be opened in Excel, imported into databases, or processed by scripts:
```csv
Process Code,Process Name,Category,Level
1.0,Develop Vision and Strategy,Operating,1
1.1,Define the business concept,Operating,2
1.1.1,Assess the external environment,Operating,3
```

### HTML Output
HTML reports include:
- Professional styling with branded colors
- Sortable tables (with JavaScript)
- Responsive design for mobile viewing
- Print-friendly layouts

### Excel Output
Excel reports feature:
- Formatted headers with color
- Auto-adjusted column widths
- Frozen header row
- Professional appearance

---

## Best Practices

### Performance
- For large result sets, add LIMIT clauses during testing
- Create indexes on frequently filtered columns
- Use views for commonly joined tables
- Schedule long-running reports during off-peak hours

### Data Quality
- Run verification script before generating reports
- Validate report outputs against expected totals
- Check for NULL values in critical fields
- Review data completeness

### Distribution
- Save reports with timestamps in filenames
- Archive old reports periodically
- Secure sensitive reports appropriately
- Document any custom modifications

---

## Troubleshooting

### Common Issues

**Issue:** "Permission denied" error
- **Solution:** Ensure database user has SELECT permissions on all tables

**Issue:** Empty or incomplete results
- **Solution:** Check database is populated: `SELECT COUNT(*) FROM processes;`

**Issue:** Python import errors
- **Solution:** Install required packages: `pip install -r requirements.txt`

**Issue:** Connection timeout
- **Solution:** Check database is running and firewall allows connections

### Getting Help

- Check database logs for errors
- Verify connection parameters
- Test queries in a database client first
- Review the main README.md for database setup

---

## Report File Structure

```
reports/
├── README.md                           # This file
├── 01-process-hierarchy-report.sql    # Hierarchical view
├── 02-process-table-report.sql        # Complete process table
├── 03-category-summary-report.sql     # Category summaries
├── 04-process-metrics-report.sql      # Metrics and KPIs
└── generate_reports.py                # Python report generator
```

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-03-24 | Initial report package creation |

---

## Related Documentation

- [Main Database README](../README.md) - Complete database documentation
- [Data Dictionary](../DATA_DICTIONARY.md) - Detailed schema information
- [Quick Reference](../QUICK_REFERENCE.md) - Common queries and tips
- [Setup Guide](../setup_database.sh) - Database installation

---

## Support

For questions or issues:
1. Review this documentation
2. Check the main database README
3. Verify database setup with 05-verify.sql
4. Review SQL query syntax for your database type

---

**Report Package Created:** 2026-03-24
**Database Version:** APQC PCF Cross Industry v7.2.1
**Compatible Databases:** PostgreSQL 10+, MySQL 5.7+, SQL Server 2016+
