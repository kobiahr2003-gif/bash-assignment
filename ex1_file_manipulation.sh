#!/bin/bash
# Exercise 1: File Manipulation
# Usage: ./ex1_file_manipulation.sh <directory_path>
#
# - Lists all .txt files in the given directory
# - Creates a "backup" subdirectory inside it
# - Copies all .txt files into that backup directory

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' is not a valid directory."
    exit 1
fi

echo "== .txt files in '$DIR' =="

# Use -print0 / mapfile so filenames with spaces are handled safely
mapfile -d '' txt_files < <(find "$DIR" -maxdepth 1 -type f -name "*.txt" -print0)

if [ ${#txt_files[@]} -eq 0 ]; then
    echo "No .txt files found in '$DIR'."
    exit 0
fi

for f in "${txt_files[@]}"; do
    echo "  $(basename "$f")"
done

BACKUP_DIR="$DIR/backup"
mkdir -p "$BACKUP_DIR"
echo ""
echo "Backup directory ready: $BACKUP_DIR"

for f in "${txt_files[@]}"; do
    cp -- "$f" "$BACKUP_DIR"
    echo "Copied: $(basename "$f")"
done

echo ""
echo "Done. All .txt files copied to $BACKUP_DIR"
