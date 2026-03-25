# APQC Cross Industry v7.2.1 - Excel Dataset

## Overview

This Excel workbook (`APQC-Cross-Industry-v7.2.1-Dataset.xlsx`) contains the complete APQC Process Classification Framework (PCF) Cross Industry v7.2.1 data in a standalone, easy-to-use format.

**✓ 100% COMPLETE** - [View Completeness Certificate](COMPLETENESS_CERTIFICATE.md)

## File Information

- **Filename:** `APQC-Cross-Industry-v7.2.1-Dataset.xlsx`
- **Format:** Microsoft Excel 2007+ (.xlsx)
- **Size:** ~118 KB
- **Framework Version:** 7.2.1
- **Industry:** Cross Industry
- **Total Categories:** 13
- **Total Processes:** 413
- **Completeness:** 100% verified
- **Generated:** 2026-03-25

## Workbook Structure

The workbook contains 5 sheets with comprehensive APQC framework data:

### Sheet 1: Summary Statistics
- Overview of the APQC framework
- Total counts (categories, processes)
- Breakdown by hierarchy level
- Breakdown by category

### Sheet 2: Framework Metadata
- Framework name and version
- Industry type
- Release date
- Source system information
- Complete framework description

### Sheet 3: Process Categories
- All 13 APQC process categories
- Category codes, names, and descriptions
- Category types (Operating vs Management & Support)
- Sort order

**Columns:**
- Category ID
- Category Code (e.g., "1.0", "2.0")
- Category Name
- Description
- Type (Operating/Management and Support)
- Sort Order

### Sheet 4: Processes
- Complete table of all 413 APQC processes
- All process attributes and metadata
- Hierarchy relationships

**Columns:**
- Process ID
- Process Code
- Process Name
- Description
- Process Number
- Level (1, 2, or 3)
- Parent Code
- Category Code
- Process Type
- Is Leaf Node
- Sort Order
- Is Active

### Sheet 5: Process Hierarchy
- Hierarchical view with visual indentation
- Color-coded by hierarchy level
- Easy-to-read tree structure

**Columns:**
- Level
- Code
- Process Name (with indentation)
- Description
- Category
- Type

**Color Coding:**
- Level 1 (Categories): Light Blue (#CCE5FF)
- Level 2 (Process Groups): Very Light Blue (#E6F2FF)
- Level 3 (Processes): Pale Blue (#F0F8FF)

## Use Cases

### Business Process Management
- Document organizational processes
- Create process inventories
- Map current state processes
- Design future state processes

### Benchmarking & Analysis
- Compare against industry standards
- Identify process gaps
- Analyze process coverage
- Conduct maturity assessments

### Training & Communication
- Educate teams on APQC framework
- Share process information
- Create training materials
- Present to stakeholders

### Integration & Import
- Import into process management tools
- Load into custom databases
- Feed into BI dashboards
- Integrate with other systems

### Reporting & Documentation
- Generate custom reports
- Create presentations
- Build process catalogs
- Produce compliance documentation

## Features

✅ **No Database Required** - Standalone Excel file, no setup needed
✅ **Professional Formatting** - Color-coded headers and alternating rows
✅ **Auto-sized Columns** - Optimized for readability
✅ **Multiple Views** - Summary, detailed, and hierarchical views
✅ **Complete Data** - All 413 processes with full descriptions
✅ **Easy Filtering** - Excel's built-in filtering and sorting
✅ **Pivot Table Ready** - Use for analysis and dashboards
✅ **Print Friendly** - Professional formatting for printing

## How to Use

### Opening the File
1. Double-click to open in Microsoft Excel, LibreOffice, or Google Sheets
2. No macros or special features - works in any spreadsheet application

### Filtering Data
1. Click on any column header
2. Use the filter dropdown to select specific values
3. Filter by category, level, type, etc.

### Creating Pivot Tables
1. Select any cell in the Processes sheet
2. Insert → PivotTable
3. Analyze by category, level, or any other dimension

### Exporting Subsets
1. Apply filters to show desired data
2. Copy filtered data
3. Paste into new workbook or other application

### Searching
1. Press Ctrl+F (Cmd+F on Mac)
2. Search across all sheets
3. Find specific processes or keywords

## Technical Details

### Generation Method
This Excel file was generated from the SQL data files using the `create_xlsx_dataset.py` Python script, which:
- Parses the SQL INSERT statements
- Extracts all framework and process data
- Creates formatted Excel sheets with professional styling
- Auto-adjusts column widths for optimal viewing

### Data Source
The data originates from:
1. **SQL Files:** `database/APQC-Cross-Industry-v7.2.1/02-data.sql`
2. **Original Source:** APQC Process Classification Framework v7.2.1
3. **HOPEX Import:** From MEGA HOPEX V3.00.02
4. **XML Data:** Cross Industry framework files

### Data Integrity
- All 413 processes extracted successfully
- All 13 categories included
- All descriptions preserved
- Hierarchy relationships maintained
- No data loss or corruption

## Regenerating the File

If you need to regenerate or modify the Excel file:

```bash
cd database/APQC-Cross-Industry-v7.2.1
python3 create_xlsx_dataset.py
```

**Requirements:**
- Python 3.x
- openpyxl library (`pip install openpyxl`)

## Comparison with Other Formats

| Format | Pros | Cons |
|--------|------|------|
| **Excel (.xlsx)** | ✅ No database needed<br>✅ Easy to share<br>✅ Universal format | ❌ Static data<br>❌ No relationships |
| **SQL Database** | ✅ Queryable<br>✅ Relationships<br>✅ Multi-user | ❌ Requires setup<br>❌ Technical knowledge |
| **CSV Files** | ✅ Simple<br>✅ Universal | ❌ No formatting<br>❌ Multiple files |
| **HTML Reports** | ✅ Web-friendly<br>✅ Formatted | ❌ Static<br>❌ Not editable |

## Related Files

- **SQL Database:** `database/APQC-Cross-Industry-v7.2.1/`
- **Generator Script:** `database/APQC-Cross-Industry-v7.2.1/create_xlsx_dataset.py`
- **Schema Documentation:** `database/APQC-Cross-Industry-v7.2.1/01-schema.sql`
- **Data Dictionary:** `database/APQC-Cross-Industry-v7.2.1/DATA_DICTIONARY.md`

## Support & Documentation

For more information about the APQC framework and database:
- **Main README:** [README.md](../../README.md)
- **Database README:** [database/APQC-Cross-Industry-v7.2.1/README.md](README.md)
- **Reports Guide:** [REPORTS.md](../../REPORTS.md)
- **APQC Website:** https://www.apqc.org/

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-03-25 | Initial release with all 413 processes |

## License

This data is sourced from the APQC Process Classification Framework. Please refer to APQC's licensing terms for usage restrictions and attribution requirements.

---

**Framework:** APQC Process Classification Framework (PCF)
**Version:** 7.2.1
**Industry:** Cross Industry
**Generated:** 2026-03-25
