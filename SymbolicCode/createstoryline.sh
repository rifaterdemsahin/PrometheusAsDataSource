#!/bin/bash

# List all files in the current directory and subdirectories, excluding the .git directory
cd /workspaces/PrometheusAsDataSource/
files=($(find . -type f -not -path "./.git/*"))

# Sort files by creation date
sorted_files=($(ls -t --time=ctime "${files[@]}"))

# Initialize counter
counter=0

# Function to convert a string to lowercase
to_lowercase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# Loop through sorted files and rename them
for file in "${sorted_files[@]}"; do
    # Skip files under the SymbolicCode directory
    if [[ "$file" == ./SymbolicCode/* ]]; then
        continue
    fi
    # Extract the filename without the path
    filename=$(basename "$file")
    # Remove numeric parts at the start of the filename
    new_filename=$(echo "$filename" | sed 's/^[0-9]*_//')
    # Convert the filename to lowercase
    lowercase_filename=$(to_lowercase "$new_filename")
    # Format the counter with leading zeros
    formatted_counter=$(printf "%02d" $counter)
    # Rename the file with the new prefix
    new_file_path="$(dirname "$file")/${formatted_counter}_$lowercase_filename"
    echo "Renaming '$file' to '$new_file_path' with index $counter"
    mv "$file" "$new_file_path"
    # Increment the counter
    ((counter++))
done
