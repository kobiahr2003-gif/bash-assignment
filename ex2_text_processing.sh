#!/bin/bash
# Exercise 2: Text Processing
# Usage: ./ex2_text_processing.sh
#
# Expects a file named data.txt in the current directory,
# containing one name per line.

set -euo pipefail

DATA_FILE="data.txt"

if [ ! -f "$DATA_FILE" ]; then
    echo "Error: '$DATA_FILE' not found in current directory."
    exit 1
fi

total_names=$(wc -l < "$DATA_FILE" | tr -d ' ')
echo "Total number of names: $total_names"

echo ""
echo "Unique names (alphabetical order):"
sort -u "$DATA_FILE"

echo ""
read -rp "Enter a name to search for: " search_name

if grep -qxF "$search_name" "$DATA_FILE"; then
    echo "'$search_name' was found in $DATA_FILE."
else
    echo "'$search_name' was NOT found in $DATA_FILE."
fi
