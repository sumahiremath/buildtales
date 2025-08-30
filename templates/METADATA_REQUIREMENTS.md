# Article Metadata Requirements

All articles published on BuildTales.dev must include the complete metadata structure outlined below. This ensures proper SEO, social media sharing, and series navigation.

## Required Metadata Structure

### Basic Front Matter
```yaml
---
layout: default
title: "Your Article Title Here"
date: YYYY-MM-DD
categories: [category1, category2]
section: "Section Name"
tags: [tag1, tag2, tag3]
excerpt: "A compelling excerpt that describes what the article covers and why readers should care."
banner_image: "/assets/banners/resized/[filename]-blog.jpg"

banner_image_series: "/assets/banners/resized/[filename]-series.jpg"
banner_color: "#157878"
```

### SEO and Canonical Tags
```yaml
# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/fintech/[category]/[YYYY]/[MM]/[DD]/[slug].html"
author:
  name: "Suma Manjunath"
  twitter: "@buildtales"
```

### Open Graph / Social Media
```yaml
# Open Graph / Social Media
og:
  title: "Your Article Title Here"
  description: "A compelling excerpt that describes what the article covers and why readers should care."
  type: "article"
```

### Twitter Card
```yaml
# Twitter Card
twitter:
  card: "summary"
  title: "Your Article Title Here"
  description: "A compelling excerpt that describes what the article covers and why readers should care."
```

### Syndication and Original Content Declaration
```yaml
# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"
```

### Series Information
```yaml
# Series information
series:
  name: "Series Name"
  index_url: "/series/[series-slug]"
  part: [X]
```

## Category-Specific Series Information

### Payments Articles
- **Series Name**: "How U.S. Payments Really Work"
- **Index URL**: "/series/payments"

### Systems Articles
- **Series Name**: "System Design Fundamentals" or "Leveraging AI Tools for Engineering Teams"
- **Index URL**: "/series/systems"

### Leadership Articles
- **Series Name**: "Engineering Leadership in Regulated Environments"
- **Index URL**: "/series/leadership"

## URL Structure Guidelines

### Canonical URLs
Follow this pattern: `https://buildtales.dev/fintech/[category]/[YYYY]/[MM]/[DD]/[slug].html`

Examples:
- Payments: `https://buildtales.dev/fintech/payments/2025/08/20/ach-good-bad-ugly.html`
- Systems: `https://buildtales.dev/fintech/systems/2025/08/25/bulkheading-daemons-jobs-rails.html`
- Leadership: `https://buildtales.dev/fintech/leadership/2025/08/21/engineering-leaders-survival-guide-compliance.html`

## Banner Image Requirements

### Naming Convention
- **Blog**: `[filename]-blog.jpg`
- **Recent**: `[filename]-recent.jpg`
- **Series**: `[filename]-series.jpg`

### File Location
All banner images must be placed in `/assets/banners/resized/`

### Color Scheme
- **Primary**: #157878 (teal)
- **Payments**: #059669 (green)
- **Systems**: #157878 (teal)
- **Leadership**: #157878 (teal)
- **Special**: Use appropriate colors (e.g., #dc2626 for FedNow, #7c3aed for ACH cutoffs)

## Quality Checklist

Before publishing, ensure your article has:

- [ ] Complete front matter with all required fields
- [ ] Proper canonical URL following the established pattern
- [ ] Author information with name and Twitter handle
- [ ] Open Graph tags for social media sharing
- [ ] Twitter Card metadata
- [ ] Syndication and robots directives
- [ ] Series information with correct part numbers
- [ ] Banner images in all three required sizes
- [ ] Appropriate banner color for the category

## Template Usage

Use the updated `series/article-template.md` as your starting point for all new articles. This template includes the complete metadata structure and can be customized for your specific article.

## Common Mistakes to Avoid

1. **Missing Series Information**: Every article should be part of a series
2. **Incorrect Part Numbers**: Ensure sequential numbering within each series
3. **Missing Twitter Cards**: Essential for social media sharing
4. **Incomplete Open Graph Tags**: Required for proper social media previews
5. **Wrong Canonical URLs**: Follow the established URL structure exactly

## Maintenance

This metadata structure should be maintained for all future articles. Any changes to the metadata requirements should be documented here and applied consistently across the site.
