#!/bin/bash
# ============================================================================
# APQC PCF Report Runner
# ============================================================================
#
# This script runs all APQC PCF reports and saves output to files
#
# Usage:
#   ./run_reports.sh [database_type] [database_name] [output_directory]
#
# Examples:
#   ./run_reports.sh postgresql apqc_pcf reports_output
#   ./run_reports.sh mysql apqc_pcf ./output
#
# ============================================================================

set -e  # Exit on error

# Configuration
DB_TYPE=${1:-postgresql}
DB_NAME=${2:-apqc_pcf}
OUTPUT_DIR=${3:-report_output}
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${GREEN}============================================================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${GREEN}============================================================================${NC}"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Main execution
print_header "APQC PCF Report Runner"
echo ""
echo "Database Type: $DB_TYPE"
echo "Database Name: $DB_NAME"
echo "Output Directory: $OUTPUT_DIR"
echo "Timestamp: $TIMESTAMP"
echo ""

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Get connection parameters
case $DB_TYPE in
    postgresql|postgres|pg)
        DB_TYPE="postgresql"
        DB_CMD="psql"
        if ! command -v psql &> /dev/null; then
            print_error "psql not found. Please install PostgreSQL client."
            exit 1
        fi
        ;;
    mysql|mariadb)
        DB_TYPE="mysql"
        DB_CMD="mysql"
        if ! command -v mysql &> /dev/null; then
            print_error "mysql not found. Please install MySQL client."
            exit 1
        fi
        ;;
    sqlserver|mssql)
        DB_TYPE="sqlserver"
        DB_CMD="sqlcmd"
        if ! command -v sqlcmd &> /dev/null; then
            print_error "sqlcmd not found. Please install SQL Server client."
            exit 1
        fi
        ;;
    *)
        print_error "Unsupported database type: $DB_TYPE"
        exit 1
        ;;
esac

print_info "Using $DB_TYPE database"

# Report files
REPORTS=(
    "01-process-hierarchy-report.sql"
    "02-process-table-report.sql"
    "03-category-summary-report.sql"
    "04-process-metrics-report.sql"
)

# Run each report
for report in "${REPORTS[@]}"; do
    report_name=$(basename "$report" .sql)
    output_file="$OUTPUT_DIR/${report_name}_${TIMESTAMP}.txt"

    print_info "Running $report_name..."

    case $DB_TYPE in
        postgresql)
            if psql -d "$DB_NAME" -f "$report" > "$output_file" 2>&1; then
                print_success "Report saved to $output_file"
            else
                print_error "Failed to generate $report_name"
            fi
            ;;
        mysql)
            if mysql "$DB_NAME" < "$report" > "$output_file" 2>&1; then
                print_success "Report saved to $output_file"
            else
                print_error "Failed to generate $report_name"
            fi
            ;;
        sqlserver)
            if sqlcmd -d "$DB_NAME" -i "$report" -o "$output_file" 2>&1; then
                print_success "Report saved to $output_file"
            else
                print_error "Failed to generate $report_name"
            fi
            ;;
    esac
done

print_header "Report Generation Complete"
print_info "All reports saved to: $OUTPUT_DIR/"
echo ""
print_info "To generate reports in CSV, HTML, or Excel format, use:"
echo "  python generate_reports.py --db $DB_TYPE --report all --format csv"
echo ""
