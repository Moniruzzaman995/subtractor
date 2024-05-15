#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <file> <pattern>"
    exit 1
fi

# Input file
input_file=$1

# String pattern to filter subdomains
pattern=$2

# Output file
output_file="unique_subdomains.txt"

# Extract subdomains, filter by pattern, sort them, and store unique subdomains in the output file
grep -oP '([a-zA-Z0-9-]+\.)+[a-zA-Z]+' "$input_file" | grep "$pattern" | sort | uniq > "$output_file"

echo "Unique subdomains containing the pattern '$pattern' have been stored in $output_file"

