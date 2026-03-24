#!/usr/bin/env python3
"""
APQC PCF Report Generator

This script generates reports from the APQC Process Classification Framework database
in various formats (CSV, HTML, Excel, PDF).

Usage:
    python generate_reports.py --db postgresql --report all --format csv
    python generate_reports.py --db postgresql --report hierarchy --format html
    python generate_reports.py --db postgresql --report metrics --format excel

Requirements:
    pip install psycopg2-binary pandas openpyxl jinja2

For PDF support:
    pip install reportlab weasyprint
"""

import argparse
import sys
import os
from datetime import datetime
import pandas as pd

try:
    import psycopg2
except ImportError:
    psycopg2 = None

try:
    import mysql.connector
except ImportError:
    mysql = None

try:
    import pyodbc
except ImportError:
    pyodbc = None


# Report SQL files mapping
REPORTS = {
    'hierarchy': '01-process-hierarchy-report.sql',
    'table': '02-process-table-report.sql',
    'category': '03-category-summary-report.sql',
    'metrics': '04-process-metrics-report.sql'
}


class ReportGenerator:
    """Generate APQC PCF reports in various formats"""

    def __init__(self, db_type, connection_params):
        self.db_type = db_type
        self.connection_params = connection_params
        self.connection = None

    def connect(self):
        """Establish database connection"""
        if self.db_type == 'postgresql':
            if not psycopg2:
                raise ImportError("psycopg2 not installed. Install with: pip install psycopg2-binary")
            self.connection = psycopg2.connect(**self.connection_params)

        elif self.db_type == 'mysql':
            if not mysql:
                raise ImportError("mysql-connector not installed. Install with: pip install mysql-connector-python")
            self.connection = mysql.connector.connect(**self.connection_params)

        elif self.db_type == 'sqlserver':
            if not pyodbc:
                raise ImportError("pyodbc not installed. Install with: pip install pyodbc")
            conn_str = ';'.join([f"{k}={v}" for k, v in self.connection_params.items()])
            self.connection = pyodbc.connect(conn_str)

        else:
            raise ValueError(f"Unsupported database type: {self.db_type}")

    def close(self):
        """Close database connection"""
        if self.connection:
            self.connection.close()

    def execute_report(self, report_name):
        """Execute a report SQL and return pandas DataFrame"""
        if report_name not in REPORTS:
            raise ValueError(f"Unknown report: {report_name}")

        sql_file = os.path.join('reports', REPORTS[report_name])

        if not os.path.exists(sql_file):
            raise FileNotFoundError(f"Report file not found: {sql_file}")

        # Read SQL file
        with open(sql_file, 'r') as f:
            sql = f.read()

        # Extract main SELECT query (skip header comments)
        # For simplicity, we'll use the first major SELECT after comments
        queries = []
        current_query = []
        in_query = False

        for line in sql.split('\n'):
            line = line.strip()

            # Skip comments and separators
            if line.startswith('--') or line.startswith('SELECT \\'') or not line:
                continue

            if line.upper().startswith('SELECT'):
                in_query = True
                current_query = [line]
            elif in_query:
                current_query.append(line)
                if line.endswith(';'):
                    queries.append(' '.join(current_query))
                    in_query = False
                    current_query = []

        # Execute the first major query
        if queries:
            return pd.read_sql_query(queries[0].rstrip(';'), self.connection)
        else:
            raise ValueError(f"No valid SELECT query found in {sql_file}")

    def generate_csv(self, df, output_file):
        """Generate CSV report"""
        df.to_csv(output_file, index=False)
        print(f"CSV report generated: {output_file}")

    def generate_html(self, df, output_file, report_name):
        """Generate HTML report"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        html = f"""
<!DOCTYPE html>
<html>
<head>
    <title>APQC PCF Report - {report_name}</title>
    <style>
        body {{
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }}
        .header {{
            background-color: #003366;
            color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }}
        h1 {{
            margin: 0;
            font-size: 24px;
        }}
        .timestamp {{
            font-size: 12px;
            margin-top: 5px;
        }}
        table {{
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}
        th {{
            background-color: #0066cc;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }}
        td {{
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }}
        tr:hover {{
            background-color: #f0f8ff;
        }}
        .footer {{
            margin-top: 20px;
            text-align: center;
            color: #666;
            font-size: 12px;
        }}
    </style>
</head>
<body>
    <div class="header">
        <h1>APQC Process Classification Framework</h1>
        <h2>Report: {report_name.title()}</h2>
        <div class="timestamp">Generated: {timestamp}</div>
    </div>
    {df.to_html(index=False, classes='report-table')}
    <div class="footer">
        APQC PCF Cross Industry v7.2.1
    </div>
</body>
</html>
        """

        with open(output_file, 'w') as f:
            f.write(html)

        print(f"HTML report generated: {output_file}")

    def generate_excel(self, df, output_file, report_name):
        """Generate Excel report"""
        try:
            from openpyxl import load_workbook
            from openpyxl.styles import Font, PatternFill, Alignment

            # Write basic Excel file
            df.to_excel(output_file, sheet_name=report_name, index=False)

            # Format the Excel file
            wb = load_workbook(output_file)
            ws = wb.active

            # Header formatting
            header_fill = PatternFill(start_color="0066CC", end_color="0066CC", fill_type="solid")
            header_font = Font(bold=True, color="FFFFFF")

            for cell in ws[1]:
                cell.fill = header_fill
                cell.font = header_font
                cell.alignment = Alignment(horizontal='center', vertical='center')

            # Auto-adjust column widths
            for column in ws.columns:
                max_length = 0
                column_letter = column[0].column_letter
                for cell in column:
                    try:
                        if len(str(cell.value)) > max_length:
                            max_length = len(str(cell.value))
                    except:
                        pass
                adjusted_width = min(max_length + 2, 50)
                ws.column_dimensions[column_letter].width = adjusted_width

            wb.save(output_file)
            print(f"Excel report generated: {output_file}")

        except ImportError:
            print("Warning: openpyxl not installed. Generating basic Excel file.")
            df.to_excel(output_file, sheet_name=report_name, index=False)
            print(f"Basic Excel report generated: {output_file}")


def main():
    parser = argparse.ArgumentParser(description='Generate APQC PCF Reports')

    parser.add_argument('--db', choices=['postgresql', 'mysql', 'sqlserver'],
                        default='postgresql', help='Database type')
    parser.add_argument('--host', default='localhost', help='Database host')
    parser.add_argument('--port', type=int, help='Database port')
    parser.add_argument('--database', default='apqc_pcf', help='Database name')
    parser.add_argument('--user', help='Database user')
    parser.add_argument('--password', help='Database password')

    parser.add_argument('--report', choices=['hierarchy', 'table', 'category', 'metrics', 'all'],
                        default='all', help='Report to generate')
    parser.add_argument('--format', choices=['csv', 'html', 'excel', 'all'],
                        default='csv', help='Output format')
    parser.add_argument('--output-dir', default='output', help='Output directory')

    args = parser.parse_args()

    # Set default ports if not specified
    if not args.port:
        if args.db == 'postgresql':
            args.port = 5432
        elif args.db == 'mysql':
            args.port = 3306
        elif args.db == 'sqlserver':
            args.port = 1433

    # Get credentials if not provided
    if not args.user:
        args.user = input(f"Enter {args.db} username: ")
    if not args.password:
        import getpass
        args.password = getpass.getpass(f"Enter {args.db} password: ")

    # Prepare connection parameters
    if args.db == 'postgresql':
        conn_params = {
            'host': args.host,
            'port': args.port,
            'database': args.database,
            'user': args.user,
            'password': args.password
        }
    elif args.db == 'mysql':
        conn_params = {
            'host': args.host,
            'port': args.port,
            'database': args.database,
            'user': args.user,
            'password': args.password
        }
    elif args.db == 'sqlserver':
        conn_params = {
            'DRIVER': '{ODBC Driver 17 for SQL Server}',
            'SERVER': f'{args.host},{args.port}',
            'DATABASE': args.database,
            'UID': args.user,
            'PWD': args.password
        }

    # Create output directory
    os.makedirs(args.output_dir, exist_ok=True)

    # Initialize report generator
    generator = ReportGenerator(args.db, conn_params)

    try:
        # Connect to database
        print(f"Connecting to {args.db} database...")
        generator.connect()
        print("Connected successfully!")

        # Determine which reports to generate
        reports_to_generate = list(REPORTS.keys()) if args.report == 'all' else [args.report]

        # Generate reports
        for report_name in reports_to_generate:
            print(f"\nGenerating {report_name} report...")

            try:
                # Execute report query
                df = generator.execute_report(report_name)

                # Generate in requested formats
                formats = ['csv', 'html', 'excel'] if args.format == 'all' else [args.format]

                for fmt in formats:
                    output_file = os.path.join(args.output_dir,
                                               f"apqc_{report_name}_report.{fmt if fmt != 'excel' else 'xlsx'}")

                    if fmt == 'csv':
                        generator.generate_csv(df, output_file)
                    elif fmt == 'html':
                        generator.generate_html(df, output_file, report_name)
                    elif fmt == 'excel':
                        generator.generate_excel(df, output_file, report_name)

            except Exception as e:
                print(f"Error generating {report_name} report: {e}")
                continue

        print(f"\nAll reports generated successfully in {args.output_dir}/")

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

    finally:
        generator.close()


if __name__ == '__main__':
    main()
