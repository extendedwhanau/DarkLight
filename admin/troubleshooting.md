# CMS Image Upload Troubleshooting Guide

## Common Issues and Solutions

### 1. Image Upload Not Working
- **Check browser console** for JavaScript errors
- **Verify Netlify Identity** is properly configured
- **Ensure you're logged in** to the CMS
- **Check file permissions** on the images/uploads folder

### 2. Images Not Displaying After Upload
- **Verify media folder path**: Should be `images/uploads`
- **Check public folder path**: Should be `/images/uploads`
- **Ensure proper file extensions**: .jpg, .png, .gif, .svg
- **Check file size**: Large files may timeout

### 3. CMS Configuration Issues
- **Media folder**: `images/uploads`
- **Public folder**: `/images/uploads`
- **Backend**: git-gateway
- **Branch**: main
- **Media library**: Uses default Decap CMS media library (no custom configuration needed)

### 4. Debugging Steps
1. Open browser developer tools (F12)
2. Go to Console tab
3. Try uploading an image
4. Look for error messages
5. Check Network tab for failed requests

### 5. File Structure
```
images/
├── uploads/          # CMS uploads go here
├── partners/         # Partner logos
└── background-image.jpg
```

### 6. Common Error Messages
- **"Failed to upload"**: Check file size and format
- **"Permission denied"**: Verify git-gateway access
- **"Media library not found"**: Check CMS initialization

### 7. Testing Image Upload
1. Go to `/admin`
2. Login with Netlify Identity
3. Edit Home page
4. Try uploading a small test image (< 1MB)
5. Check if image appears in media library
6. Verify image path in content

### 8. Manual Image Upload
If CMS upload fails:
1. Upload image directly to `images/uploads/` folder
2. Commit to git repository
3. Reference in CMS as `/images/uploads/filename.jpg` 