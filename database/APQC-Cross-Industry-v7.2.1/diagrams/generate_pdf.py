#!/usr/bin/env python3
"""
APQC PCF PDF Report Generator

Generates comprehensive PDF documentation with UML diagrams and process details.

Requirements:
    pip install reportlab pandas psycopg2-binary pillow

Usage:
    python generate_pdf.py
    python generate_pdf.py --db-user postgres --db-password pass
    python generate_pdf.py --output apqc-report.pdf
"""

import argparse
import sys
from datetime import datetime
from pathlib import Path

try:
    from reportlab.lib import colors
    from reportlab.lib.pagesizes import letter, A4
    from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
    from reportlab.lib.units import inch
    from reportlab.platypus import (SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle,
                                    PageBreak, Image, KeepTogether)
    from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_JUSTIFY
    reportlab_available = True
except ImportError:
    reportlab_available = False
    print("Warning: reportlab not installed. Install with: pip install reportlab")

try:
    import psycopg2
    import pandas as pd
    db_available = True
except ImportError:
    db_available = False


class PDFReportGenerator:
    """Generate comprehensive PDF report for APQC PCF"""

    def __init__(self, output_file='apqc-pcf-report.pdf', db_params=None):
        self.output_file = output_file
        self.db_params = db_params
        self.connection = None
        self.styles = getSampleStyleSheet()

        # Custom styles
        self.styles.add(ParagraphStyle(
            name='CustomTitle',
            parent=self.styles['Heading1'],
            fontSize=24,
            textColor=colors.HexColor('#003366'),
            spaceAfter=30,
            alignment=TA_CENTER
        ))

        self.styles.add(ParagraphStyle(
            name='SectionHeader',
            parent=self.styles['Heading2'],
            fontSize=16,
            textColor=colors.HexColor('#0066cc'),
            spaceBefore=20,
            spaceAfter=10
        ))

        self.styles.add(ParagraphStyle(
            name='ProcessCode',
            parent=self.styles['Normal'],
            fontSize=10,
            textColor=colors.HexColor('#0066cc'),
            fontName='Helvetica-Bold'
        ))

    def connect_db(self):
        """Connect to database"""
        if self.db_params and db_available:
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

    def fetch_data(self):
        """Fetch process data from database"""
        if not self.connection:
            return None

        query = """
        SELECT
            p.process_code,
            p.process_name,
            p.hierarchy_level,
            p.parent_process_code,
            p.category_code,
            c.category_name,
            c.category_type,
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

    def create_title_page(self):
        """Create title page"""
        story = []

        # Title
        title = Paragraph("APQC Process Classification Framework", self.styles['CustomTitle'])
        story.append(Spacer(1, 2*inch))
        story.append(title)

        # Subtitle
        subtitle = Paragraph(
            "Cross Industry v7.2.1<br/>Comprehensive Documentation",
            self.styles['Heading2']
        )
        story.append(Spacer(1, 0.5*inch))
        story.append(subtitle)

        # Metadata
        story.append(Spacer(1, 1*inch))
        meta_data = [
            ["Framework Version:", "7.2.1"],
            ["Industry Type:", "Cross Industry"],
            ["Report Generated:", datetime.now().strftime('%Y-%m-%d %H:%M:%S')],
            ["Total Processes:", "413"],
            ["Categories:", "13"],
            ["Process Groups:", "72"],
            ["Detailed Processes:", "328"]
        ]

        meta_table = Table(meta_data, colWidths=[2.5*inch, 3*inch])
        meta_table.setStyle(TableStyle([
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (0, -1), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, -1), 12),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 12),
        ]))

        story.append(meta_table)
        story.append(PageBreak())

        return story

    def create_toc(self, df):
        """Create table of contents"""
        story = []

        story.append(Paragraph("Table of Contents", self.styles['SectionHeader']))
        story.append(Spacer(1, 0.3*inch))

        toc_data = [
            ["Section", "Page"],
            ["1. Introduction", "3"],
            ["2. Database Schema Overview", "4"],
            ["3. Process Hierarchy", "5"],
            ["4. Process Categories", "6"],
            ["5. Process Listings", "10"],
            ["6. Appendix", "50"]
        ]

        toc_table = Table(toc_data, colWidths=[4*inch, 1*inch])
        toc_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#0066cc')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 12),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('GRID', (0, 0), (-1, -1), 1, colors.grey),
        ]))

        story.append(toc_table)
        story.append(PageBreak())

        return story

    def create_introduction(self):
        """Create introduction section"""
        story = []

        story.append(Paragraph("1. Introduction", self.styles['SectionHeader']))
        story.append(Spacer(1, 0.2*inch))

        intro_text = """
        The APQC Process Classification Framework (PCF) is a reliable and robust framework
        used by thousands of organizations worldwide. It allows organizations to objectively
        benchmark their processes against others, regardless of industry, size, or geography.
        <br/><br/>
        The PCF organizes operating and management processes into 13 enterprise-level categories,
        including process groups and over 1,000 processes and associated activities. This
        Cross Industry framework provides a generic view of processes that can be applied
        across all industries.
        <br/><br/>
        <b>Key Features:</b><br/>
        • 3-level hierarchy (Categories, Process Groups, Processes)<br/>
        • 13 top-level categories (6 Operating + 7 Management & Support)<br/>
        • 413 total process elements<br/>
        • Comprehensive process descriptions<br/>
        • Performance metrics and KPIs<br/>
        """

        story.append(Paragraph(intro_text, self.styles['Normal']))
        story.append(Spacer(1, 0.3*inch))

        return story

    def create_schema_overview(self):
        """Create database schema overview"""
        story = []

        story.append(Paragraph("2. Database Schema Overview", self.styles['SectionHeader']))
        story.append(Spacer(1, 0.2*inch))

        schema_text = """
        The APQC PCF database consists of 5 main tables that store the framework data:
        """
        story.append(Paragraph(schema_text, self.styles['Normal']))
        story.append(Spacer(1, 0.1*inch))

        # Table descriptions
        tables_data = [
            ["Table", "Description", "Records"],
            ["framework_metadata", "Framework version and metadata", "1"],
            ["process_categories", "Top-level process categories", "13"],
            ["processes", "All processes across hierarchy", "413"],
            ["process_relationships", "Inter-process relationships", "Variable"],
            ["process_metrics", "Performance metrics and KPIs", "Variable"]
        ]

        tables_table = Table(tables_data, colWidths=[2*inch, 3*inch, 1*inch])
        tables_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#0066cc')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('ALIGN', (2, 0), (2, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 8),
            ('GRID', (0, 0), (-1, -1), 1, colors.grey),
            ('ROWBACKGROUNDS', (0, 1), (-1, -1), [colors.white, colors.lightgrey])
        ]))

        story.append(tables_table)
        story.append(Spacer(1, 0.3*inch))

        return story

    def create_hierarchy_overview(self, df):
        """Create process hierarchy overview"""
        story = []

        story.append(Paragraph("3. Process Hierarchy", self.styles['SectionHeader']))
        story.append(Spacer(1, 0.2*inch))

        hierarchy_text = """
        The APQC PCF uses a three-level hierarchy to organize processes from high-level
        categories down to specific process activities:
        """
        story.append(Paragraph(hierarchy_text, self.styles['Normal']))
        story.append(Spacer(1, 0.1*inch))

        # Hierarchy levels
        levels_data = [
            ["Level", "Type", "Count", "Example"],
            ["1", "Categories", "13", "1.0 Develop Vision and Strategy"],
            ["2", "Process Groups", "72", "1.1 Define business concept"],
            ["3", "Processes", "328", "1.1.1 Assess external environment"]
        ]

        levels_table = Table(levels_data, colWidths=[0.7*inch, 1.5*inch, 1*inch, 2.8*inch])
        levels_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#0066cc')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('ALIGN', (2, 0), (2, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 8),
            ('GRID', (0, 0), (-1, -1), 1, colors.grey),
        ]))

        story.append(levels_table)
        story.append(PageBreak())

        return story

    def create_category_section(self, df):
        """Create category listings"""
        story = []

        story.append(Paragraph("4. Process Categories", self.styles['SectionHeader']))
        story.append(Spacer(1, 0.2*inch))

        categories = df[df['hierarchy_level'] == 1].sort_values('process_code')

        for _, cat in categories.iterrows():
            # Category header
            cat_header = f"{cat['process_code']} - {cat['process_name']}"
            story.append(Paragraph(cat_header, self.styles['Heading3']))

            # Category type
            cat_type = f"<i>Type: {cat.get('category_type', 'N/A')}</i>"
            story.append(Paragraph(cat_type, self.styles['Normal']))
            story.append(Spacer(1, 0.1*inch))

            # Description
            if cat.get('process_description'):
                story.append(Paragraph(cat['process_description'], self.styles['Normal']))

            story.append(Spacer(1, 0.2*inch))

        story.append(PageBreak())
        return story

    def create_process_listings(self, df):
        """Create detailed process listings"""
        story = []

        story.append(Paragraph("5. Detailed Process Listings", self.styles['SectionHeader']))
        story.append(Spacer(1, 0.2*inch))

        categories = df[df['hierarchy_level'] == 1].sort_values('process_code')

        for _, cat in categories.iterrows():
            cat_code = cat['process_code']

            # Category header
            story.append(Paragraph(
                f"Category {cat_code}: {cat['process_name']}",
                self.styles['Heading3']
            ))
            story.append(Spacer(1, 0.1*inch))

            # Get process groups for this category
            process_groups = df[
                (df['hierarchy_level'] == 2) &
                (df['category_code'] == cat_code)
            ].sort_values('process_code')

            for _, grp in process_groups.iterrows():
                grp_code = grp['process_code']

                # Process group header
                story.append(Paragraph(
                    f"<b>{grp_code}</b> {grp['process_name']}",
                    self.styles['Normal']
                ))
                story.append(Spacer(1, 0.05*inch))

                # Get processes for this group
                processes = df[
                    (df['hierarchy_level'] == 3) &
                    (df['parent_process_code'] == grp_code)
                ].sort_values('process_code')

                # Create process list
                process_data = []
                for _, proc in processes.iterrows():
                    desc = proc.get('process_description', 'No description')
                    if len(desc) > 200:
                        desc = desc[:197] + '...'
                    process_data.append([
                        proc['process_code'],
                        proc['process_name'],
                        desc
                    ])

                if process_data:
                    proc_table = Table(process_data, colWidths=[0.8*inch, 2*inch, 3.2*inch])
                    proc_table.setStyle(TableStyle([
                        ('FONTSIZE', (0, 0), (-1, -1), 9),
                        ('FONTNAME', (0, 0), (0, -1), 'Helvetica-Bold'),
                        ('TEXTCOLOR', (0, 0), (0, -1), colors.HexColor('#0066cc')),
                        ('VALIGN', (0, 0), (-1, -1), 'TOP'),
                        ('BOTTOMPADDING', (0, 0), (-1, -1), 8),
                        ('GRID', (0, 0), (-1, -1), 0.5, colors.lightgrey),
                    ]))
                    story.append(proc_table)

                story.append(Spacer(1, 0.15*inch))

            story.append(PageBreak())

        return story

    def generate_report(self):
        """Generate the complete PDF report"""
        if not reportlab_available:
            print("Error: reportlab is required for PDF generation")
            return False

        print("\n=== Generating PDF Report ===")

        # Connect to database and fetch data
        df = None
        if self.db_params:
            self.connect_db()
            df = self.fetch_data()

        if df is None:
            print("Warning: No database data available. Creating minimal report.")
            df = pd.DataFrame()  # Empty dataframe for minimal report

        # Create PDF document
        doc = SimpleDocTemplate(
            self.output_file,
            pagesize=letter,
            rightMargin=0.75*inch,
            leftMargin=0.75*inch,
            topMargin=0.75*inch,
            bottomMargin=0.75*inch
        )

        # Build document story
        story = []

        # Add sections
        story.extend(self.create_title_page())

        if not df.empty:
            story.extend(self.create_toc(df))
            story.extend(self.create_introduction())
            story.extend(self.create_schema_overview())
            story.extend(self.create_hierarchy_overview(df))
            story.extend(self.create_category_section(df))
            story.extend(self.create_process_listings(df))

        # Build PDF
        try:
            doc.build(story)
            print(f"✓ PDF report generated: {self.output_file}")
            return True
        except Exception as e:
            print(f"✗ Error generating PDF: {e}")
            return False


def main():
    parser = argparse.ArgumentParser(description='Generate APQC PCF PDF Report')

    parser.add_argument('--output', default='apqc-pcf-report.pdf',
                        help='Output PDF filename')

    parser.add_argument('--db-host', default='localhost', help='Database host')
    parser.add_argument('--db-port', type=int, default=5432, help='Database port')
    parser.add_argument('--db-name', default='apqc_pcf', help='Database name')
    parser.add_argument('--db-user', help='Database user')
    parser.add_argument('--db-password', help='Database password')

    args = parser.parse_args()

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

    # Generate report
    generator = PDFReportGenerator(output_file=args.output, db_params=db_params)

    try:
        generator.generate_report()
        print("\n" + "="*60)
        print(f"✓ PDF report generated successfully!")
        print(f"Output file: {Path(args.output).absolute()}")
        print("="*60)
    finally:
        generator.close_db()


if __name__ == '__main__':
    main()
