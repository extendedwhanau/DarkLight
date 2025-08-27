#!/bin/bash

# Merge Strategy Script for CMS Conflicts
# This script helps resolve common conflicts when CMS updates are merged

echo "🔧 Running merge strategy for CMS conflicts..."

# Function to resolve YAML content conflicts
resolve_yaml_content_conflicts() {
    local file="$1"
    
    if [[ -f "$file" ]]; then
        echo "📝 Processing $file for YAML content conflicts..."
        
        # Replace common CMS conflict patterns
        # Pattern 1: Content formatting conflicts (| vs >-)
        sed -i.tmp '/<<<<<<< HEAD/,/>>>>>>> /c\
    content: |\
      Artist: MAD Studios (Matt Liggins & Angus Muir)\
      Sound Design: Arli Liberman\
      Animation Design: Pixelpush Han Law & SiewWee Hng\
      Fabrication: Alistair Munro\
\
      The beauty of sunrise and sunset is distilled into an analogue, pixelated audiovisual experience, mirroring our planets daily encounter with the sun.' "$file"
        
        # Remove temporary files
        rm -f "$file.tmp"
        
        echo "✅ Processed $file"
    fi
}

# Function to resolve common CMS formatting issues
resolve_cms_formatting() {
    local file="$1"
    
    if [[ -f "$file" ]]; then
        echo "🎨 Fixing CMS formatting in $file..."
        
        # Fix common CMS formatting issues
        # Remove extra backslashes and fix line breaks
        sed -i.tmp 's/\\$//g' "$file"
        sed -i.tmp 's/\\\n/\n/g' "$file"
        sed -i.tmp 's/\\/g' "$file"
        sed -i.tmp 's/  - /  - /g' "$file"
        
        # Ensure consistent YAML formatting
        sed -i.tmp 's/content: >-/content: |/g' "$file"
        
        # Fix markdown formatting for CMS compatibility
        # Convert any remaining span tags to proper markdown
        sed -i.tmp 's/<span>\([^<]*\)<\/span>/**\1**/g' "$file"
        
        rm -f "$file.tmp"
        echo "✅ Fixed formatting in $file"
    fi
}

# Main execution
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <file1> [file2] ..."
    echo "Or run without arguments to process all content files"
    
    # Process all content files if no arguments provided
    for file in content/*.md; do
        if [[ -f "$file" ]]; then
            resolve_yaml_content_conflicts "$file"
            resolve_cms_formatting "$file"
        fi
    done
else
    # Process specific files
    for file in "$@"; do
        resolve_yaml_content_conflicts "$file"
        resolve_cms_formatting "$file"
    done
fi

echo "🎉 Merge strategy completed!"
