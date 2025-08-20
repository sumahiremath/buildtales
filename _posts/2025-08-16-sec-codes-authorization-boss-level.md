---
layout: default
title: "SEC Codes in ACH: Authorization, Compliance, and How to Not Get Burned"
date: 2025-08-16
categories: [fintech, ach]
section: "ACH Operations & Compliance"
tags: [ach, sec-codes, compliance, authorization, nacha]
excerpt: "SEC codes determine your compliance fate in ACH payments. Get them wrong and face chargebacks, fines, and regulatory headaches. This guide shows you how to classify transactions correctly and stay compliant."
banner_image: "/assets/banners/resized/20250816seccode-blog.jpg"
banner_image_recent: "/assets/banners/resized/20250816seccode-recent.jpg"
banner_image_series: "/assets/banners/resized/20250816seccode-series.jpg"
banner_color: "#157878"

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/fintech/payments/2025/08/16/sec-codes-authorization-compliance.html"
author:
  name: "Suma Manjunath"
  twitter: "@sumahiremath"
  
# Open Graph / Social Media
og:
  title: "SEC Codes in ACH: Authorization, Compliance, and How to Not Get Burned"
  description: "Master SEC codes (PPD, CCD, WEB, TEL) to avoid compliance disasters. Real stories, practical code examples, and a complete implementation checklist."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "SEC Codes in ACH: Authorization, Compliance, and How to Not Get Burned"
  description: "Master SEC codes (PPD, CCD, WEB, TEL) to avoid compliance disasters. Real stories, practical code examples, and a complete implementation checklist."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"
---

# SEC Codes in ACH: Authorization, Compliance, and How to Not Get Burned 

*Published on: August 16, 2025*

![image info](/assets/banners/resized/20250816seccode-blog.jpg)

We once misclassified a whole batch of ACH payments — and our bank noticed immediately. Within days, we had a compliance warning sitting in our inbox and a very clear message: *fix your SEC codes, or else.*  

That's when we realized SEC codes aren't just three-letter labels. **They're legal shorthand for how authorization was obtained** — telling every bank in the chain *who's paying whom* and *what rules apply for disputes.*  

Get them right, and your payments flow smoothly. Get them wrong, and you invite disputes, audits, and compliance headaches.

**This guide breaks down what SEC codes are, how to classify ACH payments correctly, and how to stay compliant with Nacha and Reg E.**

---

## What SEC Codes Actually Do  

Every ACH batch header carries a three-letter SEC code. Example from a payroll file:  

```
5220TECH STARTUP    1234567890PPDPAYROLL    250816   1091000019000001
```

That `PPD` isn't decorative. It signals: "This is a consumer payment with signed authorization." If you change that to `CCD` for payroll, you've just violated Nacha rules by pretending employees are businesses.

**SEC = Standard Entry Class.** It encodes two things:

- **Transaction classification** → consumer vs. business, paper vs. digital
- **Authorization methodology** → written, online, telephone, implied

Think of it as a contract: how you got the "yes."

**The cost of getting it wrong?** Misclassify a consumer payment as business (using CCD instead of PPD), and you've just eliminated Regulation E protections. When that customer disputes the transaction, you have no legal defense — and you'll eat the full chargeback, plus potential fines for violating consumer protection laws.

## The Core SEC Codes You'll Actually Use

| SEC Code | When to Use | Authorization Method | Dispute Risk | Example |
|----------|-------------|---------------------|--------------|---------|
| **PPD** (Prearranged Payment & Deposit) | Recurring or single consumer payments | Signed authorization (paper/digital) | High (60-day Reg E) | Payroll, gym memberships |
| **CCD** (Cash Concentration or Disbursement) | B2B payments | Corporate agreement | Low | Vendor settlement |
| **WEB** (Internet-Initiated Entry) | Consumer payments authorized online | Online form + Nacha account validation | High fraud risk, 60-day window | Subscriptions, e-commerce |
| **TEL** (Telephone-Initiated Entry) | Consumer authorization by phone | Recorded authorization OR written confirmation to customer | High | Call center bill pay |
| **ARC** (Accounts Receivable Conversion) | Mailed-in check converted to ACH | Implied via check submission | Moderate | Insurance premiums |
| **POP** (Point-of-Purchase Conversion) | Paper check converted at POS | Implied via in-person handoff | Moderate | Legacy retail checkout |

> **Key Rule**: Consumer-facing codes = Reg E protections, 60-day dispute window. Business-facing codes = contract-only protection, minimal dispute rights.

## Advanced SEC Codes for Business

Big corporations live in enhanced codes that support remittance detail:

| SEC Code | Purpose | When to Use |
|----------|---------|-------------|
| **CCD+** | Business payments with addenda | Vendor invoices needing line-item notes |
| **PPD+** | Consumer payments with addenda | Government benefits with detailed breakdowns |
| **CTX** | Corporate Trade Exchange, full EDI integration | Enterprise treasury, supply chain payments |

## The Cost of Addenda (CCD+ vs. CTX)

In one of the ACH audits, the Nacha auditor flagged the use of CCD+ instead of CTX for vendor payments. Why aren't we using CTX, I explained that we only needed one line of extra information and CCD+ was cost effective.

**Bank fee math** (example - fees vary by institution):
- Base ACH: $0.05
- Addenda record: $0.02
- CTX premium: $0.08 + $500/month setup

**Volume**: 25,000 payments/month

- **CCD+ cost**: $1,750/month
- **CTX cost**: $3,750/month
- **Annual savings**: $24,000

> **Lesson**: CTX is only worth it if you need structured EDI remittance data. For single-line invoices, CCD+ is the right tool. Compliance isn't about gold-plating — it's about defensible, efficient decisions.

## What Happens When You Screw It Up

**Fintech story**: Our misclassification issue wasn't unique. We processed a small business bill pay as WEB. When "Johnson Construction LLC" sent a payment, the ACH operator flagged it: business name + consumer code = violation.

The ACH operator issued a formal warning to our sponsor bank about incorrect SEC code usage patterns. The bank immediately escalated to us with an ultimatum: "Fix SEC logic in 72 hours or risk processing restrictions."

Their fix: auto-detect business entities and assign CCD. Example:

```ruby
def determine_sec_code(account_holder_name, transaction_type, account_type = nil)
  business_indicators = ['LLC','INC','CORP','LTD','CO','COMPANY','LP','LLP']
  is_business = business_indicators.any? { |i| account_holder_name.upcase.include?(i) }
  
  # Note: This is a simplified approach. In practice, you may need:
  # - Manual review for edge cases (sole proprietorships, DBAs, trusts)
  # - Account type verification (business vs consumer account)
  # - Customer self-identification during onboarding
  
  if is_business || account_type == 'business'
    'CCD'
  else
    case transaction_type
    when 'web_authorization' then 'WEB'
    when 'recurring_payment' then 'PPD'
    when 'phone_authorization' then 'TEL'
    when 'check_conversion' then 'ARC'
    else
      raise "Unsupported transaction type: #{transaction_type}"
    end
  end
end
```

> **Takeaway**: Banks run automated pattern checks. Misuse isn't hypothetical — it's detected, flagged, and escalated fast.

## 🧾 What You Must Prove — or Lose the Dispute

**Consumer transactions** (PPD, WEB, TEL, ARC, POP):
- Must follow Regulation E
- Customers can dispute "unauthorized" debits up to 60 days
- You need audit-proof authorization records
- Burden of proof is on you, the merchant

**Business transactions** (CCD, CCD+, CTX):
- Governed by commercial agreements
- Very limited dispute rights
- Much lower return rates
- Businesses can't casually reverse like consumers

**Retention rules that matter**:
- Keep authorization evidence for **2 years minimum**
- Produce within **10 business days** of a dispute request
- Can't produce evidence = you eat the full loss

## Implementation Scenarios

- **Online subscriptions** → WEB with account validation before first debit.
- **Payroll** → PPD credit with employee-signed authorization.
- **Vendor settlement** → CCD with commercial agreement.
- **Call center bill pay** → TEL with recorded authorization OR written confirmation to customer.

## Example: WEB Authorization Flow

Here's what proper WEB authorization looks like in code:

```ruby
# Example WEB authorization capture
class WebACHAuthorization
  def capture_authorization(customer_params)
    verify_customer_identity(customer_params)
    present_nacha_disclosures
    
    authorization = build_authorization_record(customer_params)
    validate_account_before_first_debit(authorization)
    store_authorization_record(authorization)
  end
  
  private
  
  def build_authorization_record(customer_params)
    {
      customer_id: customer_params[:id],
      account_number: mask_account(customer_params[:account]),
      routing_number: customer_params[:routing],
      amount: customer_params[:amount],
      consent_timestamp: Time.current,
      ip_address: request.remote_ip,
      user_agent: request.user_agent,
      sec_code: 'WEB',
      nacha_disclosure_shown: true,
      customer_consent: customer_params[:i_agree] == 'true'
    }
  end
  
  def validate_account_before_first_debit(auth)
    # Microdeposits, Plaid, or similar verification required
    AccountValidationService.verify(
      routing: auth[:routing_number],
      account: auth[:account_number]
    )
  end
  
  def store_authorization_record(authorization)
    # Store for 2+ years per Nacha requirements with encryption
    AuthorizationRecord.create!(authorization)
  end
end
```

## SEC Code Compliance Checklist

**✅ Pre-Implementation**
- [ ] Map all payment flows to appropriate SEC codes
- [ ] Implement business entity detection logic
- [ ] Design authorization capture workflows
- [ ] Set up 2-year retention system for authorization records
- [ ] Include encryption and access logging for stored authorization records

**✅ Operational Requirements**
- [ ] Automate SEC code assignment (eliminate manual selection)
- [ ] Validate accounts before first WEB debit
- [ ] Maintain call recordings for TEL transactions OR send written confirmations to customers
- [ ] Store IP addresses and timestamps for online authorizations

**✅ Ongoing Compliance**
- [ ] Monitor transaction patterns for SEC code violations
- [ ] Monitor SEC code mix monthly and flag unexpected ratios (e.g., high WEB volume with few account validations)
- [ ] Audit authorization records quarterly
- [ ] Respond to disputes within 10 business days
- [ ] Review bank compliance feedback regularly

> **Critical Principle**: SEC codes document your authorization process. Accurate implementation provides regulatory protection; incorrect usage creates liability under consumer protection regulations.

## 📋 Quick Reference: SEC Code Decision Tree

**Step 1: Who's the account holder?**
- Business name (LLC, INC, CORP, etc.) → Use **CCD** family
- Individual person → Continue to Step 2

**Step 2: How was authorization captured?**
- Online form/website → **WEB** (with account validation)
- Phone call → **TEL** (with recorded authorization OR written confirmation)
- Signed agreement → **PPD**
- Mailed/dropped-off check → **ARC**
- In-person check at register → **POP**

**Step 3: Need remittance data?**
- Simple payments → Standard codes (PPD, CCD, WEB, TEL)
- Invoice details needed → Enhanced codes (PPD+, CCD+)
- Full EDI integration → **CTX**

## References

1. **NACHA (National Automated Clearing House Association)**. "ACH Rules & Guidelines." *NACHA.org*, 2024. [https://www.nacha.org/rules](https://www.nacha.org/rules)

2. **Federal Reserve**. "Regulation E - Electronic Fund Transfers." *FederalReserve.gov*, 2024. [https://www.federalreserve.gov/regulations/](https://www.federalreserve.gov/regulations/)

3. **NACHA Operating Rules**. "Standard Entry Class Codes." *NACHA Operating Rules & Guidelines*, 2024.

---

*Enjoyed this deep dive? Check out the main [How U.S. Payments Really Work](/series/payments) series for more payment system breakdowns.*
