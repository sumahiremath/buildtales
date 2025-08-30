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
tags: [tag1, tag2, tag3]
excerpt: "A compelling excerpt that describes what the article covers and why readers should care."
banner_image: "/assets/banners/resized/[filename]-blog.jpg"
banner_image_series: "/assets/banners/resized/[filename]-series.jpg"
banner_color: "#157878"
```

### Series Information
```yaml
# Series information
series:
  name: "Series Name"
  index_url: "/series/[series-slug]"
  part: [X]
  series_type: "payments" | "leadership" | "systems"
```

### Content Classification (Series-Specific)
```yaml
# For Payments Series
payment_type: "ach_transfers" | "wire_transfers" | "card_payments" | "crypto" | "wallets" | "mobile_payments" | "p2p_networks"
payment_network: ["federal_reserve", "epn", "fedwire", "chips", "swift", "rtp", "fednow", "apple_pay", "google_pay", "venmo", "cash_app", "paypal", "zelle"]

# For Leadership Series
leadership_level: "first_time_lead" | "experienced_lead" | "director" | "vp"
leadership_focus: "team_building" | "technical_decision_making" | "compliance" | "incident_response"
team_size: "small_team" | "growing_team" | "large_organization"

# For Systems Series
system_scale: "startup" | "mid_size" | "enterprise"
system_type: "payment_system" | "general_architecture" | "monitoring" | "compliance"
technology_stack: "rails" | "general" | "fintech_specific"
```

### Universal Content Classification
```yaml
# Content classification (all articles)
content_level: "fundamentals" | "intermediate" | "advanced" | "compliance" | "operations"
content_type: "how_to" | "case_study" | "compliance_guide" | "architecture" | "incident_analysis"
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

## Category-Specific Series Information

### Payments Series
- **Series Name**: "How U.S. Payments Really Work"
- **Index URL**: "/series/payments"
- **Required Fields**: `payment_type`, `payment_network`
- **Payment Type Examples**:
  - `ach_transfers` - ACH payments, payroll, bill payments
  - `wire_transfers` - Real-time wire transfers, Fedwire, CHIPS
  - `card_payments` - Credit/debit card processing, interchange
  - `crypto` - Cryptocurrency, stablecoins, DeFi
  - `wallets` - Digital wallets, mobile payment apps
  - `mobile_payments` - Apple Pay, Google Pay, Samsung Pay
  - `p2p_networks` - Venmo, Cash App, PayPal, Zelle

- **Payment Network Examples**:
  - Traditional: `federal_reserve`, `epn`, `fedwire`, `chips`, `swift`
  - Real-time: `rtp`, `fednow`
  - Mobile: `apple_pay`, `google_pay`
  - P2P: `venmo`, `cash_app`, `paypal`, `zelle`

- **Example**:
```yaml
series:
  name: "How U.S. Payments Really Work"
  index_url: "/series/payments"
  part: 1
  series_type: "payments"

payment_type: "mobile_payments"
payment_network: ["apple_pay", "google_pay"]
```

### Leadership Series
- **Series Name**: "Engineering Leadership Survival Guide"
- **Index URL**: "/series/leadership"
- **Required Fields**: `leadership_level`, `leadership_focus`
- **Example**:
```yaml
series:
  name: "Engineering Leadership Survival Guide"
  index_url: "/series/leadership"
  part: 1
  series_type: "leadership"

leadership_level: "first_time_lead"
leadership_focus: "team_building"
team_size: "growing_team"
```

### Systems Series
- **Series Name**: "Systems & Architecture Patterns"
- **Index URL**: "/series/systems"
- **Required Fields**: `system_scale`, `system_type`
- **Example**:
```yaml
series:
  name: "Systems & Architecture Patterns"
  index_url: "/series/systems"
  part: 1
  series_type: "systems"

system_scale: "startup"
system_type: "payment_system"
technology_stack: "rails"
```

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

## Complete Metadata Examples

### Payments Article Examples

#### ACH Transfers Example
```yaml
payment_type: "ach_transfers"
payment_network: ["federal_reserve", "epn"]
```

#### Mobile Payments Example
```yaml
payment_type: "mobile_payments"
payment_network: ["apple_pay", "google_pay"]
```

#### P2P Networks Example
```yaml
payment_type: "p2p_networks"
payment_network: ["venmo", "cash_app", "zelle"]
```

#### Crypto Example
```yaml
payment_type: "crypto"
payment_network: ["ethereum", "polygon", "arbitrum"]
```

#### Complete Payments Article Example
```yaml
---
layout: default
title: "How Money Moves In and Out of Your Bank Account?"
date: 2025-08-13
categories: [payments, ach, fundamentals]
tags: [ach, payments, banking, fintech_basics, compliance]
excerpt: "Ever wonder how your paycheck shows up in your bank account on payday? Or how your gym magically pulls your membership fee every month? That's all thanks to ACH - the behind-the-scenes hero of American banking."
banner_image: "/assets/banners/resized/20250813moneyflow-blog.jpg"
banner_image_series: "/assets/banners/resized/20250813moneyflow-series.jpg"
banner_color: "#157878"

# Series information
series:
  name: "How U.S. Payments Really Work"
  index_url: "/series/payments"
  part: 1
  series_type: "payments"

# Content classification
payment_type: "ach_transfers"
payment_network: ["federal_reserve", "epn"]
content_level: "fundamentals"
content_type: "how_to"

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/fintech/payments/2025/08/13/money-flow-bank-account.html"
author:
  name: "Suma Manjunath"
  twitter: "@buildtales"
  
# Open Graph / Social Media
og:
  title: "How Money Moves In and Out of Your Bank Account?"
  description: "Deep dive into ACH payments - the $72 trillion network that powers payroll deposits and bill payments. Includes code samples and system architecture."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "How Money Moves In and Out of Your Bank Account?"
  description: "Deep dive into ACH payments - the $72 trillion network that powers payroll deposits and bill payments. Includes code samples and system architecture."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"
---
```

## Quality Checklist

Before publishing, ensure your article has:

### Core Requirements
- [ ] Complete front matter with all required fields
- [ ] Proper canonical URL following the established pattern
- [ ] Author information with name and Twitter handle
- [ ] Open Graph tags for social media sharing
- [ ] Twitter Card metadata
- [ ] Syndication and robots directives
- [ ] Series information with correct part numbers and series_type
- [ ] Banner images in all required sizes
- [ ] Appropriate banner color for the category

### Series-Specific Requirements
- [ ] **Payments**: `payment_type` and `payment_network` fields populated
- [ ] **Leadership**: `leadership_level` and `leadership_focus` fields populated
- [ ] **Systems**: `system_scale` and `system_type` fields populated
- [ ] **All Series**: `content_level` and `content_type` fields populated

## Template Usage

Use the updated `series/article-template.md` as your starting point for all new articles. This template includes the complete metadata structure and can be customized for your specific article.

## Payment Type Classification Guide

### When to Use Each Payment Type

- **`ach_transfers`**: Articles about ACH fundamentals, payroll, bill payments, SEC codes, returns, corrections
- **`wire_transfers`**: Articles about Fedwire, CHIPS, SWIFT, real-time money movement, international transfers
- **`card_payments`**: Articles about credit/debit processing, interchange fees, 3D Secure, card networks
- **`crypto`**: Articles about cryptocurrency, stablecoins, DeFi infrastructure, on/off ramps
- **`wallets`**: Articles about digital wallet technology, mobile payment apps, wallet infrastructure
- **`mobile_payments`**: Articles specifically about Apple Pay, Google Pay, Samsung Pay, mobile payment technology
- **`p2p_networks`**: Articles about Venmo, Cash App, PayPal, Zelle, peer-to-peer payment networks

### When to Use Each Payment Network

- **Traditional**: `federal_reserve`, `epn` for ACH; `fedwire`, `chips` for wires
- **Real-time**: `rtp`, `fednow` for instant payments
- **Mobile**: `apple_pay`, `google_pay` for mobile payment systems
- **P2P**: `venmo`, `cash_app`, `paypal`, `zelle` for peer-to-peer networks
- **Crypto**: `ethereum`, `polygon`, `arbitrum` for blockchain networks

## Common Mistakes to Avoid

1. **Missing Series Information**: Every article should be part of a series with `series_type` specified
2. **Incorrect Part Numbers**: Ensure sequential numbering within each series
3. **Missing Series-Specific Fields**: Payments articles need `payment_type` and `payment_network`, Leadership articles need `leadership_level` and `leadership_focus`, Systems articles need `system_scale` and `system_type`
4. **Missing Twitter Cards**: Essential for social media sharing
5. **Incomplete Open Graph Tags**: Required for proper social media previews
6. **Wrong Canonical URLs**: Follow the established URL structure exactly
7. **Inconsistent Field Naming**: Use snake_case for all custom fields (e.g., `payment_type`, not `payment-type`)
8. **Missing Content Classification**: All articles must have `content_level` and `content_type` fields
9. **Incorrect Payment Classification**: Don't use `mobile_payments` for P2P networks, or `wallets` for specific mobile payment systems

## Maintenance

This metadata structure should be maintained for all future articles. Any changes to the metadata requirements should be documented here and applied consistently across the site.
