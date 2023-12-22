#!/bin/bash

# Initialize global counts
global_total_sequences=0
global_total_length=0

# Print stylish header
echo "====================== FASTASCAN REPORT ======================"

# Function to determine if a file contains protein or nucleotide sequences
get_sequence_type() {
    if grep -q -E 'U|T|C|A|G' "$1"; then
        echo "Nucleotide"
    else
        echo "Protein"
    fi
}

# Function to process each fasta/fa file
process_file() {
    local file="$1"
    local is_symlink=""
    
    # Check if the file is a symlink
    if [ -L "$file" ]; then
        is_symlink=" (symlink)"
    fi

    # Get sequence type
    local seq_type=$(get_sequence_type "$file")
    
    # Extract counts and lengths
    local num_sequences=$(grep -c '^>' "$file")
    local total_length=$(grep -v '^>' "$file" | tr -d '\n' | wc -c)
    
    # Update global counts
    (( global_total_sequences += num_sequences ))
    (( global_total_length += total_length ))
    
    # Print file details
    echo "---------------------------------------------------------------"
    echo "File: $file$is_symlink"
    echo "Type: $seq_type"
    echo "Number of sequences: $num_sequences"
    echo "Total sequence length: $total_length"
}

# Function to recursively scan folders
scan_folder() {
    local folder="$1"
    
    for entry in "$folder"/*; do
        if [ -d "$entry" ]; then
            scan_folder "$entry"
        elif [[ "$entry" == *.fa || "$entry" == *.fasta ]]; then
            process_file "$entry"
        fi
    done
}

# Start processing based on user-provided folder or default to current directory
if [ -z "$1" ]; then
    scan_folder "."
elif [ ! -d "$1" ]; then
    echo "Error: Provided directory '$1' does not exist."
    exit 1
else
    scan_folder "$1"
fi

# Check if any fasta/fa files were found
if [ $global_total_sequences -eq 0 ]; then
    echo "No fasta/fa files found in the specified directory or its subdirectories."
    exit 0
fi

# Print global summary
echo "---------------------------------------------------------------"
echo "Global Summary:"
echo "Total sequences across all files: $global_total_sequences"
echo "Total sequence length across all files: $global_total_length"
echo "========================== END OF REPORT ========================="

# Get a single title from the first fasta/fa file found (if any)
title=$(grep '^>' $(find . -type f \( -name "*.fa" -o -name "*.fasta" \) | head -n 1) | head -n 1)
if [ -n "$title" ]; then
    echo "Single title example: $title"
fi

