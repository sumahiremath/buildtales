# Payments Collection System

This document explains the new dedicated collection system for the "How U.S. Payments Really Work" series.

## Overview

The payments series now uses a dedicated Jekyll collection instead of regular posts. This provides:

- **Cleaner URLs**: `/payments/part-01.html` instead of `/fintech/payments/2025/08/13/money-flow-bank-account.html`
- **Better organization**: All series content in one place
- **Automatic sorting**: Parts are sorted by `part` number
- **Draft support**: Use `draft: true` to hide unpublished parts
- **Self-updating**: The series landing page automatically shows published parts

## File Structure

```
_payments/
├── part-01.md          # Published: How Money Moves In And Out Of Your Bank Account?
├── part-02.md          # Published: Wire Transfers
├── part-03.md          # Published: ACH: The Good, The Bad, and The Ugly
├── part-04.md          # Draft: ACH Cutoffs (draft: true)
└── part-template.md    # Template for new parts (excluded from build)
```

## Front Matter Structure

Each part uses this front matter structure:

```yaml
---
title: "Part X — [Article Title]"
part: X
summary: "[Brief summary]"
layout: default
date: YYYY-MM-DD
draft: false  # Set to true for unpublished parts
tags: [relevant, tags]
excerpt: "[Article excerpt]"
banner_image: "/assets/banners/resized/[image].jpg"
banner_image_recent: "/assets/banners/resized/[image-recent].jpg"
banner_image_series: "/assets/banners/resized/[image-series].jpg"
banner_color: "#157878"

# SEO and social media metadata
canonical_url: "https://buildtales.dev/payments/part-X.html"
author:
  name: "Suma Manjunath"
  twitter: "@sumahiremath"

# Series information
series:
  name: "How U.S. Payments Really Work"
  total_parts: 45
  read_time: [minutes]
  tags: [series, tags]
---
```

## Key Features

### 1. Automatic Sorting

Parts are automatically sorted by the `part` number in the front matter:

```liquid
{%- assign published = site.payments | where_exp: "p", "p.draft != true" | sort: "part" -%}
```

### 2. Draft Support

Set `draft: true` to hide unpublished parts from the series landing page:

```yaml
draft: true  # This part won't appear in published lists
```

### 3. Clean URLs

The collection generates clean URLs:
- `/payments/part-01.html`
- `/payments/part-02.html`
- etc.

### 4. Self-Updating Series Page

The series landing page (`series/payments.md`) automatically:
- Shows only published parts (not drafts)
- Sorts by part number
- Links to the correct URLs
- Shows progress (3 of 45 articles)

## Adding New Parts

1. **Copy the template**: Copy `_payments/part-template.md`
2. **Update front matter**: Change title, part number, date, etc.
3. **Set draft status**: Use `draft: true` until ready to publish
4. **Add content**: Write the article content
5. **Publish**: Set `draft: false` when ready

## Configuration

The collection is configured in `_config.yml`:

```yaml
collections:
  payments:
    output: true
    permalink: /payments/:title.html
```

## Benefits Over Previous System

### Before (Regular Posts)
- Complex URLs with dates and categories
- Manual linking in series page
- Hard to manage part order
- No draft support
- Mixed with other blog content

### After (Dedicated Collection)
- Clean, predictable URLs
- Automatic sorting and linking
- Built-in draft support
- Isolated from other content
- Self-updating series page

## Migration Notes

The original posts in `_posts/` can be kept for SEO purposes or removed. The new collection provides a cleaner, more maintainable system for the series.

## Future Series

This pattern can be replicated for other series by:
1. Adding a new collection to `_config.yml`
2. Creating a `_seriesname/` directory
3. Using the same front matter structure
4. Creating a series landing page

Example for a leadership series:

```yaml
collections:
  payments:
    output: true
    permalink: /payments/:title.html
  leadership:
    output: true
    permalink: /leadership/:title.html
```
