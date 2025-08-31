---
layout: default
title: "Why Credit Card Interchange Fees Differ at Authorization vs Settlement (and How to Reconcile Them)"
date: 2025-09-01
categories: [payments]
section: "Phase 1: Understanding the Rails"
tags: [interchange, variance, reconciliation, payment-systems, credit-cards, compliance, fintech]
excerpt: "Understanding why credit card interchange fees change between authorization and settlement is crucial for payment system design. This article explores the reconciliation challenges and provides practical solutions for tracking fee variances."
banner_image: "/assets/banners/resized/20250901cardauth-blog.jpg"
banner_image_series: "/assets/banners/resized/20250901cardauth-series.jpg"
banner_color: "#059669"

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/fintech/payments/2025/09/01/failure-modes-interchange-fee-reconciliation.html"
author:
  name: "Suma Manjunath"
  twitter: "@buildtales"
  
# Open Graph / Social Media
og:
  title: "Why Credit Card Interchange Fees Differ at Authorization vs Settlement (and How to Reconcile Them)"
  description: "Understanding why credit card interchange fees change between authorization and settlement is crucial for payment system design. This article explores the reconciliation challenges and provides practical solutions for tracking fee variances."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "Why Credit Card Interchange Fees Differ at Authorization vs Settlement (and How to Reconcile Them)"
  description: "Understanding why credit card interchange fees change between authorization and settlement is crucial for payment system design. This article explores the reconciliation challenges and provides practical solutions for tracking fee variances."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"

# Series information
series:
  name: "How U.S. Payments Really Work"
  index_url: "/series/payments"
  part: 10
  series_type: "payments"

# Content classification
payment_type: "card_payments"
payment_network: ["visa", "mastercard", "amex", "discover"]
content_level: "advanced"
content_type: "case_study"
---
# Why Credit Card Interchange Fees Differ at Authorization vs Settlement (and How to Reconcile Them)
*Understanding why credit card interchange fees change between authorization and settlement is crucial for payment system design. This article explores the reconciliation challenges and provides practical solutions for tracking fee variances.*

<div class="personal-branding">
  <img src="/assets/images/ghibli-avatar.jpg" alt="Suma Manjunath" class="ghibli-avatar">
  <div class="author-info">
    <div class="author-name">Author: Suma Manjunath</div>
    <div class="publish-date">Published on: {{ page.date | date: "%B %d, %Y" }}</div>
    {% if page.last_modified_at %}
    <div class="update-date">Updated on: {{ page.last_modified_at | date: "%B %d, %Y" }}</div>
    {% endif %}
  </div>
</div>  

<img src="/assets/banners/resized/20250901cardauth-blog.jpg" alt="Why Credit Card Interchange Fees Differ at Authorization vs Settlement (and How to Reconcile Them)" class="article-header-image">

Interchange at auth is just an estimate. Final fees are set at settlement, where missing data, timing, and classification issues can "downgrade" a transaction. If you treat auth as final, you'll end up with reconciliation noise, misstated margins, and ops pain.

> **Note:** This post focuses on U.S. credit card interchange (Visa, Mastercard, AmEx). Other regions/methods differ.

## The Misconception

Many systems assume authorization = final economics. In reality:

- **Auth (T0):** Approval + provisional fee category.
- **Settlement (T+1…T+3):** Networks calculate final fee with all data.

```mermaid
sequenceDiagram
    Shopper->>Merchant: Card swipe / online checkout
    Merchant->>PSP: Auth request
    PSP->>Network: Forward auth
    Network->>Issuer: Risk check
    Issuer-->>Network: Approve
    Network-->>PSP: Response (no final fees)
    PSP-->>Merchant: Approved

    rect rgba(200,200,200,0.15)
    Merchant->>PSP: Clearing file
    PSP->>Network: Full data
    Network->>Issuer: Funds + fee
    Issuer-->>Network: Final interchange
    Network-->>PSP: Settlement details
    PSP-->>Merchant: Payouts + fees
    end
```

## Why Auth ≠ Settlement

Common reasons the final interchange differs from your auth-time estimate:

* **Data Downgrades**: Missing or incorrect fields (AVS, CVV match, postal code, tax indicators, Level II/III data) force a higher fee bracket.
* **Timing Downgrades**: Late clearing (e.g., >24 hours after auth) or partial captures.
* **Reclassification**: MCC, recurring flag, small-ticket vs. standard, card-not-present vs. present, cross-border.
* **Amount/Metadata Mismatch**: Tipping, amended amounts, currency conversions.

* **Rule Changes**: Scheme updates or regional programs applied at clearing.


```mermaid
graph TD
  A[Auth Estimate] -->|Mismatch Sources| B[Final Fee at Settlement]
  B --> D[Variance]

  A1["Data Downgrade
(missing AVS, CVV, Level II/III)"]
  A2["Timing Downgrade
(late clearing >24h)"]
  A3["Reclassification
(MCC, recurring, small-ticket)"]
  A4["Amount/Metadata Mismatch
(tips, amended amounts)"]
  A5["Network Rule Updates"]

  A1 --> B
  A2 --> B
  A3 --> B
  A4 --> B
  A5 --> B
```

## Failure Mode in Reconciliation

```mermaid
flowchart LR
  Auth[Auth Fee Estimate] -->|booked| Ledger
  Settlement[Final Fee] --> Ledger
  Ledger -->|Mismatch| Variance[Variance Account]
```

**Impact:**
- Finance books don't tie.
- Ops spends hours chasing deltas.
- Margins misreported by product/region.

## Real-World Impact

On a $100 txn:
- Estimated = $1.75
- Final = $2.00 (due to MISSING_AVS)
- Variance = +$0.25 (Unfavorable)

Across 100,000 transactions/month, this becomes $25,000 in unexpected cost. For thin-margin businesses, that's material.

## Rails Implementation

**Code context:** These examples assume a Rails monolith handling payments through a PSP (Payment Service Provider). Interchange estimation/finalization lives in a domain service layer, while settlement ingestion runs in background jobs (e.g., Sidekiq). Variance data is persisted to support both finance reporting and engineering feedback loops.

### Data Model (simplified)

```ruby
create_table :payments do |t|
  t.string  :psp_txn_id, null: false
  t.string  :card_brand, :mcc, :entry_mode, :recurring_flag, :currency
  t.bigint  :amount_minor, null: false
  t.datetime :authorized_at, :captured_at, :settled_at
end

create_table :interchange_estimates do |t|
  t.references :payment
  t.decimal :rate_bps
  t.decimal :per_txn_fee_minor
end

create_table :interchange_finalizations do |t|
  t.references :payment
  t.decimal :final_rate_bps, :final_per_txn_fee_minor, :final_amount_minor
  t.jsonb :downgrade_reasons, default: []
end

create_table :interchange_variances do |t|
  t.references :payment
  t.decimal :estimated_fee_minor, :final_fee_minor, :variance_minor
end
```

### Estimate at Auth

```ruby
module Interchange
  class Estimator
    def estimate(payment:)
      bucket = [payment.card_brand, payment.entry_mode, payment.recurring_flag, payment.mcc].join(":")
      rule   = @rate_table.fetch(bucket)
      pct    = ((payment.amount_minor * rule[:bps]) / 10_000.0).round
      total  = pct + rule[:per_txn_fee_minor]

      InterchangeEstimate.create!(payment:, rate_bps: rule[:bps], per_txn_fee_minor: rule[:per_txn_fee_minor])
      total
    end
  end
end
```

### Finalize at Settlement

```ruby
module Interchange
  class Finalizer
    def apply!(payment:, row:)
      final_fee = ((row.settlement_amount_minor * row.final_rate_bps) / 10_000.0).round + row.final_per_txn_fee_minor
      estimated = payment.interchange_estimates.last

      InterchangeFinalization.create!(payment:, final_rate_bps: row.final_rate_bps, downgrade_reasons: row.downgrade_reasons)
      InterchangeVariance.create!(payment:, estimated_fee_minor: estimated_total(estimated), final_fee_minor: final_fee, variance_minor: final_fee - estimated_total(estimated))
    end

    def estimated_total(est) = ((est.payment.amount_minor * est.rate_bps) / 10_000.0).round + est.per_txn_fee_minor
  end
end
```

## Ops Playbook

```mermaid
flowchart TD
  Capture[Capture Txn] --> Estimate[Estimate Interchange]
  Estimate --> Accrual[Book Provisional Expense]
  Settlement[Settlement File] --> Finalize[Finalize Fees]
  Finalize --> Variance[Record Variance + Reasons]
  Variance --> Reporting[Ops/Finance Dashboards]
  Reporting --> Fixes[Engineering Fixes]
```

- At capture: Book provisional accrual.
- At settlement: Adjust with final fee.
- Track reasons: AVS missing, late clearing, etc.
- Alert: Spikes in unfavorable variance.
- Feedback loop: Downgrades → engineering fixes.

Common downgrade reasons map to specific engineering solutions:

## Engineering Fixes for Downgrades

- **MISSING_AVS** → enforce ZIP/address collection at checkout.
- **LATE_CLEARING** → ensure capture jobs run within 24h; add monitoring for delays.
- **MISSING_CVV** → require CVV field; reject requests missing it.
- **RECURRING MISFLAGGED** → fix subscription billing flags in PSP integration.

## Example

On $100 txn:
- Estimated at auth: 1.65% + $0.10 = $1.75
- Final at settlement (downgraded): 1.90% + $0.10 = $2.00
- Variance: +$0.25 (Unfavorable)

## Takeaway

Interchange at auth is only a hint. Build systems to:

```mermaid
flowchart LR
  Estimate --> Finalize --> Explain
```

That loop is what turns messy variance into actionable cost reduction.

## Glossary

- **AVS:** Address Verification Service.
- **CNP/CP:** Card Not Present / Card Present.
- **MCC:** Merchant Category Code (e.g., 5732 = electronics stores).
- **PSP:** Payment Service Provider (processor/gateway).
- **Issuer:** Bank that issued the card.
- **Acquirer:** Bank that processes payments for the merchant.
- **Downgrade:** When a transaction falls into a higher-cost interchange bucket.
- **BPS:** Basis points. 100 bps = 1.00%.

## References

- [Visa USA Interchange Reimbursement Fees (PDF)](https://usa.visa.com/support/small-business/merchant-resources/rates.html)
- [Mastercard US Interchange Rates (PDF)](https://www.mastercard.us/en-us/business/issuers/rates.html)
- [AmEx Merchant Pricing Overview](https://network.americanexpress.com/globalnetwork/business/en_US/merchant-pricing)
- [Nacha Rules (ACH comparison)](https://www.nacha.org/rules)


