#!/bin/bash
# ============================================================================
# APQC PCF Database Setup Script
# ============================================================================
#
# This script sets up the complete APQC Process Classification Framework
# database for Cross Industry v7.2.1
#
# Usage:
#   ./setup_database.sh [database_type] [database_name]
#
# Parameters:
#   database_type: postgresql, mysql, or sqlserver (default: postgresql)
#   database_name: name of the database to create (default: apqc_pcf)
#
# Prerequisites:
#   - PostgreSQL/MySQL/SQL Server installed and running
#   - Appropriate client tools (psql, mysql, or sqlcmd)
#   - Database user with CREATE DATABASE privileges
#
# ============================================================================

set -e  # Exit on error

# Configuration
DB_TYPE=${1:-postgresql}
DB_NAME=${2:-apqc_pcf}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${GREEN}============================================================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${GREEN}============================================================================${NC}"
}

print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Main execution
print_header "APQC PCF Database Setup"
echo ""
echo "Database Type: $DB_TYPE"
echo "Database Name: $DB_NAME"
echo "Script Directory: $SCRIPT_DIR"
echo ""

# Verify database type
case $DB_TYPE in
    postgresql|postgres|pg)
        DB_TYPE="postgresql"
        print_info "Using PostgreSQL"
        ;;
    mysql|mariadb)
        DB_TYPE="mysql"
        print_info "Using MySQL/MariaDB"
        ;;
    sqlserver|mssql)
        DB_TYPE="sqlserver"
        print_info "Using SQL Server"
        ;;
    *)
        print_error "Unsupported database type: $DB_TYPE"
        print_info "Supported types: postgresql, mysql, sqlserver"
        exit 1
        ;;
esac

# Check if SQL files exist
if [ ! -f "$SCRIPT_DIR/01-schema.sql" ]; then
    print_error "Schema file not found: $SCRIPT_DIR/01-schema.sql"
    exit 1
fi

if [ ! -f "$SCRIPT_DIR/02-data.sql" ]; then
    print_error "Data file not found: $SCRIPT_DIR/02-data.sql"
    exit 1
fi

# Database-specific setup
case $DB_TYPE in
    postgresql)
        print_header "Setting up PostgreSQL Database"

        # Check if psql is available
        if ! command -v psql &> /dev/null; then
            print_error "psql command not found. Please install PostgreSQL client."
            exit 1
        fi

        # Get connection parameters
        read -p "PostgreSQL host [localhost]: " PG_HOST
        PG_HOST=${PG_HOST:-localhost}

        read -p "PostgreSQL port [5432]: " PG_PORT
        PG_PORT=${PG_PORT:-5432}

        read -p "PostgreSQL admin user [postgres]: " PG_USER
        PG_USER=${PG_USER:-postgres}

        read -sp "PostgreSQL password: " PG_PASSWORD
        echo ""

        export PGPASSWORD=$PG_PASSWORD

        print_info "Creating database..."
        psql -h $PG_HOST -p $PG_PORT -U $PG_USER -c "CREATE DATABASE $DB_NAME;" 2>/dev/null || print_warning "Database may already exist"

        print_info "Running schema creation..."
        psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $DB_NAME -f "$SCRIPT_DIR/01-schema.sql"

        print_info "Loading data..."
        psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $DB_NAME -f "$SCRIPT_DIR/02-data.sql"

        print_info "Creating views..."
        psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $DB_NAME -f "$SCRIPT_DIR/03-views.sql"

        print_info "Loading sample metrics..."
        psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $DB_NAME -f "$SCRIPT_DIR/04-sample-metrics.sql"

        unset PGPASSWORD
        ;;

    mysql)
        print_header "Setting up MySQL Database"

        # Check if mysql is available
        if ! command -v mysql &> /dev/null; then
            print_error "mysql command not found. Please install MySQL client."
            exit 1
        fi

        # Get connection parameters
        read -p "MySQL host [localhost]: " MYSQL_HOST
        MYSQL_HOST=${MYSQL_HOST:-localhost}

        read -p "MySQL port [3306]: " MYSQL_PORT
        MYSQL_PORT=${MYSQL_PORT:-3306}

        read -p "MySQL user [root]: " MYSQL_USER
        MYSQL_USER=${MYSQL_USER:-root}

        read -sp "MySQL password: " MYSQL_PASSWORD
        echo ""

        print_info "Creating database..."
        mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

        print_info "Running schema creation..."
        mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME < "$SCRIPT_DIR/01-schema.sql"

        print_info "Loading data..."
        mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME < "$SCRIPT_DIR/02-data.sql"

        print_info "Creating views..."
        mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME < "$SCRIPT_DIR/03-views.sql"

        print_info "Loading sample metrics..."
        mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME < "$SCRIPT_DIR/04-sample-metrics.sql"
        ;;

    sqlserver)
        print_header "Setting up SQL Server Database"

        # Check if sqlcmd is available
        if ! command -v sqlcmd &> /dev/null; then
            print_error "sqlcmd command not found. Please install SQL Server client tools."
            exit 1
        fi

        # Get connection parameters
        read -p "SQL Server host [localhost]: " MSSQL_HOST
        MSSQL_HOST=${MSSQL_HOST:-localhost}

        read -p "SQL Server user [sa]: " MSSQL_USER
        MSSQL_USER=${MSSQL_USER:-sa}

        read -sp "SQL Server password: " MSSQL_PASSWORD
        echo ""

        print_info "Creating database..."
        sqlcmd -S $MSSQL_HOST -U $MSSQL_USER -P $MSSQL_PASSWORD -Q "CREATE DATABASE $DB_NAME;" 2>/dev/null || print_warning "Database may already exist"

        print_info "Running schema creation..."
        sqlcmd -S $MSSQL_HOST -U $MSSQL_USER -P $MSSQL_PASSWORD -d $DB_NAME -i "$SCRIPT_DIR/01-schema.sql"

        print_info "Loading data..."
        sqlcmd -S $MSSQL_HOST -U $MSSQL_USER -P $MSSQL_PASSWORD -d $DB_NAME -i "$SCRIPT_DIR/02-data.sql"

        print_info "Creating views..."
        sqlcmd -S $MSSQL_HOST -U $MSSQL_USER -P $MSSQL_PASSWORD -d $DB_NAME -i "$SCRIPT_DIR/03-views.sql"

        print_info "Loading sample metrics..."
        sqlcmd -S $MSSQL_HOST -U $MSSQL_USER -P $MSSQL_PASSWORD -d $DB_NAME -i "$SCRIPT_DIR/04-sample-metrics.sql"
        ;;
esac

print_header "Database Setup Complete!"
echo ""
print_info "Database '$DB_NAME' has been successfully created and populated."
echo ""
echo "Database Contents:"
echo "  - 1 Framework metadata record"
echo "  - 13 Process categories"
echo "  - 413 Total processes (across 3 hierarchy levels)"
echo "  - Sample metrics and KPIs"
echo "  - Useful views for querying"
echo ""
print_info "You can now connect to the database and start querying the APQC PCF data."
echo ""
print_info "Example connection strings:"
case $DB_TYPE in
    postgresql)
        echo "  psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $DB_NAME"
        ;;
    mysql)
        echo "  mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p $DB_NAME"
        ;;
    sqlserver)
        echo "  sqlcmd -S $MSSQL_HOST -U $MSSQL_USER -P -d $DB_NAME"
        ;;
esac
echo ""
print_info "See README.md for sample queries and usage examples."
echo ""
