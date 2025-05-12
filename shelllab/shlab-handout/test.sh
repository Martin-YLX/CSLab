#!/usr/bin/env bash
# compare_tests.sh - Compare tsh vs tshref for trace01..16 ignoring PIDs

# Log all output to output.txt
exec > >(tee output.txt)
exec 2>&1

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'  # No Color

# Header
echo -e "
======= Shell Lab Automated Tests =======
"
for i in {01..16}; do
    trace="trace${i}.txt"
    echo ">>> Test ${i}: ${trace}"

    # Capture and normalize output
    out_tsh=$(./sdriver.pl -t "$trace" -s ./tsh -a "-p" |
              sed -E 's/\[[0-9]+\]/[JID]/g; s/\([0-9]+\)/\(PID\)/g')
    out_ref=$(./sdriver.pl -t "$trace" -s ./tshref -a "-p" |
              sed -E 's/\[[0-9]+\]/[JID]/g; s/\([0-9]+\)/\(PID\)/g')

    # Compare normalized outputs
    if diff -q <(printf "%s\n" "$out_tsh") <(printf "%s\n" "$out_ref") &>/dev/null; then
        echo -e "  ${GREEN}✔ PASS${NC}"
    else
        echo -e "  ${YELLOW}✗ WAITING TO CHECK${NC}"
        echo "--- tsh output ---"
        printf "%s\n" "$out_tsh"
        echo "--- tshref output ---"
        printf "%s\n" "$out_ref"
    fi
    echo
done

