#!/bin/bash

# List all files in the current directory and subdirectories
cd /workspaces/PrometheusAsDataSource/
files=($(find . -type f))

# Sort files by creation date
sorted_files=($(ls -t --time=ctime "${files[@]}"))

# Initialize counter
counter=1

# Loop through sorted files and rename them
for file in "${sorted_files[@]}"; do
    # Extract the filename without the path
    filename=$(basename "$file")
    # Rename the file with the prefix
    mv "$file" "$(dirname "$file")/${counter}_$filename"
    # Increment the counter
    ((counter++))
done
