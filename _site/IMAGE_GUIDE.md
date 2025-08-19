# Image Resizing Guide for BuildTales

## Overview
All banner images have been automatically resized to the correct dimensions for different card types in your blog. This ensures optimal display without cropping or distortion.

## Resized Images Location
All resized images are stored in: `assets/banners/resized/`

## Image Dimensions by Card Type

### 1. Recent Post Cards (Main Page)
- **Dimensions**: 400x140 pixels
- **File suffix**: `-recent.jpg`
- **Usage**: Recent articles section on the homepage
- **Example**: `wire_transfers-recent.jpg`

### 2. Blog Post Cards (Blog Page)
- **Dimensions**: 400x160 pixels
- **File suffix**: `-blog.jpg`
- **Usage**: Individual blog post cards on the blog index page
- **Example**: `wire_transfers-blog.jpg`

### 3. Series Cards
- **Dimensions**: 400x200 pixels
- **File suffix**: `-series.jpg`
- **Usage**: Series overview cards
- **Example**: `wire_transfers-series.jpg`

## How to Use in Your Posts

### For Recent Posts (Main Page)
```yaml
---
title: "Your Post Title"
banner_image: "/assets/banners/resized/your-image-recent.jpg"
---
```

### For Blog Posts
```yaml
---
title: "Your Post Title"
banner_image: "/assets/banners/resized/your-image-blog.jpg"
---
```

### For Series
```yaml
---
title: "Your Series Title"
banner_image: "/assets/banners/resized/your-image-series.jpg"
---
```

## Available Images

### Original Images → Resized Versions

## Benefits
✅ **No more chopped images** - All images are properly sized  
✅ **Consistent appearance** - All cards have uniform dimensions  
✅ **Fast loading** - Optimized file sizes (4-15KB each)  
✅ **High quality** - Maintained visual clarity  
✅ **Proper aspect ratios** - Images look great in all contexts  

## Re-running the Resize Script
If you add new images to `assets/banners/`, simply run:
```bash
./resize_images.sh
```

This will create resized versions for all new images while preserving existing ones.
