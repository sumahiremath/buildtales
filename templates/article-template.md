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

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/fintech/[category]/[YYYY]/[MM]/[DD]/[slug].html"
author:
  name: "Suma Manjunath"
  twitter: "@buildtales"
  
# Open Graph / Social Media
og:
  title: "Your Article Title Here"
  description: "A compelling excerpt that describes what the article covers and why readers should care."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "Your Article Title Here"
  description: "A compelling excerpt that describes what the article covers and why readers should care."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"

# Series information
series:
  name: "Series Name"
  index_url: "/series/[series-slug]"
  part: [X]
---

# Your Article Title Here

<div class="personal-branding">
  <img src="/assets/images/ghibli-avatar.png" alt="Suma Manjunath" class="ghibli-avatar">
  <div class="author-info">
    <div class="author-name">Author: Suma Manjunath</div>
    <div class="publish-date">Published on: {{ page.date | date: "%B %d, %Y" }}</div>
    {% if page.last_modified_at %}
    <div class="update-date">Updated on: {{ page.last_modified_at | date: "%B %d, %Y" }}</div>
    {% endif %}
  </div>
</div>

<img src="/assets/banners/resized/[filename]-blog.jpg" alt="Article Banner" class="article-header-image">

## Introduction

Your article content starts here...

## Key Points

- Point 1
- Point 2
- Point 3

## Conclusion

Wrap up your article with actionable takeaways.

---

**Next in the series:** [Link to next article or series index]
