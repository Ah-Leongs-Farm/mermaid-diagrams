#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide the directory containing .mmd files as the first argument."
    exit 1
fi

# Set the correct directory
DIR="$1"

# Change to the correct directory
cd "$(pwd)/$DIR" || { echo "Directory $DIR not found!"; exit 1; }

# Loop through all the .mnd files in the directory
mkdir outputs
for file in *.mmd; do
    if [[ -f "$file" ]]; then
        output_file="${file%.mmd}.svg"
        
        # Generate the diagram using mmdc for each .mnd file
        mmdc -i "$file" -o "outputs/$output_file"
        echo "Generated diagram: $output_file"
    fi
done
