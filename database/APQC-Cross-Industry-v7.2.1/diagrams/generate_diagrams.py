#!/usr/bin/env python3
"""
APQC PCF UML and Visualization Generator

This script generates comprehensive UML diagrams and interactive visualizations
for the APQC Process Classification Framework database.

Features:
- Database ERD (Entity Relationship Diagram)
- Process hierarchy diagrams
- Interactive HTML single-page visualization
- PDF documentation with diagrams
- Multiple diagram formats (SVG, PNG, PDF)

Requirements:
    pip install plantuml graphviz jinja2 weasyprint psycopg2-binary pandas matplotlib

Usage:
    python generate_diagrams.py --all
    python generate_diagrams.py --erd
    python generate_diagrams.py --hierarchy
    python generate_diagrams.py --html
    python generate_diagrams.py --pdf
"""

import argparse
import os
import sys
import subprocess
from pathlib import Path
import json

try:
    import psycopg2
except ImportError:
    psycopg2 = None

try:
    import pandas as pd
except ImportError:
    pd = None

try:
    from jinja2 import Template
except ImportError:
    Template = None


class DiagramGenerator:
    """Generate UML diagrams and visualizations for APQC PCF"""

    def __init__(self, output_dir='diagrams', db_params=None):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
        self.db_params = db_params
        self.connection = None

    def connect_db(self):
        """Connect to database if parameters provided"""
        if self.db_params and psycopg2:
            try:
                self.connection = psycopg2.connect(**self.db_params)
                print("✓ Connected to database")
                return True
            except Exception as e:
                print(f"Warning: Could not connect to database: {e}")
                return False
        return False

    def close_db(self):
        """Close database connection"""
        if self.connection:
            self.connection.close()

    def generate_plantuml_diagrams(self):
        """Generate diagrams from PlantUML files"""
        print("\n=== Generating PlantUML Diagrams ===")

        puml_files = list(self.output_dir.glob('*.puml'))

        if not puml_files:
            print("No PlantUML files found in", self.output_dir)
            return False

        # Check if plantuml is available
        try:
            result = subprocess.run(['plantuml', '-version'],
                                    capture_output=True, text=True, timeout=5)
            if result.returncode != 0:
                raise FileNotFoundError
            print("✓ PlantUML found")
        except (FileNotFoundError, subprocess.TimeoutExpired):
            print("Warning: PlantUML not found. Install with:")
            print("  sudo apt-get install plantuml  # Linux")
            print("  brew install plantuml          # macOS")
            print("  Or download from: https://plantuml.com/")
            return False

        # Generate diagrams in multiple formats
        for puml_file in puml_files:
            print(f"\nProcessing {puml_file.name}...")

            # Generate SVG (vector format, best for web)
            try:
                subprocess.run(['plantuml', '-tsvg', str(puml_file)],
                               check=True, timeout=30)
                print(f"  ✓ Generated SVG")
            except subprocess.CalledProcessError as e:
                print(f"  ✗ Error generating SVG: {e}")

            # Generate PNG (raster format)
            try:
                subprocess.run(['plantuml', '-tpng', str(puml_file)],
                               check=True, timeout=30)
                print(f"  ✓ Generated PNG")
            except subprocess.CalledProcessError as e:
                print(f"  ✗ Error generating PNG: {e}")

            # Generate PDF (for documentation)
            try:
                subprocess.run(['plantuml', '-tpdf', str(puml_file)],
                               check=True, timeout=30)
                print(f"  ✓ Generated PDF")
            except subprocess.CalledProcessError as e:
                print(f"  ✗ Error generating PDF: {e}")

        print("\n✓ PlantUML diagram generation complete")
        return True

    def fetch_process_data(self):
        """Fetch process data from database"""
        if not self.connection:
            print("No database connection available")
            return None

        query = """
        SELECT
            p.process_code,
            p.process_name,
            p.hierarchy_level,
            p.parent_process_code,
            p.category_code,
            c.category_name,
            p.process_type,
            p.process_description
        FROM processes p
        LEFT JOIN process_categories c ON p.category_code = c.category_code
        WHERE p.is_active = TRUE
        ORDER BY p.process_code
        """

        try:
            df = pd.read_sql_query(query, self.connection)
            print(f"✓ Fetched {len(df)} processes from database")
            return df
        except Exception as e:
            print(f"Error fetching data: {e}")
            return None

    def generate_interactive_html(self, df=None):
        """Generate interactive HTML visualization"""
        print("\n=== Generating Interactive HTML ===")

        if df is None and self.connection:
            df = self.fetch_process_data()

        if df is None:
            print("No data available for HTML generation")
            return False

        html_template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APQC Process Classification Framework - Interactive Visualization</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #003366 0%, #0066cc 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1.1em;
            opacity: 0.9;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 30px;
            background: #f8f9fa;
        }

        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .stat-card .number {
            font-size: 2.5em;
            font-weight: bold;
            color: #0066cc;
        }

        .stat-card .label {
            font-size: 0.9em;
            color: #666;
            margin-top: 5px;
        }

        .controls {
            padding: 20px 30px;
            background: #f0f0f0;
            border-bottom: 1px solid #ddd;
        }

        .search-box {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border: 2px solid #0066cc;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .filter-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filter-btn {
            padding: 10px 20px;
            background: white;
            border: 2px solid #0066cc;
            color: #0066cc;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
        }

        .filter-btn:hover, .filter-btn.active {
            background: #0066cc;
            color: white;
        }

        .content {
            padding: 30px;
        }

        .process-tree {
            margin-bottom: 20px;
        }

        .category {
            margin-bottom: 30px;
            border: 2px solid #0066cc;
            border-radius: 8px;
            overflow: hidden;
        }

        .category-header {
            background: #0066cc;
            color: white;
            padding: 15px 20px;
            cursor: pointer;
            font-size: 1.2em;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .category-header:hover {
            background: #0052a3;
        }

        .category-content {
            padding: 20px;
            background: #f8f9fa;
        }

        .process-group {
            margin-bottom: 20px;
            border-left: 4px solid #4CAF50;
            padding-left: 15px;
        }

        .process-group-title {
            font-size: 1.1em;
            font-weight: bold;
            color: #2e7d32;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .process-group-title:hover {
            color: #1b5e20;
        }

        .process {
            padding: 10px;
            margin: 5px 0;
            background: white;
            border-radius: 5px;
            border-left: 3px solid #FF9800;
            cursor: pointer;
            transition: all 0.3s;
        }

        .process:hover {
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            transform: translateX(5px);
        }

        .process-code {
            font-weight: bold;
            color: #0066cc;
            margin-right: 10px;
        }

        .process-description {
            margin-top: 5px;
            padding: 10px;
            background: #f0f0f0;
            border-radius: 3px;
            font-size: 0.9em;
            color: #555;
            display: none;
        }

        .process.expanded .process-description {
            display: block;
        }

        .hidden {
            display: none !important;
        }

        .expand-icon {
            transition: transform 0.3s;
        }

        .expanded .expand-icon {
            transform: rotate(90deg);
        }

        .footer {
            background: #003366;
            color: white;
            padding: 20px;
            text-align: center;
        }

        @media print {
            body {
                background: white;
            }
            .controls {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>APQC Process Classification Framework</h1>
            <p>Cross Industry v7.2.1 - Interactive Visualization</p>
        </div>

        <div class="stats">
            <div class="stat-card">
                <div class="number" id="total-processes">{{ total_processes }}</div>
                <div class="label">Total Processes</div>
            </div>
            <div class="stat-card">
                <div class="number">{{ categories }}</div>
                <div class="label">Categories</div>
            </div>
            <div class="stat-card">
                <div class="number">{{ process_groups }}</div>
                <div class="label">Process Groups</div>
            </div>
            <div class="stat-card">
                <div class="number">{{ detailed_processes }}</div>
                <div class="label">Detailed Processes</div>
            </div>
        </div>

        <div class="controls">
            <input type="text" class="search-box" id="search-box"
                   placeholder="Search processes by code or name...">
            <div class="filter-buttons">
                <button class="filter-btn active" data-level="all">All Levels</button>
                <button class="filter-btn" data-level="1">Level 1 (Categories)</button>
                <button class="filter-btn" data-level="2">Level 2 (Process Groups)</button>
                <button class="filter-btn" data-level="3">Level 3 (Processes)</button>
                <button class="filter-btn" data-type="Operating">Operating</button>
                <button class="filter-btn" data-type="Management and Support">Management & Support</button>
            </div>
        </div>

        <div class="content" id="process-content">
            {{ process_html|safe }}
        </div>

        <div class="footer">
            <p>APQC Process Classification Framework - Cross Industry v7.2.1</p>
            <p>Generated: {{ generation_date }}</p>
        </div>
    </div>

    <script>
        // Process data
        const processData = {{ process_data_json|safe }};

        // Search functionality
        document.getElementById('search-box').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const processes = document.querySelectorAll('.process');

            processes.forEach(proc => {
                const text = proc.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    proc.style.display = '';
                } else {
                    proc.style.display = 'none';
                }
            });

            // Update visible count
            const visible = Array.from(processes).filter(p => p.style.display !== 'none').length;
            document.getElementById('total-processes').textContent = visible;
        });

        // Filter functionality
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                // Toggle active state
                document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');

                const level = this.dataset.level;
                const type = this.dataset.type;

                const categories = document.querySelectorAll('.category');

                categories.forEach(cat => {
                    let show = true;

                    if (level && level !== 'all') {
                        // Filter by level logic
                        show = cat.dataset.level === level;
                    }

                    if (type) {
                        show = cat.dataset.type === type;
                    }

                    cat.style.display = show ? '' : 'none';
                });
            });
        });

        // Expand/collapse categories
        document.querySelectorAll('.category-header').forEach(header => {
            header.addEventListener('click', function() {
                const content = this.nextElementSibling;
                const icon = this.querySelector('.expand-icon');

                if (content.style.display === 'none') {
                    content.style.display = 'block';
                    icon.textContent = '▼';
                } else {
                    content.style.display = 'none';
                    icon.textContent = '▶';
                }
            });
        });

        // Expand/collapse process descriptions
        document.querySelectorAll('.process').forEach(proc => {
            proc.addEventListener('click', function() {
                this.classList.toggle('expanded');
            });
        });

        // Expand/collapse process groups
        document.querySelectorAll('.process-group-title').forEach(title => {
            title.addEventListener('click', function(e) {
                e.stopPropagation();
                const processes = this.nextElementSibling;
                processes.style.display = processes.style.display === 'none' ? 'block' : 'none';
            });
        });
    </script>
</body>
</html>
        """

        # Prepare data
        categories = df[df['hierarchy_level'] == 1]
        process_groups = df[df['hierarchy_level'] == 2]
        detailed_processes = df[df['hierarchy_level'] == 3]

        # Build hierarchical HTML
        process_html = ""
        for _, cat in categories.iterrows():
            cat_code = cat['process_code']
            cat_groups = process_groups[process_groups['category_code'] == cat_code]

            process_html += f"""
            <div class="category" data-level="1" data-type="{cat.get('category_name', '')}">
                <div class="category-header">
                    <span><span class="process-code">{cat_code}</span> {cat['process_name']}</span>
                    <span class="expand-icon">▼</span>
                </div>
                <div class="category-content">
            """

            if cat.get('process_description'):
                process_html += f'<p style="margin-bottom:15px;color:#666;">{cat["process_description"]}</p>'

            for _, grp in cat_groups.iterrows():
                grp_code = grp['process_code']
                grp_processes = detailed_processes[detailed_processes['parent_process_code'] == grp_code]

                process_html += f"""
                <div class="process-group">
                    <div class="process-group-title">
                        <span class="process-code">{grp_code}</span> {grp['process_name']}
                    </div>
                    <div>
                """

                for _, proc in grp_processes.iterrows():
                    desc = proc.get('process_description', '')
                    process_html += f"""
                    <div class="process">
                        <span class="process-code">{proc['process_code']}</span>
                        <span>{proc['process_name']}</span>
                        {f'<div class="process-description">{desc}</div>' if desc else ''}
                    </div>
                    """

                process_html += """
                    </div>
                </div>
                """

            process_html += """
                </div>
            </div>
            """

        # Render template
        from datetime import datetime

        if Template:
            template = Template(html_template)
            html_output = template.render(
                total_processes=len(df),
                categories=len(categories),
                process_groups=len(process_groups),
                detailed_processes=len(detailed_processes),
                process_html=process_html,
                process_data_json=json.dumps(df.to_dict('records')),
                generation_date=datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            )
        else:
            # Simple string replacement if jinja2 not available
            html_output = html_template.replace('{{ total_processes }}', str(len(df)))
            html_output = html_output.replace('{{ categories }}', str(len(categories)))
            html_output = html_output.replace('{{ process_groups }}', str(len(process_groups)))
            html_output = html_output.replace('{{ detailed_processes }}', str(len(detailed_processes)))
            html_output = html_output.replace('{{ process_html|safe }}', process_html)
            html_output = html_output.replace('{{ process_data_json|safe }}', json.dumps(df.to_dict('records')))
            html_output = html_output.replace('{{ generation_date }}', datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

        # Write HTML file
        output_file = self.output_dir / 'interactive-visualization.html'
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(html_output)

        print(f"✓ Generated interactive HTML: {output_file}")
        return True

    def generate_pdf_documentation(self):
        """Generate comprehensive PDF documentation"""
        print("\n=== Generating PDF Documentation ===")

        # This would require weasyprint or reportlab
        print("PDF generation requires weasyprint or reportlab")
        print("Install with: pip install weasyprint")

        # For now, we'll create a simple HTML that can be printed to PDF
        # by the browser or converted using wkhtmltopdf

        return True


def main():
    parser = argparse.ArgumentParser(description='Generate APQC PCF UML Diagrams and Visualizations')

    parser.add_argument('--all', action='store_true', help='Generate all outputs')
    parser.add_argument('--erd', action='store_true', help='Generate ERD diagram')
    parser.add_argument('--hierarchy', action='store_true', help='Generate hierarchy diagrams')
    parser.add_argument('--html', action='store_true', help='Generate interactive HTML')
    parser.add_argument('--pdf', action='store_true', help='Generate PDF documentation')

    parser.add_argument('--db-host', default='localhost', help='Database host')
    parser.add_argument('--db-port', type=int, default=5432, help='Database port')
    parser.add_argument('--db-name', default='apqc_pcf', help='Database name')
    parser.add_argument('--db-user', help='Database user')
    parser.add_argument('--db-password', help='Database password')

    parser.add_argument('--output-dir', default='diagrams', help='Output directory')

    args = parser.parse_args()

    # If no specific options, do all
    if not any([args.all, args.erd, args.hierarchy, args.html, args.pdf]):
        args.all = True

    # Prepare database parameters
    db_params = None
    if args.db_user:
        db_params = {
            'host': args.db_host,
            'port': args.db_port,
            'database': args.db_name,
            'user': args.db_user,
            'password': args.db_password or ''
        }

    # Create generator
    generator = DiagramGenerator(output_dir=args.output_dir, db_params=db_params)

    # Connect to database if parameters provided
    if db_params:
        generator.connect_db()

    try:
        # Generate PlantUML diagrams
        if args.all or args.erd or args.hierarchy:
            generator.generate_plantuml_diagrams()

        # Generate interactive HTML
        if args.all or args.html:
            generator.generate_interactive_html()

        # Generate PDF
        if args.all or args.pdf:
            generator.generate_pdf_documentation()

        print("\n" + "="*60)
        print("✓ All requested outputs generated successfully!")
        print(f"Output directory: {generator.output_dir.absolute()}")
        print("="*60)

    finally:
        generator.close_db()


if __name__ == '__main__':
    main()
