# CMS Workflow Documentation

This repository uses a CMS (Content Management System) that directly edits files in the Git repository. This can cause merge conflicts when syncing local changes with CMS updates.

## 🚀 Quick Start

To sync with CMS changes, simply run:

```bash
./sync-cms.sh
```

This script will:
1. Check for local changes
2. Fetch latest CMS updates
3. Automatically resolve common conflicts
4. Show you what changed

## 📁 Files Overview

- **`sync-cms.sh`** - Main workflow script for syncing with CMS
- **`merge-strategy.sh`** - Automatic conflict resolution script
- **`.git/hooks/post-merge`** - Git hook that runs after merges

## 🔧 How It Works

### Automatic Conflict Resolution

The system automatically handles common CMS conflicts:

1. **YAML Content Formatting**: Converts between `content: |` and `content: >-` formats
2. **Line Break Issues**: Fixes extra backslashes and inconsistent formatting
3. **Merge Markers**: Removes Git conflict markers when possible

### Conflict Patterns Handled

- Content formatting conflicts (literal vs folded YAML)
- Extra backslashes from CMS editing
- Inconsistent indentation
- Common merge marker patterns

## 🛠️ Manual Conflict Resolution

If automatic resolution fails, you'll need to resolve conflicts manually:

1. **Check for conflict markers**:
   ```bash
   git grep "<<<<<<< HEAD" content/
   ```

2. **Edit conflicted files** and remove conflict markers
3. **Add and commit**:
   ```bash
   git add .
   git commit -m "Resolve manual conflicts"
   ```

## 📋 Best Practices

### Before Syncing
- Commit or stash any local changes
- Make sure you're on the main branch
- Backup important local changes

### Regular Maintenance
- Run `./sync-cms.sh` regularly (daily/weekly)
- Review changes after each sync
- Test the site after major CMS updates

### When Conflicts Occur
1. Don't panic - conflicts are normal with CMS workflows
2. Let the automatic resolution try first
3. If manual resolution is needed, focus on preserving content over formatting
4. Test the site after resolving conflicts

## 🔍 Troubleshooting

### Common Issues

**"You have uncommitted local changes"**
- Commit your changes: `git add . && git commit -m "Your message"`
- Or stash them: `git stash`

**"Some conflicts could not be automatically resolved"**
- Check the conflicted files manually
- Look for `<<<<<<< HEAD` markers
- Edit the files to resolve conflicts
- Commit the resolution

**"Found remaining conflict markers"**
- Search for conflict markers: `git grep "<<<<<<< HEAD"`
- Edit the files to remove markers
- Commit the changes

### Getting Help

If you encounter persistent issues:

1. Check the Git status: `git status`
2. Look at recent commits: `git log --oneline -10`
3. Check for conflict markers: `git grep "<<<<<<< HEAD"`
4. Consider resetting to a clean state: `git reset --hard origin/main`

## 📝 Notes

- The CMS typically updates files in the `content/` directory
- Most conflicts are formatting-related, not content-related
- The automatic resolution preserves content while fixing formatting
- Always test the site after resolving conflicts

## 🔄 Workflow Summary

1. **Regular sync**: `./sync-cms.sh`
2. **If conflicts**: Let automatic resolution handle them
3. **If manual needed**: Edit files, remove markers, commit
4. **Test**: Verify the site works correctly
5. **Repeat**: Sync regularly to avoid large conflicts
