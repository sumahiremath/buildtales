---
layout: default
title: "NACHA File Demystified: Cracking the 94-Character Code"
date: 2025-08-15
categories: [fintech, ach]
tags: [nacha, ach, file-format, fintech-operations, payments-infrastructure, banking]
excerpt: "Every ACH transaction starts as a carefully crafted 94-character line in a NACHA file. Let's decode the cryptic structure that moves $72 trillion annually through the U.S. banking system."
banner_image: "/assets/banners/resized/20250815nachafile-blog.jpg"
banner_image_recent: "/assets/banners/resized/20250815nachafile-recent.jpg"
banner_image_series: "/assets/banners/resized/20250815nachafile-series.jpg"
banner_color: "#157878"

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/fintech/payments/2025/08/15/nacha-file-demystified.html"
author:
  name: "Suma Manjunath"
  twitter: "@sumahiremath"
  
# Open Graph / Social Media
og:
  title: "NACHA File Demystified: Cracking the 94-Character Code"
  description: "Deep dive into NACHA file structure - the 94-character lines that power $72 trillion in ACH transactions. Includes real examples and field-by-field breakdown."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "NACHA File Demystified: Cracking the 94-Character Code"
  description: "Deep dive into NACHA file structure - the 94-character lines that power $72 trillion in ACH transactions. Includes real examples and field-by-field breakdown."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"

# NOTE: No "series" metadata = this will be classified as a bonus article
---

# NACHA File Demystified: Cracking the 94-Character Code

*Published on: August 15, 2025*

![NACHA Demystified Banner](/assets/banners/resized/20250815nachafile-blog.jpg)

Picture this: You're building a payroll system, and your first ACH file submission gets rejected with a cryptic "Invalid field length at position 47." Meanwhile, $72 trillion moves through these exact same files every year without a hitch.

Welcome to NACHA files—where every character matters, spaces are sacred, and one misplaced digit can derail your entire batch.

## Why This Matters Now

If you're building anything that touches money in the U.S., you'll eventually encounter NACHA files. They're the beating heart of ACH transactions—from your Venmo transfer to that $50K B2B payment. But the 50-year-old fixed-width format feels like archaeology until you need to debug why your file got rejected at 2 AM.

## The Anatomy of Financial DNA

Every NACHA file is exactly what it sounds like: a text file with rigidly structured lines, each exactly 94 characters. No more, no less. Think of it as financial DNA—every position has meaning, every character serves a purpose.

But here's the perfect analogy: **NACHA files are like mail delivery**:
- **File Header/Footer (lines 1 & 9)** = The envelope telling the postal system who's sending to whom
- **Batch Header/Footer (lines 5 & 8)** = Letters inside the envelope, each with their own addressing
- **Entry Details (line 6)** = The actual message content (transactions)
- **Addenda Records (line 7)** = Extra pages, return receipts, or "address correction" notices

Let's walk through the first 9 lines of a real NACHA file:

### Line 1: File Header Record (Type '1') - The Envelope
```
101 121042882 12345678912345608151806002094101FIRST NATIONAL BANK    ACME CORP              
```

This is the **envelope** that tells the postal system (banking network): "Here's who's sending money to whom, when, and how to route this file through the ACH system."

**Field breakdown:**
- **Positions 1-1:** Record Type Code (`1`)
- **Positions 2-3:** Priority Code (`01` - always)  
- **Positions 4-13:** Immediate Destination (`121042882` - receiving bank's routing number)
- **Positions 14-23:** Immediate Origin (`1234567891` - your ODFI's routing number + company ID)
- **Positions 24-29:** File Creation Date (`250815` - YYMMDD)
- **Positions 30-33:** File Creation Time (`1800` - HHMM)
- **Positions 34-34:** File ID Modifier (`A` - daily sequence)
- **Positions 35-37:** Record Size (`094` - always 94 characters)
- **Positions 38-39:** Blocking Factor (`10` - always)
- **Positions 40-40:** Format Code (`1` - always)
- **Positions 41-63:** Immediate Destination Name (`FIRST NATIONAL BANK`)
- **Positions 64-86:** Immediate Origin Name (`ACME CORP`)
- **Positions 87-94:** Reference Code (optional notes)

### Line 2: Company/Batch Header Record (Type '5') - The Letter Header
```
5220ACME CORP                   1234567891PPDPAYROLL   250815   1123456780000001
```

Think of this as the **letter header** inside the envelope. Each batch is like a separate letter with its own purpose - this one says "ACME Corp is sending payroll transactions."

**Key fields:**
- **Positions 1-1:** Record Type (`5`)
- **Positions 2-4:** Service Class Code (`220` = mixed debits/credits)
- **Positions 5-20:** Company Name (`ACME CORP`)
- **Positions 21-40:** Company Discretionary Data (internal reference)
- **Positions 41-50:** Company ID (`1234567891`)
- **Positions 51-53:** Standard Entry Class (`PPD` = Prearranged Payment/Deposit)
- **Positions 54-63:** Company Entry Description (`PAYROLL`)
- **Positions 64-69:** Company Descriptive Date (`250815`)
- **Positions 70-75:** Effective Entry Date (`250815`)
- **Positions 76-78:** Settlement Date (Julian, blank = next banking day)
- **Positions 79-79:** Originator Status Code (`1`)
- **Positions 80-87:** Originating DFI ID (`12345678`)
- **Positions 88-94:** Batch Number (`0000001`)

### Lines 3-6: Entry Detail Records (Type '6')
```
627123456789987654321        0000050000JOHN DOE              0123456780000001
627123456789876543210        0000075000JANE SMITH            0123456780000002  
622123456789555666777        0000100000MIKE JOHNSON          0123456780000003
627123456789444555666        0000025000SARAH WILSON          0123456780000004
```

Here's where the money moves. Each line represents one transaction.

### Line 7: Addenda Record (Type '7') - The Extra Pages
```
799RETURN REASON: R01 INSUFFICIENT FUNDS                                    00010000001
```

These are the "extra pages" attached to transactions. Addenda records serve multiple critical purposes:

**Outgoing (your additional info):**
- **CCD/CTX transactions**: Can include remittance data, invoice details
- **Corporate payments**: Purchase order numbers, contract references  
- **B2B payments**: Detailed payment allocation information
- **International**: Additional regulatory or routing information

**Incoming (bank responses):**
- **Returns**: When transactions fail (insufficient funds, account closed)
- **Notifications of Change (NOC)**: When account info needs updating
- **Acknowledgments**: Confirmation receipts from receiving banks

**Addenda anatomy:**
- **Position 1:** Record Type (`7`)
- **Position 2:** Addenda Type Code (`05` = remittance data, `99` = returns/NOCs)
- **Positions 3-82:** Payment Related Information (remittance details, return reason, etc.)
- **Positions 83-86:** Addenda Sequence Number (`0001`)
- **Positions 87-94:** Entry Detail Sequence Number (`0000001`)

**Entry Detail anatomy:**
- **Position 1:** Record Type (`6`)
- **Position 2:** Transaction Code (`22` = credit to checking, `27` = debit from checking)
- **Positions 3-10:** Receiving DFI ID (first 8 digits of recipient's bank routing)
- **Positions 11-27:** DFI Account Number (recipient's account, left-justified)
- **Positions 28-37:** Amount (`0000050000` = $500.00, no decimal point)
- **Positions 38-59:** Individual Name (`JOHN DOE`)
- **Positions 60-61:** Discretionary Data (usually blank)
- **Positions 62-79:** Individual ID Number (employee ID, SSN, etc.)
- **Positions 80-94:** Trace Number (unique transaction identifier)

### Line 8: Company/Batch Control Record (Type '8') - The Letter Footer  
```
822000000500492592580000000000000000025000012345678000001
```

This closes the **letter** (batch) with a mathematical proof that everything adds up correctly. Like signing and dating a letter.

**Control totals:**
- **Position 1:** Record Type (`8`)
- **Positions 2-4:** Service Class Code (`220`)
- **Positions 5-10:** Entry/Addenda Count (`000005` = 4 transactions + 1 addenda)
- **Positions 11-20:** Entry Hash (`0492592580` - sum of first 8 digits of all routing numbers, rightmost 10 digits)
- **Positions 21-32:** Total Debit Amount (`000000000000`)
- **Positions 33-44:** Total Credit Amount (`000000250000` = $2,500.00)
- **Positions 45-54:** Company ID (`1234567891`)
- **Positions 80-87:** Originating DFI ID (`12345678`)
- **Positions 88-94:** Batch Number (`0000001`)

### Line 9: File Control Record (Type '9') - Sealing the Envelope
```
9000001000001000000050492592580000000000000000025000                       
```

This **seals the envelope** with file-level totals that must match the sum of all letters (batches) inside. The postal system uses this to verify nothing was lost in transit.

**File totals:**
- **Position 1:** Record Type (`9`)
- **Positions 2-7:** Batch Count (`000001`)
- **Positions 8-13:** Block Count (`000001`)
- **Positions 14-21:** Entry/Addenda Count (`00000005`)
- **Positions 22-31:** Entry Hash (`0492592580` - sum of first 8 digits of all routing numbers, rightmost 10 digits)
- **Positions 32-43:** Total File Debit Amount (`000000000000`)
- **Positions 44-55:** Total File Credit Amount (`000000250000`)

## The Devil's in the Details

### Why Fixed-Width Still Rules
In an era of JSON APIs and GraphQL, NACHA's fixed-width format feels archaic. But there's method to the madness:

1. **Parsing Performance:** Banks process millions of transactions daily. Fixed-width parsing is blazingly fast.
2. **Error Detection:** Misaligned data is immediately obvious.
3. **Legacy Integration:** Core banking systems from the 1970s still run production workloads.
4. **Regulatory Compliance:** The format is legally mandated and audited.

### Common Gotchas That Will Bite You

**Padding Hell:**
```ruby
# Wrong - this will get rejected
account_number = "12345"

# Right - left-justified, space-padded to 17 characters  
account_number = "12345            "
```

**Numerical Nightmares:**
```ruby
# Wrong - NACHA doesn't understand decimals
amount = "500.00"

# Right - implied decimal, zero-padded to 10 digits
amount = "0000050000"  # represents $500.00
```

**Date Format Disasters:**
```ruby
# Wrong - ISO 8601 is too modern
date = "2025-08-15"

# Right - YYMMDD format
date = "250815"
```

## Building a NACHA File Generator

Here's a Ruby class that handles the core structure:

```ruby
class NachaFileBuilder
  def initialize(company_name:, company_id:, destination_bank:)
    @company_name = company_name
    @company_id = company_id
    @destination_bank = destination_bank
    @entries = []
    @batch_number = 1
  end
  
  def add_credit(account_number:, routing_number:, amount:, name:, individual_id:)
    @entries << {
      transaction_code: '22',  # Credit to checking account
      routing_number: routing_number,
      account_number: account_number.ljust(17),
      amount: sprintf('%010d', (amount * 100).to_i),
      name: name.ljust(22)[0,22],
      individual_id: individual_id
    }
  end
  
  def generate_file
    lines = []
    lines << file_header_record
    lines << batch_header_record
    
    @entries.each_with_index do |entry, index|
      lines << entry_detail_record(entry, index + 1)
    end
    
    lines << batch_control_record
    lines << file_control_record
    
    # Pad to block boundary (multiple of 10 lines)
    while lines.length % 10 != 0
      lines << "9" * 94
    end
    
    lines.join("\n")
  end
  
  private
  
  def file_header_record
    [
      '1',                                    # Record Type
      '01',                                   # Priority Code
      @destination_bank.ljust(10),            # Immediate Destination
      @company_id.rjust(10, '0'),            # Immediate Origin
      Time.now.strftime('%y%m%d'),           # File Creation Date
      Time.now.strftime('%H%M'),             # File Creation Time
      'A',                                   # File ID Modifier
      '094',                                 # Record Size
      '10',                                  # Blocking Factor
      '1',                                   # Format Code
      'BANK NAME'.ljust(23),                 # Destination Name
      @company_name.ljust(23),               # Origin Name
      ' ' * 8                                # Reference Code
    ].join('').ljust(94)
  end
  
  def entry_detail_record(entry, trace_number)
    [
      '6',                                   # Record Type
      entry[:transaction_code],              # Transaction Code
      entry[:routing_number][0,8],           # Receiving DFI ID
      entry[:account_number],                # Account Number
      entry[:amount],                        # Amount
      entry[:name],                          # Individual Name
      '  ',                                  # Discretionary Data
      entry[:individual_id].ljust(15),       # Individual ID
      sprintf('%07d', trace_number)          # Trace Number
    ].join('').ljust(94)
  end
  
  # ... other record methods
end
```

## Complete Working Example

Here's a minimal but valid NACHA file you can copy-paste and test. It contains 1 credit + 1 debit transaction, properly padded to a 10-line block:

```
101 121042882 123456789 2508151800A094101FIRST NATIONAL BANK    ACME CORP              
5220ACME CORP                   1234567891PPDPAYROLL   250815   1123456780000001
6221234567801234567890123456    0000100000JOHN DOE              0000000000000001
6271234567809876543210987654    0000050000JANE SMITH            0000000000000002
8220000002002469135600000000500000000001000001234567890000001
900000100000200000002024691356000000005000000000100000
9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
```

### What's Happening Here:

**Line 1 (File Header):** The envelope - tells the system who's sending to whom
- `121042882` → Destination bank routing number
- `123456789` → Origin ODFI routing number  
- `2508151800` → File created August 15, 2025 at 18:00

**Line 2 (Batch Header):** Letter header - describes this batch of transactions
- `5220` → Mixed debits and credits service class
- `PPD` → Prearranged Payment & Deposit entry class
- `250815` → Effective date (August 15, 2025)

**Line 3 (Credit Entry):** $100.00 credit to John Doe's checking account
- `22` → Credit to checking account
- `0000100000` → $100.00 (implied decimal)

**Line 4 (Debit Entry):** $50.00 debit from Jane Smith's checking account  
- `27` → Debit from checking account
- `0000050000` → $50.00 (implied decimal)

**Line 5 (Batch Control):** Mathematical proof for this batch
- `2` entries total, `$100` credit, `$50` debit
- Entry hash: `02469135` (sum of receiving DFI routing numbers)

**Line 6 (File Control):** File-level totals (must match batch totals)
- `1` batch, `2` entries, same monetary totals

**Lines 7-10:** Padding with all 9s to reach 10-line block boundary

### Testing This File

Copy the above example into a text file (save as `sample.ach`) and:
- **Use NACHA validation tools** to verify the format
- **Test with your Ruby generator** to compare output  
- **Examine with a hex editor** to see the exact 94-character line structure
- **Study the math**: Notice how entry hash `024691356` = `12345678` + `12345678` (first 8 digits of both routing numbers)

## Precision Notes for Builders

A few critical clarifications that trip up even experienced developers:

- **Transaction Codes**: `22` = credit to checking account, `27` = debit from checking account. Remember: it's from the recipient's perspective.
- **Immediate Origin**: Usually your ODFI's routing number (sometimes combined with company ID), not your company's EIN or Fed ID.
- **Entry Hash**: Sum of the first 8 digits of all receiving bank routing numbers, then truncated to the rightmost 10 digits.
- **Addenda Types**: `05` for remittance data (CCD/CTX), `99` for returns and Notifications of Change (NOCs).
- **Block Count**: Number of physical blocks (10 records per block). In our example: 10 lines = 1 block. The `9` padding records count toward this total.
- **Discretionary Data**: Positions 60-61 in Entry Detail records. Most leave blank, but some originators use for internal tracking codes.
- **Trace Number**: Should be 8-digit ODFI routing + 7-digit sequence (15 characters total). Our simplified examples show just the sequence portion.

## Key Takeaways

- **Every character counts:** NACHA files are unforgiving. One misplaced space will reject your entire batch.
- **Think in fixed-width:** Padding, alignment, and field lengths are non-negotiable.
- **Test religiously:** Use the ACH operator's file validation tools before going live.
- **Embrace the constraints:** The rigid format enables high-speed, reliable processing.
- **Read the spec:** NACHA's Operating Rules are your bible—all 500+ pages of them.

## References

1. **NACHA**. "ACH Operating Rules & Guidelines." *NACHA*, 2024. [nacha.org](https://www.nacha.org)
2. **Federal Reserve**. "FedACH Services." *Federal Reserve Financial Services*, 2024.

---

*Enjoyed this deep dive? Check out the main [How U.S. Payments Really Work](/series/payments) series for more payment system mysteries demystified.*
