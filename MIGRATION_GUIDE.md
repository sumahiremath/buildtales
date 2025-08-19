# Migration Guide: Multi-Series Posts

This guide helps you migrate existing posts to the new multi-series format that supports:
- Posts belonging to multiple series
- Explicit part numbers per series
- Deterministic ordering
- GitHub Pages compatibility

## New Front Matter Format

### Before (Old Format)
```yaml
---
layout: default
title: "Your Post Title"
date: 2025-10-31
categories: [payments, ach]  # Multiple categories for series
series:
  name: "How U.S. Payments Really Work"
  part: 5
  total_parts: 13
---
```

### After (New Format)
```yaml
---
layout: default
title: "Your Post Title"
date: 2025-10-31
series: [payments, ach]      # Array of series slugs
series_parts:
  payments: 5                # Part number in payments series
  ach: 2                     # Part number in ach series
categories: [payments, ach]  # Keep for SEO/browsing
---
```

## Migration Steps

### 1. Update Front Matter
For each post, replace the old `series` object with:
- `series: [slug1, slug2, ...]` - Array of series slugs
- `series_parts: { slug1: number, slug2: number, ... }` - Part numbers per series

### 2. Remove Old Series Navigation
Remove this line from posts:
```liquid
{% include series-navigation-advanced.html %}
```

The new navigation is automatically included in the layout.

### 3. Update Series Pages
Series pages now use the new `series` layout and are much simpler:
```yaml
---
layout: series
title: "Series Title"
slug: series-slug
permalink: /series/series-slug/
tagline: "Brief description"
---
```

## Example Migrations

### Leadership Post
**Before:**
```yaml
series:
  name: "Build, Break, Lead: Engineering Leadership Journey"
  part: 5
  total_parts: 13
```

**After:**
```yaml
series: [leadership]
series_parts:
  leadership: 5
```

### Multi-Series Post
**Before:**
```yaml
categories: [payments, ach]
series:
  name: "How U.S. Payments Really Work"
  part: 3
```

**After:**
```yaml
series: [payments, ach]
series_parts:
  payments: 3
  ach: 1
categories: [payments, ach]  # Keep for SEO
```

## Benefits of New Format

1. **Multi-Series Support**: Posts can belong to multiple series
2. **Explicit Ordering**: Part numbers are explicit per series
3. **Deterministic**: No reliance on categories for ordering
4. **GitHub Pages Safe**: Uses only Liquid filters
5. **Flexible**: Easy to add/remove posts from series

## Series Slugs

Use these slugs for your series:
- `payments` - How U.S. Payments Really Work
- `ach` - ACH Deep Dives  
- `leadership` - Engineering Leadership & Systems Thinking

## Testing

After migration:
1. Check that series navigation appears correctly
2. Verify prev/next links work for each series
3. Confirm series landing pages show all posts
4. Test that posts appear in the correct order

## Need Help?

If you encounter issues during migration, check:
1. Series slugs match exactly (case-sensitive)
2. Part numbers are integers
3. Posts have the correct `series` array
4. Layout includes the new navigation
