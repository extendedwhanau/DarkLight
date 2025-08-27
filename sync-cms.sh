#!/bin/bash

# CMS Sync Workflow Script
# This script helps sync local repository with CMS changes

set -e  # Exit on any error

echo "🔄 Starting CMS sync workflow..."

# Function to check if there are any local changes
check_local_changes() {
    if ! git diff-index --quiet HEAD --; then
        echo "⚠️  You have uncommitted local changes."
        echo "Please commit or stash them before syncing with CMS."
        exit 1
    fi
}

# Function to pull and merge CMS changes
pull_cms_changes() {
    echo "📥 Fetching latest changes from CMS..."
    git fetch origin
    
    # Check if there are new changes
    if git rev-list HEAD..origin/main --count | grep -q "0"; then
        echo "✅ Already up to date with CMS changes."
        return 0
    fi
    
    echo "📋 New changes detected. Attempting to merge..."
    
    # Try to merge with automatic conflict resolution
    if git merge origin/main --no-edit; then
        echo "✅ Successfully merged CMS changes."
    else
        echo "⚠️  Merge conflicts detected. Running conflict resolution..."
        
        # Run our merge strategy
        ./merge-strategy.sh
        
        # Check if conflicts are resolved
        if git diff --name-only --diff-filter=U | grep -q .; then
            echo "❌ Some conflicts could not be automatically resolved."
            echo "Please resolve remaining conflicts manually and then run:"
            echo "  git add . && git commit"
            exit 1
        else
            echo "✅ Conflicts resolved automatically."
            git add .
            git commit --no-edit -m "Auto-resolve CMS conflicts"
        fi
    fi
}

# Function to show what changed
show_changes() {
    echo "📊 Recent changes from CMS:"
    git log --oneline HEAD~5..HEAD
}

# Main execution
echo "🔍 Checking local repository status..."
check_local_changes

echo "🔄 Syncing with CMS changes..."
pull_cms_changes

echo "📊 Showing recent changes..."
show_changes

echo "🎉 CMS sync completed successfully!"
echo ""
echo "💡 Tips:"
echo "  - Run this script regularly to stay in sync with CMS changes"
echo "  - If you have local changes, commit them first"
echo "  - Check the output above for any manual intervention needed"
