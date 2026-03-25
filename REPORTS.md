# APQC Framework Reports

## Overview

This repository now includes comprehensive SQL-based reports that replace and extend the functionality of the HOPEX `.mgl` report template file (`APQC - Process Table Hierarchy - Report Template.mgl`).

## Available Reports

The reports are located in: **`database/APQC-Cross-Industry-v7.2.1/reports/`**

### 1. Process Hierarchy Report
**File:** `01-process-hierarchy-report.sql`

Provides a hierarchical view of all APQC processes organized by category, process group, and process levels.
- Multi-level hierarchical table
- Visual tree view with indentation
- Complete process descriptions

### 2. Process Table Report
**File:** `02-process-table-report.sql`

Complete table of all APQC processes with all attributes (5 different views):
- Full process table with all attributes
- Process table by category (grouped)
- Process table with parent-child relationships
- Pivot-style report (levels as columns)
- Process table with full hierarchical path

### 3. Category Summary Report
**File:** `03-category-summary-report.sql`

Executive summary information about each process category:
- Category overview with counts and percentages
- Operating vs Management & Support comparison
- Top 5 categories by process count
- Category depth analysis
- Data completeness check

### 4. Process Metrics Report
**File:** `04-process-metrics-report.sql`

Performance metrics and KPIs associated with processes:
- Processes with defined metrics
- Metrics by type (efficiency, effectiveness, quality, cycle_time, cost)
- Target vs benchmark comparison
- Metric coverage analysis

## Quick Start

### Using SQL Reports Directly

```bash
# PostgreSQL
psql -d apqc_pcf -f database/APQC-Cross-Industry-v7.2.1/reports/01-process-hierarchy-report.sql

# MySQL
mysql apqc_pcf < database/APQC-Cross-Industry-v7.2.1/reports/01-process-hierarchy-report.sql

# SQL Server
sqlcmd -d apqc_pcf -i database/APQC-Cross-Industry-v7.2.1/reports/01-process-hierarchy-report.sql
```

### Using Python Report Generator

The Python script generates reports in multiple formats (CSV, HTML, Excel):

```bash
# Install dependencies
cd database/APQC-Cross-Industry-v7.2.1/reports
pip install -r requirements.txt

# Generate all reports in CSV format
python generate_reports.py --db postgresql --report all --format csv

# Generate hierarchy report in HTML
python generate_reports.py --db postgresql --report hierarchy --format html

# Generate metrics report in Excel
python generate_reports.py --db postgresql --report metrics --format excel
```

### Using Shell Script (Batch Generation)

```bash
cd database/APQC-Cross-Industry-v7.2.1/reports
./run_reports.sh postgresql apqc_pcf report_output
```

## Output Formats

The reports can be generated in multiple formats:

- **SQL** - Direct database query results
- **CSV** - Excel-compatible comma-separated values
- **HTML** - Styled, responsive web reports
- **Excel** - Formatted spreadsheets with colors and auto-width
- **Text** - Plain text for terminal viewing

## Report Features

✅ **Hierarchical Views** - Multi-level process hierarchy display
✅ **Detailed Tables** - Complete process information with all attributes
✅ **Executive Summaries** - Category statistics and comparisons
✅ **Performance Metrics** - KPIs and benchmarking data
✅ **Multiple Formats** - CSV, HTML, Excel, SQL, Text
✅ **Automation Ready** - Scripts for scheduled report generation
✅ **BI Integration** - Compatible with Tableau, Power BI, Excel
✅ **Multi-Database** - PostgreSQL, MySQL, SQL Server support

## Integration with BI Tools

### Tableau
1. Connect to the APQC PCF database
2. Import views (process_hierarchy_view, category_summary)
3. Create dashboards

### Power BI
1. Get Data → From Database
2. Connect to apqc_pcf database
3. Load tables and create visualizations

### Excel
1. Data → Get Data → From Database
2. Load process_hierarchy_view or custom queries
3. Create PivotTables and charts

## Documentation

Complete documentation is available in:
- **[Reports README](database/APQC-Cross-Industry-v7.2.1/reports/README.md)** - Comprehensive report documentation
- **[Database README](database/APQC-Cross-Industry-v7.2.1/README.md)** - Database setup and usage
- **[Quick Reference](database/APQC-Cross-Industry-v7.2.1/QUICK_REFERENCE.md)** - Common queries and tips

## Use Cases

### Process Management
- Document organizational processes
- Process inventory management
- Compliance and audit documentation

### Benchmarking
- Compare performance against industry standards
- Identify best practices
- Track improvement initiatives

### Executive Reporting
- Category-level summaries
- Operating vs Support process analysis
- Process coverage statistics

### Performance Management
- KPI tracking and monitoring
- Target vs benchmark analysis
- Metric gap identification

## Scheduling Automated Reports

### Linux/Mac (cron)
```bash
# Edit crontab
crontab -e

# Add daily report generation at 6 AM
0 6 * * * cd /path/to/reports && python generate_reports.py --db postgresql --report all --format csv
```

### Windows (Task Scheduler)
Create a scheduled task to run `generate_reports.py` daily/weekly.

## File Structure

```
database/APQC-Cross-Industry-v7.2.1/
├── reports/
│   ├── README.md                         # Complete report documentation
│   ├── 01-process-hierarchy-report.sql  # Hierarchical process view
│   ├── 02-process-table-report.sql      # Complete process table
│   ├── 03-category-summary-report.sql   # Category summaries
│   ├── 04-process-metrics-report.sql    # Metrics and KPIs
│   ├── generate_reports.py              # Python report generator
│   ├── run_reports.sh                   # Batch report script
│   └── requirements.txt                 # Python dependencies
├── 01-schema.sql                         # Database schema
├── 02-data.sql                          # Process data
├── 03-views.sql                         # Database views
├── 04-sample-metrics.sql                # Sample metrics
├── 05-verify.sql                        # Verification script
├── README.md                            # Main documentation
├── DATA_DICTIONARY.md                   # Schema details
└── setup_database.sh                    # Setup script
```

## Support

For questions or issues:
1. Review the [Reports README](database/APQC-Cross-Industry-v7.2.1/reports/README.md)
2. Check the [Database README](database/APQC-Cross-Industry-v7.2.1/README.md)
3. Verify database setup with `05-verify.sql`

## Version Information

- **APQC PCF Version:** 7.2.1
- **Industry:** Cross Industry
- **Report Package Version:** 1.0
- **Created:** 2026-03-24
- **Based on:** APQC - Process Table Hierarchy - Report Template.mgl

---

**Note:** These SQL-based reports replace the HOPEX .mgl template file functionality and provide more flexibility, automation, and format options for reporting on the APQC Process Classification Framework.
