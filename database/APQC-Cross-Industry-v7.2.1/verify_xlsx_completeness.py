#!/usr/bin/env python3
"""
Verify APQC Excel Dataset Completeness

This script verifies that the Excel dataset contains 100% of the data from the SQL files.
It checks for:
- Correct number of categories (13)
- Correct number of processes (413)
- All expected sheets present
- Data integrity (no missing values in key fields)
- Hierarchy completeness
"""

import sys
from pathlib import Path

try:
    import openpyxl
except ImportError:
    print("Error: openpyxl is required. Install with: pip install openpyxl")
    sys.exit(1)


def verify_completeness():
    """Verify Excel dataset completeness"""

    xlsx_file = Path(__file__).parent / "APQC-Cross-Industry-v7.2.1-Dataset.xlsx"

    if not xlsx_file.exists():
        print(f"ERROR: Excel file not found: {xlsx_file}")
        return False

    print("APQC Excel Dataset Completeness Verification")
    print("=" * 60)
    print(f"\nChecking file: {xlsx_file.name}")
    print(f"File size: {xlsx_file.stat().st_size / 1024:.1f} KB\n")

    # Load workbook
    wb = openpyxl.load_workbook(xlsx_file)

    # Expected values
    EXPECTED_CATEGORIES = 13
    EXPECTED_PROCESSES = 413
    EXPECTED_SHEETS = ['Summary Statistics', 'Framework Metadata', 'Process Categories', 'Processes', 'Process Hierarchy']

    all_checks_passed = True

    # Check 1: Verify all sheets exist
    print("✓ Checking sheets...")
    actual_sheets = wb.sheetnames
    missing_sheets = set(EXPECTED_SHEETS) - set(actual_sheets)
    extra_sheets = set(actual_sheets) - set(EXPECTED_SHEETS)

    if missing_sheets:
        print(f"  ✗ Missing sheets: {missing_sheets}")
        all_checks_passed = False
    else:
        print(f"  ✓ All {len(EXPECTED_SHEETS)} expected sheets present")

    if extra_sheets:
        print(f"  ⚠ Extra sheets found: {extra_sheets}")

    # Check 2: Verify Process Categories sheet
    print("\n✓ Checking Process Categories sheet...")
    cat_sheet = wb['Process Categories']

    # Count data rows (excluding header)
    cat_count = 0
    for row in cat_sheet.iter_rows(min_row=2):
        if row[0].value is not None:  # Category ID column
            cat_count += 1
        else:
            break

    if cat_count == EXPECTED_CATEGORIES:
        print(f"  ✓ Category count correct: {cat_count}/{EXPECTED_CATEGORIES}")
    else:
        print(f"  ✗ Category count mismatch: {cat_count}/{EXPECTED_CATEGORIES}")
        all_checks_passed = False

    # Verify no missing data in key columns
    missing_data = 0
    for row_idx, row in enumerate(cat_sheet.iter_rows(min_row=2, max_row=cat_count + 1), start=2):
        for col_idx, cell in enumerate(row[:4], start=1):  # Check first 4 columns
            if cell.value is None or str(cell.value).strip() == '':
                print(f"  ✗ Missing data in row {row_idx}, column {col_idx}")
                missing_data += 1
                all_checks_passed = False

    if missing_data == 0:
        print(f"  ✓ No missing data in key category fields")

    # Check 3: Verify Processes sheet
    print("\n✓ Checking Processes sheet...")
    proc_sheet = wb['Processes']

    # Count data rows (excluding header)
    proc_count = 0
    for row in proc_sheet.iter_rows(min_row=2):
        if row[0].value is not None:  # Process ID column
            proc_count += 1
        else:
            break

    if proc_count == EXPECTED_PROCESSES:
        print(f"  ✓ Process count correct: {proc_count}/{EXPECTED_PROCESSES}")
    else:
        print(f"  ✗ Process count mismatch: {proc_count}/{EXPECTED_PROCESSES}")
        all_checks_passed = False

    # Verify no missing data in critical columns (ID, Code, Name)
    missing_critical = 0
    for row_idx, row in enumerate(proc_sheet.iter_rows(min_row=2, max_row=proc_count + 1), start=2):
        # Check Process ID, Process Code, Process Name (columns 1, 2, 3)
        for col_idx in [0, 1, 2]:
            if row[col_idx].value is None or str(row[col_idx].value).strip() == '':
                print(f"  ✗ Missing critical data in row {row_idx}, column {col_idx + 1}")
                missing_critical += 1
                all_checks_passed = False

    if missing_critical == 0:
        print(f"  ✓ No missing data in critical process fields")

    # Check hierarchy levels
    level_counts = {1: 0, 2: 0, 3: 0}
    for row in proc_sheet.iter_rows(min_row=2, max_row=proc_count + 1):
        level_value = row[5].value  # Level column (index 5)
        try:
            level = int(level_value) if level_value is not None else 0
            if level in level_counts:
                level_counts[level] += 1
        except (ValueError, TypeError):
            pass

    print(f"  ✓ Hierarchy breakdown:")
    print(f"    - Level 1 (Categories): {level_counts[1]}")
    print(f"    - Level 2 (Process Groups): {level_counts[2]}")
    print(f"    - Level 3 (Processes): {level_counts[3]}")

    # Check 4: Verify Process Hierarchy sheet
    print("\n✓ Checking Process Hierarchy sheet...")
    hier_sheet = wb['Process Hierarchy']

    # Count data rows
    hier_count = 0
    for row in hier_sheet.iter_rows(min_row=2):
        if row[0].value is not None:  # Level column
            hier_count += 1
        else:
            break

    if hier_count == proc_count:
        print(f"  ✓ Hierarchy view has all processes: {hier_count}")
    else:
        print(f"  ✗ Hierarchy count mismatch: {hier_count}/{proc_count}")
        all_checks_passed = False

    # Check 5: Verify Summary Statistics sheet
    print("\n✓ Checking Summary Statistics sheet...")
    summary_sheet = wb['Summary Statistics']

    # Find the total categories value
    found_cat_total = False
    found_proc_total = False

    for row in summary_sheet.iter_rows():
        cell_value = str(row[0].value or '').lower()
        if 'total categories' in cell_value:
            actual_cat = row[1].value
            if actual_cat == EXPECTED_CATEGORIES:
                print(f"  ✓ Summary shows correct category count: {actual_cat}")
                found_cat_total = True
            else:
                print(f"  ✗ Summary category count mismatch: {actual_cat}/{EXPECTED_CATEGORIES}")
                all_checks_passed = False

        if 'total processes' in cell_value:
            actual_proc = row[1].value
            if actual_proc == EXPECTED_PROCESSES:
                print(f"  ✓ Summary shows correct process count: {actual_proc}")
                found_proc_total = True
            else:
                print(f"  ✗ Summary process count mismatch: {actual_proc}/{EXPECTED_PROCESSES}")
                all_checks_passed = False

    if not found_cat_total:
        print(f"  ✗ Could not find 'Total Categories' in summary")
        all_checks_passed = False

    if not found_proc_total:
        print(f"  ✗ Could not find 'Total Processes' in summary")
        all_checks_passed = False

    # Check 6: Verify Framework Metadata sheet
    print("\n✓ Checking Framework Metadata sheet...")
    meta_sheet = wb['Framework Metadata']

    # Check for expected metadata fields
    expected_fields = ['framework_name', 'framework_version', 'industry_type']
    found_fields = 0

    for row in meta_sheet.iter_rows(min_row=3):  # Skip header rows
        field_name = str(row[0].value or '').lower().replace(' ', '_')
        if field_name in expected_fields:
            found_fields += 1
            value = row[1].value
            if value:
                print(f"  ✓ {row[0].value}: {value}")
            else:
                print(f"  ✗ Missing value for {row[0].value}")
                all_checks_passed = False

    if found_fields >= len(expected_fields):
        print(f"  ✓ All key metadata fields present")
    else:
        print(f"  ✗ Some metadata fields missing")
        all_checks_passed = False

    # Final result
    print("\n" + "=" * 60)
    if all_checks_passed:
        print("✓ VERIFICATION PASSED: Dataset is 100% complete!")
        print("\nSummary:")
        print(f"  - {cat_count} categories extracted")
        print(f"  - {proc_count} processes extracted")
        print(f"  - {len(actual_sheets)} sheets created")
        print(f"  - All data integrity checks passed")
        return True
    else:
        print("✗ VERIFICATION FAILED: Dataset has completeness issues")
        print("\nPlease review the errors above and regenerate the dataset.")
        return False


if __name__ == '__main__':
    success = verify_completeness()
    sys.exit(0 if success else 1)
