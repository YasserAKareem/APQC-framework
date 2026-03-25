# APQC Framework Database Package

This directory contains SQL database implementations of the APQC Process Classification Framework (PCF).

## Available Databases

### APQC - Cross Industry v7.2.1

Complete SQL database implementation of the APQC PCF Cross Industry framework version 7.2.1.

**Location:** `database/APQC-Cross-Industry-v7.2.1/`

**Contents:**
- ✅ Complete database schema (5 tables)
- ✅ 413 processes across 3 hierarchy levels
- ✅ 13 process categories
- ✅ Automated setup scripts
- ✅ Sample metrics and KPIs
- ✅ Useful views and queries
- ✅ Comprehensive documentation

**Quick Start:**
```bash
cd database/APQC-Cross-Industry-v7.2.1
./setup_database.sh postgresql apqc_pcf
```

See the [README](./APQC-Cross-Industry-v7.2.1/README.md) for detailed documentation.

## Database Features

### Schema Design
- Normalized database design (3NF)
- Self-referential hierarchy support
- Full referential integrity
- Comprehensive indexing strategy
- Support for PostgreSQL, MySQL, and SQL Server

### Tables
1. **framework_metadata** - Framework version information
2. **process_categories** - Top-level categories
3. **processes** - All processes with hierarchical relationships
4. **process_relationships** - Inter-process relationships
5. **process_metrics** - Performance metrics and KPIs

### Views
1. **process_hierarchy_view** - Complete hierarchy with full paths
2. **category_summary** - Category statistics
3. **leaf_processes** - Leaf-level processes only
4. **process_tree** - Recursive tree navigation

### Documentation
- 📖 Complete README with installation guide
- 📊 Data dictionary with all table definitions
- 🎯 Sample queries and usage examples
- 🔧 Setup and maintenance procedures
- 📈 Best practices guide

## Framework Information

### APQC PCF Overview

The APQC Process Classification Framework (PCF) is:
- An open standard used by thousands of organizations worldwide
- A high-level, generic enterprise model
- Industry-neutral and can be customized to specific industries
- Organized hierarchically from categories to detailed processes

### Hierarchy Structure

```
Level 1: Categories (13)
  └─ Level 2: Process Groups (72)
      └─ Level 3: Processes (328)
```

### Example Process Path

```
1.0 Develop Vision and Strategy (Category)
  └─ 1.1 Define the business concept and long-term vision (Process Group)
      └─ 1.1.1 Assess the external environment (Process)
```

## Use Cases

### Process Management
- Document organizational processes
- Standardize process nomenclature
- Map as-is and to-be processes
- Establish process ownership

### Benchmarking
- Compare performance across organizations
- Identify best practices
- Set improvement targets
- Track progress over time

### Business Process Improvement
- Identify process gaps
- Prioritize improvement initiatives
- Measure process maturity
- Support continuous improvement

### Enterprise Architecture
- Process reference architecture
- Capability modeling
- Value stream mapping
- Integration with EA tools

### Compliance and Risk
- Process documentation for audits
- Control mapping
- Risk assessment
- SOX compliance

## Technical Requirements

### Supported Databases
- PostgreSQL 10+
- MySQL 5.7+ / MariaDB 10.2+
- SQL Server 2016+

### Storage Requirements
- Approximately 50MB for database
- Minimal for indexes and views

### Prerequisites
- Database server installed and running
- Client tools (psql, mysql, or sqlcmd)
- Database admin privileges

## Getting Started

1. **Choose your database framework:**
   ```bash
   cd database/APQC-Cross-Industry-v7.2.1
   ```

2. **Review the documentation:**
   ```bash
   cat README.md
   ```

3. **Run the setup script:**
   ```bash
   ./setup_database.sh postgresql apqc_pcf
   ```

4. **Verify installation:**
   ```sql
   SELECT * FROM category_summary;
   ```

5. **Start querying:**
   ```sql
   SELECT * FROM process_hierarchy_view
   WHERE hierarchy_level = 3
   LIMIT 10;
   ```

## File Structure

```
database/
└── APQC-Cross-Industry-v7.2.1/
    ├── README.md                    # Complete documentation
    ├── DATA_DICTIONARY.md           # Detailed data dictionary
    ├── setup_database.sh            # Automated setup script
    ├── 01-schema.sql               # Database schema (DDL)
    ├── 02-data.sql                 # Process data (DML)
    ├── 03-views.sql                # Views and sample queries
    └── 04-sample-metrics.sql       # Sample metrics and KPIs
```

## Support and Resources

### APQC Resources
- **Website:** https://www.apqc.org/
- **PCF Information:** https://www.apqc.org/process-frameworks

### Database Issues
- Check the README for troubleshooting
- Review your database error logs
- Verify SQL syntax for your database version

## License

This database implementation is based on the APQC Process Classification Framework. Please refer to the main repository LICENSE file for licensing information.

## Contributing

To add support for additional APQC framework versions or industries:
1. Follow the same structure as the Cross Industry implementation
2. Extract data from the source XML files
3. Generate SQL scripts using the same patterns
4. Include complete documentation
5. Test on all supported database platforms

## Future Enhancements

Potential additions to the database package:
- [ ] Additional industry-specific frameworks
- [ ] Process relationship mapping tools
- [ ] Visualization and reporting queries
- [ ] Data migration scripts
- [ ] API integration examples
- [ ] BI tool integration guides

## Version History

| Version | Date | Framework | Changes |
|---------|------|-----------|---------|
| 1.0 | 2026-03-24 | Cross Industry v7.2.1 | Initial database implementation |

---

For detailed documentation on the Cross Industry v7.2.1 database, see the [README in that directory](./APQC-Cross-Industry-v7.2.1/README.md).
