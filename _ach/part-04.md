---
layout: default
title: "ACH Correction Codes Deep Dive: What They Mean and How to Handle Them"
date: 2025-08-21
categories: [ach]
tags: [ach, nacha, noc, correction-codes, compliance, fintech-operations, audit, developer-resource]
excerpt: "Yesterday we talked about why ACH corrections (NOCs) matter: fix them, log them, and prove you did. Today, let's get tactical. This post dives into the actual correction codes (C01–C99) you'll encounter, what they mean, and how to respond in practice."
banner_image: "/assets/banners/resized/20250821corrections.jpg"
banner_image_recent: "/assets/banners/resized/20250821corrections.jpg"
banner_image_series: "/assets/banners/resized/20250821corrections.jpg"
banner_color: "#157878"

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/ach/part-04.html"
author:
  name: "Suma Manjunath"
  twitter: "@sumahiremath"
  
# Open Graph / Social Media
og:
  title: "ACH Correction Codes Deep Dive: What They Mean and How to Handle Them"
  description: "Deep dive into ACH correction codes (C01-C99) with downloadable JSON/CSV reference for developers. Learn what each code means and how to handle them in practice."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "ACH Correction Codes Deep Dive: What They Mean and How to Handle Them"
  description: "Deep dive into ACH correction codes (C01-C99) with downloadable JSON/CSV reference for developers. Learn what each code means and how to handle them in practice."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"

# Series information
series: ["ach"]
series_info:
  name: "ACH Deep Dive"
  part: 4
  total_parts: 4
  read_time: 10
  tags: [ach, noc, corrections, compliance]
---
# ACH Correction Codes Deep Dive: What They Mean and How to Handle Them

*Published on: August 21, 2025*

![ACH Correction Codes](/assets/banners/resized/20250821corrections-blog.jpg)

In article [ACH Correction Codes: Fix It, Log It, Prove It](https://buildtales.dev/fintech/payments/2025/08/21/ach-correction-codes-deep-dive.html) we talked about why ACH corrections (NOCs) matter: fix them, log them, and prove you did. Today, let's get tactical. This post dives into the actual correction codes (C01–C99) you'll encounter, what they mean, and how to respond in practice.

## What Are ACH Correction Codes?

Correction codes (or NOCs) are standardized identifiers issued by the RDFI (Receiving Depository Financial Institution). They tell the ODFI (and ultimately, you as the originator) exactly what needs to be updated in your records.

Each code is specific, actionable, and binding. If you don't make the change before your next file, you're officially out of compliance.

## What Does a Correction Look Like in a NACHA File?

A Notification of Change comes in as a COR (Correction) entry in the ACH file. Here's a full NACHA file example showing a single correction (C01 – Incorrect Account Number):

```
101 111000025 2220000332308160000A094101BANK NAME        COMPANY NAME      
5225COMPANY NAME     1234567890PPDCORRECTION 230816   1122000030000001
6222220000330123456789               0000000000CORC01 9876543210          CUSTOMER NAME          0000000000000000
7990000001C01INCORRECT ACCOUNT NUMBER - UPDATE TO 9876543210
820000000100222000030000000000000000000000000000000000000012200003       
9000001000001000000010022200030000000000000000000000000000000000000
```

### File Breakdown

- **File Header (1 Record)** – Identifies file origin, destination, and creation.
- **Batch Header (5 Record)** – Defines batch (company, SEC code, description).
- **Entry Detail (6 Record)** – The correction itself. SEC Code = COR, NOC Code = C01.
- **Addenda (7 Record)** – RDFI description of the correction.
- **Batch Control (8 Record)** – Batch totals.
- **File Control (9 Record)** – File totals, consistency checks.

As a developer, you'll want your ACH parser to:

1. Detect SEC Code = COR.
2. Pull the correction code (C01–C99).
3. Extract the corrected data (account/routing/etc).
4. Log & apply changes to your system of record.

## Developer-Friendly NOC Examples

Here are the most common correction codes you'll see in production:

| Code | What It Means | Action Required |
|------|---------------|-----------------|
| **C01** | Incorrect Account Number | The account number you sent is invalid. RDFI provides the correct one. |
| **C02** | Incorrect Routing Number | Routing number changed (merger, consolidation, etc.). |
| **C05** | Incorrect Transaction Code | Wrong account type (checking vs. savings). |
| **C06** | Incorrect Account Number & Transaction Code | Both the account number and transaction type are wrong. |
| **C07** | Incorrect Routing + Account + Transaction Code | Everything is wrong. |

👉 Each of these looks just like the C01 example above—same file structure, different Cxx code + corrected data values.

## Why Every Code Costs You

Each NOC comes with a per-item RDFI fee. Keep sending uncorrected data and the ACH operator will grumble. Multiply by hundreds of transactions, and you're literally burning money.

Compliance = cost savings. Fix once, prove it, and avoid repeat charges.

## How Devs Should Handle NOCs

1. **Parse Automatically** – Always scan incoming ACH files for COR.
2. **Route to System of Record** – Customer DB, vendor master, payroll, etc.
3. **Apply the Correction** – Overwrite with RDFI-provided data, no questions asked.
4. **Log the Change** – Timestamp, operator/system, old vs new values.
5. **Verify Next File** – Confirm corrected data flows into the next outgoing file.

## Complete ACH NOC Codes Reference

Below you'll find the complete reference for all ACH correction codes (C01-C99) with descriptions and fields impacted. This is designed to be developer-ready for direct integration into parsers, validators, or audit tooling.

### Downloadable Resources

- **[ACH NOC Codes Reference (CSV)](/assets/downloads/ach-noc-codes-reference.csv)** - Comma-separated values for spreadsheet analysis
- **[ACH NOC Codes Reference (JSON)](/assets/downloads/ach-noc-codes-reference.json)** - Structured data for API integration and automation

### Code Reference Table

**Note**: Many ACH correction codes represent the same issue. For example, C67-C99 are all essentially "Return Not a Duplicate" codes. This duplication is common in ACH systems where multiple codes may represent the same underlying problem.

| Code | Description | Fields Impacted | Action Required |
|------|-------------|-----------------|-----------------|
| **C01** | Incorrect Account Number | Account Number | Update customer/vendor record with new account number |
| **C02** | Incorrect Routing Number | Routing Number | Update bank directory or partner record with new routing number |
| **C03** | Incorrect Routing Number and Incorrect Account Number | Routing Number, Account Number | Update both routing and account numbers |
| **C04** | Incorrect Individual Identification Number | Individual ID Number | Update customer identification number |
| **C05** | Incorrect Transaction Code | Transaction Code | Fix the account type flag in your system |
| **C06** | Incorrect Account Number and Incorrect Transaction Code | Account Number, Transaction Code | Treat as re-enrollment; validate customer info fully |
| **C07** | Incorrect Routing Number, Incorrect Account Number, and Incorrect Transaction Code | Routing Number, Account Number, Transaction Code | Re-enroll customer/vendor before resubmitting |
| **C08** | Incorrect Foreign Receiving DFI Identification | Foreign Receiving DFI ID | Update international bank routing information |
| **C09** | Incorrect Individual Identification Number and Incorrect Transaction Code | Individual ID Number, Transaction Code | Update both ID and account type |
| **C13** | Addenda Format Error | Addenda Record | Fix addenda record format in your system |
| **C14** | Incorrect SEC Code for Outbound International Payment | SEC Code | Update SEC code for international transactions |
| **C61** | Misrouted Return | Return Code | Route return to correct destination |
| **C62** | Incorrect Return Code | Return Code | Update return code in your system |
| **C63** | Return Not a Duplicate | Return Code | Remove duplicate return processing |
| **C64** | Incorrect Return Entry | Return Entry | Fix return entry details |
| **C65** | Return of Erroneous or Reversing Debit | Return Code | Process as regular return, not reversal |
| **C67-C99** | Return Not a Duplicate (Multiple Codes) | Return Code | Remove duplicate return processing - these codes are essentially the same issue |

## Implementation Example

Here's a simple Ruby example of how to parse and handle NOC codes:

```ruby
require 'csv'
require 'json'
require 'time'

class ACHNOCParser
  def initialize
    # Load NOC codes reference
    @noc_codes = JSON.parse(File.read('ach-noc-codes-reference.json'))
  end
  
  def parse_nacha_file(file_content)
    lines = file_content.split("\n")
    corrections = []
    
    lines.each do |line|
      if line.start_with?('6') && line.include?('COR')
        # Parse correction entry
        noc_code = line[79, 2]  # C01, C02, etc.
        corrected_data = extract_corrected_data(line, noc_code)
        
        corrections << {
          noc_code: noc_code,
          description: @noc_codes.dig(noc_code, 'description') || 'Unknown',
          corrected_data: corrected_data,
          timestamp: Time.now.iso8601
        }
      end
    end
    
    corrections
  end
  
  def extract_corrected_data(line, noc_code)
    # Extract corrected fields based on NOC code
    # This is a simplified example - actual implementation would be more robust
    case noc_code
    when 'C01'
      { account_number: line[12, 17].strip }
    when 'C02'
      { routing_number: line[3, 9] }
    else
      # Add more code-specific parsing logic
      {}
    end
  end
  
  def apply_correction(correction)
    # Apply correction to your system of record
    puts "Applying #{correction[:noc_code]}: #{correction[:description]}"
    puts "Corrected data: #{correction[:corrected_data]}"
    
    # Log the correction
    log_correction(correction)
    
    # Update your database/customer records here
    # This is where you'd integrate with your CRM, ERP, etc.
  end
  
  def log_correction(correction)
    # Log every correction for audit purposes
    log_entry = {
      timestamp: correction[:timestamp],
      noc_code: correction[:noc_code],
      description: correction[:description],
      corrected_data: correction[:corrected_data],
      operator: 'system',  # or actual user ID
      status: 'applied'
    }
    
    # Write to your audit log
    puts "Logged correction: #{log_entry}"
  end
end

# Usage example
parser = ACHNOCParser.new
# parser.parse_nacha_file(your_nacha_file_content)
```

## Final Word

ACH correction codes (C01-C99) are more than just error messages—they're your roadmap to clean, compliant payment files. Each code tells you exactly what's wrong and what needs to be fixed. The key is building systems that can read these codes automatically, apply corrections systematically, and maintain an audit trail that proves compliance.

Don't let NOCs become a manual, error-prone process. Build automation around them. Parse them programmatically, route them to the right systems, and log every change. When you treat correction codes as structured data rather than administrative noise, you turn compliance headaches into operational advantages.

The difference between a fintech company that struggles with ACH corrections and one that handles them seamlessly? The second company built their systems to speak the language of NACHA from day one.

## References

1. **NACHA**. "ACH Operating Rules & Guidelines." *NACHA*, 2024. [nacha.org](https://www.nacha.org)
2. **Federal Reserve**. "FedACH Services - Notification of Change." *Federal Reserve Financial Services*, 2024.
3. **ACH Network**. "Notification of Change (NOC) Codes." *ACH Network*, 2024.
