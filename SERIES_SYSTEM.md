# Series Navigation System

This document explains how to use the new automatic series navigation system that replaces hardcoded series content.

## Overview

The new system automatically generates series navigation and content based on:
- **Category tags** in post front matter
- **Series metadata** in post front matter
- **Automatic post discovery** and sorting

## Benefits

1. **No more hardcoding** - Series content updates automatically
2. **Multiple series support** - Articles can belong to multiple series
3. **Easy maintenance** - Just update front matter, navigation updates automatically
4. **Consistent experience** - All series use the same navigation components
5. **SEO friendly** - Proper category structure for search engines

## How It Works

### 1. Post Front Matter Structure

Each post in a series needs this structure:

```yaml
---
layout: default
title: "Your Article Title"
date: YYYY-MM-DD
categories: [series-name]  # This identifies the series
tags: [tag1, tag2, tag3]
excerpt: "Brief description..."

# Series information - This enables automatic navigation
series:
  name: "Series Display Name"
  part: 1
  total_parts: 5
  read_time: 8
  tags: [confidence-building, team-building]
---
```

### 2. Series Page Structure

Series overview pages use the `series` layout:

```yaml
---
layout: series
title: "Series Name"
excerpt: "Series description"
categories: [series-name]
series:
  name: "Series Display Name"
  description: "Detailed series description"
  total_parts: 5
  benefits:
    - icon: "🎯"
      title: "Benefit 1"
      description: "Description of benefit 1"
    - icon: "💡"
      title: "Benefit 2"
      description: "Description of benefit 2"
---
```

### 3. Automatic Navigation

Include this in your posts to show series navigation:

```liquid
{% include series-navigation-advanced.html %}
```

## File Structure

```
_includes/
├── series-navigation.html          # Basic series navigation
└── series-navigation-advanced.html # Advanced navigation with auto-discovery

_layouts/
└── series.html                     # Series overview page layout

series/
├── engineering-leadership.md       # Series overview page
└── article-template.md             # Template for new articles
```

## Examples

### Engineering Leadership Series

**Series Page**: `series/engineering-leadership.md`
- Uses `layout: series`
- Automatically finds all posts with `categories: [engineering-leadership]`
- Shows progress, available articles, and coming soon placeholders

**Post**: `_posts/lead1.md`
- Has `categories: [engineering-leadership]`
- Includes `{% include series-navigation-advanced.html %}`
- Automatically shows navigation to other parts

### Multiple Series Support

An article can belong to multiple series:

```yaml
categories: [engineering-leadership, technical-skills]
series:
  name: "Engineering Leadership: From IC to VP"
  part: 1
  total_parts: 13
  read_time: 8
  tags: [confidence-building, team-building]
```

## Creating New Series

### Step 1: Create Series Overview Page

Create `series/your-series-name.md`:

```yaml
---
layout: series
title: "Your Series Name"
excerpt: "Series description"
categories: [your-series-name]
series:
  name: "Your Series Display Name"
  description: "Detailed description of what the series covers"
  total_parts: 10
  benefits:
    - icon: "🎯"
      title: "Benefit 1"
      description: "What readers will gain"
---
```

### Step 2: Create Series Articles

Create posts with the series category:

```yaml
---
layout: default
title: "Article Title"
categories: [your-series-name]
series:
  name: "Your Series Display Name"
  part: 1
  total_parts: 10
  read_time: 8
  tags: [tag1, tag2]
---
```

### Step 3: Add Navigation

Include this in each article:

```liquid
{% include series-navigation-advanced.html %}
```

## Navigation Features

### Automatic Discovery
- Finds all posts in the same series using categories
- Sorts by `series.part` number
- Shows progress automatically

### Navigation Links
- Previous/Next article links
- Series overview link
- Progress indicator
- Part numbers for quick navigation

### Responsive Design
- Mobile-friendly navigation
- Hover effects and transitions
- Consistent styling across all series

## Customization

### Styling
All styles are inline in the includes for easy customization. Key classes:
- `.series-navigation-advanced` - Main container
- `.series-link` - Navigation links
- `.series-part-link` - Part number links

### Benefits Section
Customize the benefits shown on series pages by adding to front matter:

```yaml
series:
  benefits:
    - icon: "🎯"
      title: "Custom Benefit"
      description: "Custom description"
```

### Tags and Metadata
Add custom metadata to posts:

```yaml
series:
  read_time: 15
  difficulty: "Intermediate"
  prerequisites: ["Basic knowledge of X"]
```

## Migration from Old System

### Old Format
```yaml
series:
  name: "Series Name"
  index_url: "/series/series-name/"
  part: 1
  total_parts: 5
```

### New Format
```yaml
categories: [series-name]
series:
  name: "Series Name"
  part: 1
  total_parts: 5
```

### Steps
1. Update post categories to include series name
2. Remove `index_url` from series metadata
3. Replace hardcoded navigation with `{% include series-navigation-advanced.html %}`
4. Update series overview pages to use `layout: series`

## Troubleshooting

### Navigation Not Showing
- Check that `categories` includes the series name
- Verify `series` metadata is present
- Ensure the include file path is correct

### Posts Not Appearing in Series
- Confirm `categories` matches between posts and series page
- Check that posts have `series` metadata
- Verify post files are in `_posts/` directory

### Layout Issues
- Check that `layout: series` is set on series overview pages
- Verify all required front matter fields are present
- Check for syntax errors in YAML front matter

## Best Practices

1. **Consistent Naming**: Use kebab-case for category names
2. **Part Numbers**: Start from 1 and increment sequentially
3. **Metadata**: Include `read_time` and `tags` for better UX
4. **Descriptions**: Write compelling series descriptions
5. **Benefits**: Customize benefits for each series
6. **Testing**: Test navigation after adding new posts

## Future Enhancements

Potential improvements to consider:
- Series completion tracking
- Reading time estimates
- Difficulty levels
- Prerequisites
- Related series suggestions
- Progress saving for users
