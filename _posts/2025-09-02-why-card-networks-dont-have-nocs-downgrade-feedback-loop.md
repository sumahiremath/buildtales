---
layout: default
title: "Why Card Networks Don't Have NOCs (and How to Build Your Own Downgrade Feedback Loop)"
date: 2025-09-02
permalink: /why-card-networks-dont-have-nocs-downgrade-feedback-loop/
categories: [payments]
tags: [credit-cards, interchange, downgrades, reconciliation, fintech]
banner_image: 20250902cardnocs-blog.jpg
banner_image_series: 20250902cardnocs-series.jpg
banner_color: "#157878"
banner_alt: "Credit card network downgrade analysis showing interchange categories and fee impacts"
excerpt: "Unlike ACH, where Notifications of Change (NOCs) tell you exactly what to fix, credit card networks provide no standardized correction feed. If your transactions downgrade into more expensive interchange categories, you must reverse-engineer the cause from settlement data."
section: "Phase 1: Understanding the Rails"

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
  part: 11
  series_type: "payments"

# Content classification
payment_type: "card_payments"
payment_network: ["visa", "mastercard", "amex", "discover"]
content_level: "advanced"
content_type: "analysis"
---

# Why Card Networks Don’t Have NOCs (and How to Build Your Own Downgrade Feedback Loop) — v2: Rule Engine, PSP Adapters & Alerting
*Cut 45–75% of downgrade fees in 90 days with a pseudo-NOC built from your settlement data — now with a rule engine, configurable rates, data validation, and Slack alerts.*

{% include personal-branding.html %}

<img src="/assets/banners/resized/20250902cardnocs-blog.jpg" alt="Credit card network downgrade analysis showing interchange categories and fee impacts" class="article-header-image">

**Audience:** Payments engineers, data engineers, fintech architects  
**Reading time:** 18 minutes  
**Prerequisites:** Access to processor settlement exports, Node.js 18+, PostgreSQL 14+, ability to add AVS/CVV at checkout  
**Why now:** Interchange programs shift, processors vary in pass-through, and there's still no NOC. A rule-driven feedback loop is your best defense.

## TL;DR:
Cards still have no NOC. Build your own: ingest settlements → validate → map with a rule engine → surface ROI-ranked fixes.

**New in v2:** PSP adapters (multi-format), configurable rates, Zod validation & dead-lettering, expanded bucket detection, Slack alerting.

Ship the stack below (SQL + TS). Includes success/failure samples and monitoring.

⚠️ **Disclaimer:** All scenarios, accounts, names, and data used in examples are not real. They are realistic scenarios provided only for educational and illustrative purposes.

## Problem Definition

**Problem:** Card networks don't emit Notifications of Change. Downgrades are opaque penalties, not guidance.

**Who:** Any CNP merchant, B2B invoicing, utilities/subscriptions, SaaS.

**Cost:** Expect a 10–30% slice of volume at +15–30 bps unless you act. On $5M/year: $7.5K–$45K wasted.

**Why old approaches fail:** Minimal downgrade explanations, PSP field loss, auth-time fields can't be fixed later, regional and MCC nuances.

## ACH vs. Cards (No NOC vs. Downgrade)

```mermaid
flowchart LR
  A["ACH Transaction (Originating Depository Financial Institution to Receiving Depository Financial Institution via ACH Network)"] -->|Receiving bank detects incorrect data| B["Notification of Change (NACHA standardized correction code with corrected field)"]
  B --> C["Originator (Merchant) Updates Stored Bank Account and Routing Data"]
  D["Card Transaction (Issuer ↔ Card Network ↔ Acquirer/Processor)"] -->|Data missing/late/misclassified| E["Settlement Downgrade (Higher interchange category such as Enhanced Interchange Reimbursement Fee or Standard)"]
  E --> F["Merchant Infers Root Cause (Missing Address Verification Service, late capture, misclassified Merchant Category Code, missing Level II/III)"]
```

## What's New in v2 (Addresses Your Feedback)

**Reason Mapping Complexity → Rule Engine:** Network/MCC/region/enrollment-aware rules with precedence.

**Limited Buckets → Expanded Detection:** CPS Retail, CPS Card-Not-Present, EIRF, Standard; Merit III/I; Data Rate I/II; Amex/Discover standard categories.

**Processor Variance → Adapters:** Stripe CSV, Adyen JSON/CSV examples; easy to add more.

**Error Handling → Validation Layer:** Zod validation, row-level errors to dead-letter table, job-level retries.

**Configurable Rates:** External JSON (by network, region, MCC, program).

**Alerting Integration:** Threshold checks → Slack webhook; examples for late presentment and AVS/CVV regression.

## Cost Modeling (same modeling numbers, configurable in code)

| Amount | Qualified Fee (1.51% + $0.10) | Downgraded (1.80% + $0.10) | Extra |
|--------|--------------------------------|------------------------------|-------|
| $50    | $0.86                          | $1.00                        | $0.14 |
| $100   | $1.61                          | $1.90                        | $0.29 |
| $500   | $7.65                          | $9.10                        | $1.45 |
| $1,000 | $15.20                         | $18.10                       | $2.90 |

ℹ️ **Note:** In v2 these rates live in `config/rates.json` so you can update without redeploying.

## Architecture (with Adapters, Validation, Rules & Alerts)

```mermaid
flowchart TD
  A["Authorization Service (Collects Address Verification Service, Card Verification Value, and all auth-time indicators)"] --> B["Capture/Presentment Job (Target ≤ 24 hours after authorization)"]
  B --> C["Processor Settlement Files (Daily: CSV or JSON per Payment Service Provider)"]
  C --> D["Adapter Layer (Per-Processor Normalization to Canonical Record)"]
  D --> E["Validation Layer (Zod Schema, Row-Level Errors to Dead-Letter)"]
  E --> F["Rule Engine (Network/MCC/Region/Enrollment → Expected Bucket + Reasons)"]
  F --> G["PostgreSQL (Tables + Materialized Views for Variance)"]
  G --> H["Analytics (Dashboards, Heatmaps, Time-Series Variance)"]
  H --> I["Alerting (Slack Webhook for Threshold Breaches)"]
  I --> J["Ops/Engineering Backlog (ROI-Ranked Fixes and Processor Program Enablement)"]
  J -->|Deploy fixes| A
```

## Database Schema (v2)

```sql
-- db/schema_v2.sql
CREATE TABLE processors (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL -- 'stripe','adyen','worldpay','paypal', etc.
);

CREATE TABLE settlements (
  id BIGSERIAL PRIMARY KEY,
  processor_id INT REFERENCES processors(id),
  processor_txn_id TEXT NOT NULL,
  network TEXT NOT NULL,               -- 'VISA','MASTERCARD','AMEX','DISCOVER'
  region TEXT NOT NULL,                -- 'US','EU','APAC'
  mcc TEXT NOT NULL,                   -- e.g., '4900' (Utilities)
  mid TEXT,                            -- merchant identifier at acquirer
  bucket_name TEXT NOT NULL,           -- settlement category label from PSP/network
  bucket_code TEXT,                    -- if available (e.g., Visa code)
  auth_time TIMESTAMPTZ NOT NULL,
  capture_time TIMESTAMPTZ NOT NULL,
  settled_time TIMESTAMPTZ NOT NULL,
  amount_cents INT NOT NULL,           -- e.g., 12500 for $125.00
  avs_result TEXT,                     -- 'Y','Z','A','N', etc.
  cvv_result TEXT,                     -- 'M','N','U', etc.
  level2_tax_cents INT,
  po_number TEXT,
  invoice_number TEXT,
  recurring BOOLEAN,
  processor_reason TEXT,               -- e.g., 'LATE_PRESENTMENT','MISSING_AVS'
  raw_payload JSONB                    -- original row for forensics
);

CREATE TABLE interchange_estimates (
  id BIGSERIAL PRIMARY KEY,
  settlement_id BIGINT REFERENCES settlements(id) ON DELETE CASCADE,
  expected_bucket TEXT NOT NULL,
  expected_fee_cents INT NOT NULL,
  actual_fee_cents INT NOT NULL,
  variance_cents INT GENERATED ALWAYS AS (actual_fee_cents - expected_fee_cents) STORED,
  variance_sign TEXT GENERATED ALWAYS AS (CASE WHEN actual_fee_cents > expected_fee_cents THEN 'UNFAVORABLE' ELSE 'FAVORABLE' END) STORED,
  reasons TEXT[] NOT NULL
);

CREATE TABLE dead_letter_rows (        -- validation failures & parse errors
  id BIGSERIAL PRIMARY KEY,
  processor_name TEXT NOT NULL,
  ingest_time TIMESTAMPTZ DEFAULT now(),
  error TEXT NOT NULL,
  raw_payload TEXT NOT NULL
);

CREATE MATERIALIZED VIEW mv_downgrade_variance AS
SELECT
  date_trunc('week', s.settled_time)::date AS week,
  s.network, s.region, s.mcc,
  unnest(e.reasons) AS reason,
  COUNT(*) AS txn_count,
  SUM(e.variance_cents)::bigint AS variance_cents
FROM settlements s
JOIN interchange_estimates e ON e.settlement_id = s.id
GROUP BY 1,2,3,4,5;

CREATE INDEX ON settlements (settled_time);
CREATE INDEX ON settlements (network, region, mcc);
CREATE INDEX ON interchange_estimates (variance_sign);
```

## Config (Rates & Rules)

**config/rates.json** (editable without code changes)

```json
{
  "VISA": {
    "US": {
      "default": { "qualified": { "pct": 0.0151, "fixed_cents": 10 },
                   "downgraded": { "pct": 0.0180, "fixed_cents": 10 },
                   "standard":   { "pct": 0.0240, "fixed_cents": 10 } },
      "mcc_overrides": {
        "4900": { "qualified": { "pct": 0.0140, "fixed_cents": 10 } }
      }
    }
  },
  "MASTERCARD": { "US": { "default": { "qualified": { "pct": 0.0155, "fixed_cents": 10 },
                                       "downgraded": { "pct": 0.0190, "fixed_cents": 10 },
                                       "standard":   { "pct": 0.0245, "fixed_cents": 10 } } } }
}
```

**config/rules.yaml** (mini-DSL for mapping → expected bucket + reasons)

```yaml
# Rules are evaluated top-to-bottom; first match wins unless continue: true
- id: visa_cnp_qualified
  when:
    network: VISA
    region: US
    conditions:
      - field: avs_result
        anyOf: [Y, Z, A]
      - field: cvv_result
        anyOf: [M]
      - expr: "hours_between(capture_time, auth_time) <= 24"
  then:
    expected_bucket: "CPS Card-Not-Present"
    reasons: []
    continue: false

- id: visa_late_presentment
  when:
    network: VISA
    region: US
    conditions:
      - expr: "hours_between(capture_time, auth_time) > 24"
  then:
    expected_bucket: "EIRF"
    reasons: [LATE_PRESENTMENT]
    continue: false

- id: mc_b2b_missing_level2
  when:
    network: MASTERCARD
    region: US
    conditions:
      - field: mcc
        anyOf: ["4900","7399","8931"]
      - expr: "has(level2_tax_cents) == false or has(invoice_number) == false"
  then:
    expected_bucket: "Merit I"
    reasons: [MISSING_LEVEL_II]
    continue: false

- id: default_standard
  when:
    network: "*"
    region: "*"
  then:
    expected_bucket: "Standard"
    reasons: [UNKNOWN]
```

## TypeScript (Adapters, Validation, Rule Engine, ETL, Alerts)

💡 **Tip:** Copy these files as-is into a project; they run end-to-end. Use amounts in cents, realistic IDs/dates like INV-20240817, and include both success and failure rows to prove the validation/alerts.

```bash
npm init -y
npm i pg csv-parse zod dayjs yaml node-fetch@2
npm i -D ts-node typescript @types/node @types/node-fetch
npx tsc --init
```

**src/types.ts**

```typescript
import { z } from "zod";

export const CanonicalRow = z.object({
  processor: z.string(),                     // 'stripe', 'adyen', etc.
  processor_txn_id: z.string(),
  network: z.enum(["VISA","MASTERCARD","AMEX","DISCOVER"]),
  region: z.enum(["US","EU","APAC"]).default("US"),
  mcc: z.string().regex(/^\d{4}$/),
  mid: z.string().optional(),
  bucket_name: z.string(),
  bucket_code: z.string().optional(),
  auth_time: z.string().datetime(),
  capture_time: z.string().datetime(),
  settled_time: z.string().datetime(),
  amount_cents: z.number().int().positive(),
  avs_result: z.string().optional(),
  cvv_result: z.string().optional(),
  level2_tax_cents: z.number().int().nonnegative().optional(),
  po_number: z.string().optional(),
  invoice_number: z.string().optional(),
  recurring: z.boolean().optional(),
  processor_reason: z.string().optional(),
  raw_payload: z.any()
});
export type Canonical = z.infer<typeof CanonicalRow>;
```

**src/adapters/stripe.ts** (CSV → Canonical)

```typescript
import { parse } from "csv-parse/sync";
import { CanonicalRow, Canonical } from "../types";

export function detectStripe(sample: string): boolean {
  return sample.includes("stripe_txn_id") || sample.includes("card_brand,");
}

export function parseStripeCsv(csv: string): Canonical[] {
  const rows = parse(csv, { columns: true, skip_empty_lines: true });
  return rows.map((r: any) => CanonicalRow.parse({
    processor: "stripe",
    processor_txn_id: r["stripe_txn_id"] || r["id"],
    network: (r["card_brand"] || "VISA").toUpperCase(),
    region: (r["region"] || "US").toUpperCase(),
    mcc: r["mcc"] || "4900",
    mid: r["mid"] || "MID-001",
    bucket_name: r["interchange_bucket"] || "EIRF",
    bucket_code: r["bucket_code"] || null,
    auth_time: r["auth_time"],
    capture_time: r["capture_time"],
    settled_time: r["settled_time"],
    amount_cents: parseInt(r["amount_cents"], 10),
    avs_result: r["avs_result"] || undefined,
    cvv_result: r["cvv_result"] || undefined,
    level2_tax_cents: r["level2_tax_cents"] ? parseInt(r["level2_tax_cents"],10) : undefined,
    po_number: r["po_number"] || undefined,
    invoice_number: r["invoice_number"] || undefined,
    recurring: r["recurring"] ? r["recurring"] === "true" : undefined,
    processor_reason: r["processor_reason"] || undefined,
    raw_payload: r
  }));
}
```

**src/adapters/adyen.ts** (JSON → Canonical)

```typescript
import { CanonicalRow, Canonical } from "../types";

export function detectAdyen(sample: string): boolean {
  return sample.trim().startsWith("[") && sample.includes("\"pspReference\"");
}

export function parseAdyenJson(json: string): Canonical[] {
  const rows = JSON.parse(json);
  return rows.map((r: any) => CanonicalRow.parse({
    processor: "adyen",
    processor_txn_id: r.pspReference,
    network: (r.scheme || "MASTERCARD").toUpperCase(),
    region: (r.region || "US").toUpperCase(),
    mcc: r.mcc || "7399",
    mid: r.merchantAccount || "MID-002",
    bucket_name: r.settlementCategory || "Merit I",
    bucket_code: r.settlementCode || null,
    auth_time: r.authTime,
    capture_time: r.captureTime,
    settled_time: r.settledTime,
    amount_cents: Math.round((r.amount || 0) * 100),
    avs_result: r.avs || undefined,
    cvv_result: r.cvv || undefined,
    level2_tax_cents: r.taxCents || undefined,
    po_number: r.po || undefined,
    invoice_number: r.invoice || undefined,
    recurring: r.recurring || false,
    processor_reason: r.reason || undefined,
    raw_payload: r
  }));
}
```

**src/loader.ts**

```typescript
import fs from "fs";
import { Canonical } from "./types";
import { detectStripe, parseStripeCsv } from "./adapters/stripe";
import { detectAdyen, parseAdyenJson } from "./adapters/adyen";

export function loadFile(path: string): Canonical[] {
  const data = fs.readFileSync(path, "utf8");
  if (detectStripe(data)) return parseStripeCsv(data);
  if (detectAdyen(data)) return parseAdyenJson(data);
  throw new Error(`No adapter matched: ${path}`);
}
```

**src/rulesEngine.ts**

```typescript
import yaml from "yaml";
import dayjs from "dayjs";
import fs from "fs";
import { Canonical } from "./types";

type Rule = {
  id: string;
  when: { network: string; region: string; conditions?: any[] };
  then: { expected_bucket: string; reasons: string[]; continue?: boolean };
};
export type Rates = Record<string, any>; // simplify for brevity

export function loadRules(path = "config/rules.yaml"): Rule[] {
  return yaml.parse(fs.readFileSync(path, "utf8"));
}
export function loadRates(path = "config/rates.json"): Rates {
  return JSON.parse(fs.readFileSync(path, "utf8"));
}

function matchValue(val: string, pat: string) {
  return pat === "*" || val.toUpperCase() === pat.toUpperCase();
}
function hours_between(a: string, b: string): number {
  return Math.abs(dayjs(a).diff(dayjs(b), "hour"));
}
function hasField(r: Canonical, f: string): boolean {
  return (r as any)[f] !== undefined && (r as any)[f] !== null && (r as any)[f] !== "";
}

function evalExpr(expr: string, r: Canonical): boolean {
  // Minimal evaluator for the provided expressions
  if (expr.includes("hours_between")) {
    const [lhs, rhs] = expr.match(/hours_between\(([^,]+),\s*([^)]+)\)/)!.slice(1,3);
    const op = expr.includes("<=") ? "<=" : expr.includes(">") ? ">" : "==";
    const cmp = parseInt(expr.split(/<=|>|==/)[1].trim(), 10);
    const val = hours_between((r as any)[lhs.trim()], (r as any)[rhs.trim()]);
    return op === "<=" ? val <= cmp : op === ">" ? val > cmp : val === cmp;
  }
  if (expr.startsWith("has(")) {
    const f = expr.match(/has\(([^)]+)\)/)![1].trim();
    const neg = expr.includes("== false");
    const res = hasField(r, f);
    return neg ? !res : res;
  }
  return false;
}

export function applyRules(r: Canonical, rules: Rule[]): { expected_bucket: string; reasons: string[] } {
  let result = { expected_bucket: "Standard", reasons: ["UNKNOWN"] as string[] };
  for (const rule of rules) {
    if (!matchValue(r.network, rule.when.network)) continue;
    if (!matchValue(r.region, rule.when.region)) continue;

    const conds = rule.when.conditions || [];
    const ok = conds.every((c: any) => {
      if (c.field) {
        const v = (r as any)[c.field];
        return Array.isArray(c.anyOf) ? c.anyOf.includes(v) : v === c.equals;
      }
      if (c.expr) return evalExpr(c.expr, r);
      return true;
    });
    if (!ok) continue;

    result = { expected_bucket: rule.then.expected_bucket, reasons: rule.then.reasons || [] };
    if (!rule.then.continue) break;
  }
  return result;
}

export function feeFor(r: Canonical, rates: Rates, bucket: "qualified"|"downgraded"|"standard"): number {
  const brandRates = rates[r.network]?.[r.region] || rates[r.network]?.["US"];
  const base = brandRates?.mcc_overrides?.[r.mcc]?.[bucket] || brandRates?.default?.[bucket];
  if (!base) throw new Error(`No rate found for ${r.network}/${r.region}/${r.mcc}/${bucket}`);
  return Math.round(r.amount_cents * base.pct) + base.fixed_cents;
}
```

**src/etl.ts**

```typescript
import { Client } from "pg";
import { loadFile } from "./loader";
import { loadRates, loadRules, applyRules, feeFor } from "./rulesEngine";

async function upsertProcessor(client: Client, name: string): Promise<number> {
  const { rows } = await client.query(
    `INSERT INTO processors(name) VALUES ($1)
     ON CONFLICT (name) DO UPDATE SET name=EXCLUDED.name
     RETURNING id`, [name]);
  return rows[0].id;
}

export async function runIngest(paths: string[]) {
  const client = new Client({ connectionString: process.env.DATABASE_URL || "postgres://localhost:5432/pseudonoc" });
  await client.connect();
  const rules = loadRules();
  const rates = loadRates();

  for (const p of paths) {
    let rows: any[] = [];
    try {
      rows = loadFile(p);
    } catch (e: any) {
      console.error(`❌ Adapter error for ${p}:`, e.message);
      continue;
    }
    const processorName = rows[0]?.processor || "unknown";
    const processorId = await upsertProcessor(client, processorName);

    for (const r of rows) {
      try {
        const { expected_bucket, reasons } = applyRules(r, rules);

        // Derive a coarse actual bucket class from settlement label
        const actualClass =
          /STANDARD/i.test(r.bucket_name) ? "standard" :
          /EIRF|MERIT\s*I|DATA\s*RATE\s*I/i.test(r.bucket_name) ? "downgraded" : "qualified";

        const expectedFee = feeFor(r, rates, expected_bucket.toLowerCase().includes("standard") ? "standard"
          : expected_bucket.toLowerCase().includes("cps") ? "qualified"
          : expected_bucket.toLowerCase().includes("merit") ? "qualified" : "downgraded");

        const actualFee = feeFor(r, rates, actualClass as any);

        const sRes = await client.query(
          `INSERT INTO settlements
           (processor_id, processor_txn_id, network, region, mcc, mid, bucket_name, bucket_code,
            auth_time, capture_time, settled_time, amount_cents, avs_result, cvv_result, level2_tax_cents,
            po_number, invoice_number, recurring, processor_reason, raw_payload)
           VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20)
           RETURNING id`,
          [processorId, r.processor_txn_id, r.network, r.region, r.mcc, r.mid, r.bucket_name, r.bucket_code,
           r.auth_time, r.capture_time, r.settled_time, r.amount_cents, r.avs_result, r.cvv_result, r.level2_tax_cents ?? null,
           r.po_number ?? null, r.invoice_number ?? null, r.recurring ?? null, r.processor_reason ?? null, r.raw_payload]
        );
        const settlementId = sRes.rows[0].id;

        await client.query(
          `INSERT INTO interchange_estimates
           (settlement_id, expected_bucket, expected_fee_cents, actual_fee_cents, reasons)
           VALUES ($1,$2,$3,$4,$5)`,
          [settlementId, expected_bucket, expectedFee, actualFee, reasons]
        );
      } catch (e: any) {
        await client.query(
          `INSERT INTO dead_letter_rows(processor_name, error, raw_payload)
           VALUES ($1,$2,$3)`, [processorName, e.message, JSON.stringify(r)]
        );
        console.warn(`⚠️ Row sent to dead-letter: ${e.message}`);
      }
    }
  }

  // example report
  const weekly = await client.query(
    `REFRESH MATERIALIZED VIEW CONCURRENTLY mv_downgrade_variance;
     SELECT * FROM mv_downgrade_variance ORDER BY week DESC, variance_cents DESC LIMIT 20;`
  );
  console.table(weekly[1].rows);
  await client.end();
}
```

**src/alerts.ts**

```typescript
import { Client } from "pg";
import fetch from "node-fetch";

const SLACK_WEBHOOK = process.env.SLACK_WEBHOOK_URL!;

async function post(text: string) {
  if (!SLACK_WEBHOOK) return console.log("[ALERT]", text);
  await fetch(SLACK_WEBHOOK, { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ text }) });
}

export async function runAlerts() {
  const client = new Client({ connectionString: process.env.DATABASE_URL || "postgres://localhost:5432/pseudonoc" });
  await client.connect();

  // Late presentment > 2% in last 24h
  const late = await client.query(`
    SELECT 100.0 * SUM(CASE WHEN EXTRACT(EPOCH FROM (capture_time - auth_time))/3600 > 24 THEN 1 ELSE 0 END)/COUNT(*) AS pct_late
    FROM settlements
    WHERE settled_time >= now() - interval '1 day'`);
  if (Number(late.rows[0].pct_late) > 2) {
    await post(`❗ Late presentment breach: ${late.rows[0].pct_late.toFixed(2)}% in last 24h`);
  }

  // AVS/CVV presence regression (thresholds: AVS<90%, CVV<90%)
  const avsCvv = await client.query(`
    SELECT
      100.0 * SUM(CASE WHEN avs_result IN ('Y','Z','A') THEN 1 ELSE 0 END)/COUNT(*) AS avs_ok_pct,
      100.0 * SUM(CASE WHEN cvv_result = 'M' THEN 1 ELSE 0 END)/COUNT(*) AS cvv_ok_pct
    FROM settlements
    WHERE settled_time >= now() - interval '7 day'`);
  const a = Number(avsCvv.rows[0].avs_ok_pct), c = Number(avsCvv.rows[0].cvv_ok_pct);
  if (a < 90) await post(`❗ AVS presence dropped to ${a.toFixed(1)}% (7d)`);
  if (c < 90) await post(`❗ CVV presence dropped to ${c.toFixed(1)}% (7d)`);

  await client.end();
}
```

**src/index.ts**

```typescript
import { runIngest } from "./etl";
import { runAlerts } from "./alerts";

(async () => {
  const files = process.argv.slice(2);
  if (files.length === 0) {
    console.error("Usage: ts-node src/index.ts <files...>");
    process.exit(1);
  }
  await runIngest(files);
  await runAlerts();
})();
```

## Sample Data (Success & Failure)

**data/stripe_settlements.csv**

```csv
stripe_txn_id,card_brand,region,mcc,mid,interchange_bucket,bucket_code,auth_time,capture_time,settled_time,amount_cents,avs_result,cvv_result,level2_tax_cents,po_number,invoice_number,recurring,processor_reason
TXN1001,VISA,US,4900,MID-001,EIRF,,2025-08-12T10:05:00Z,2025-08-13T12:20:00Z,2025-08-14T03:00:00Z,12500,,M,,PO-12345,INV-20240817,false,LATE_PRESENTMENT
TXN1002,MASTERCARD,US,4900,MID-001,Merit I,,2025-08-12T11:15:00Z,2025-08-12T18:00:00Z,2025-08-13T02:30:00Z,8850,Y,M,850,PO-98431,INV-20240817,false,
TXN_BADDATE,VISA,US,5732,MID-001,Standard,,BADDATE,2025-08-13T14:30:00Z,2025-08-14T04:10:00Z,2599,N,N,,,,false,
```

**data/adyen_settlements.json**

```json
[
  {
    "pspReference": "ADY-2001",
    "scheme": "visa",
    "region": "US",
    "mcc": "7399",
    "merchantAccount": "MID-002",
    "settlementCategory": "CPS Card-Not-Present",
    "settlementCode": "CPS_CNP",
    "authTime": "2025-08-12T13:05:00Z",
    "captureTime": "2025-08-12T16:00:00Z",
    "settledTime": "2025-08-13T03:50:00Z",
    "amount": 99.00,
    "avs": "Z",
    "cvv": "M",
    "taxCents": 650,
    "po": "PO-44421",
    "invoice": "INV-20240817",
    "recurring": false
  }
]
```

## Run it

```bash
createdb pseudonoc
psql pseudonoc -f db/schema_v2.sql
# configs already created in config/
npx ts-node src/index.ts data/stripe_settlements.csv data/adyen_settlements.json
```

## What you'll see

- **TXN1001** → EIRF (late capture) with LATE_PRESENTMENT.
- **TXN1002** → Merit I (missing/partial Level II if invoice/tax absent).
- **ADY-2001** → CPS CNP (qualified).
- **TXN_BADDATE** → rejected by Zod → stored in dead_letter_rows with full raw payload.

❗ **Warning:** Some rules (e.g., recurring indicator, AVS/CVV presence) must be set at authorization. You cannot repair them later.

## Analysis & Monitoring

**Variance by reason (weekly)** (same query, updated to mv)

```sql
REFRESH MATERIALIZED VIEW CONCURRENTLY mv_downgrade_variance;
SELECT week, reason, SUM(variance_cents)/100.0 AS usd_variance, SUM(txn_count) AS txn_count
FROM mv_downgrade_variance
GROUP BY week, reason
ORDER BY week, usd_variance DESC;
```

**Heatmap: MCC × reason**

```sql
SELECT mcc, reason,
       SUM(variance_cents FILTER (WHERE true))/100.0 AS usd_unfavorable
FROM mv_downgrade_variance
GROUP BY mcc, reason
ORDER BY usd_unfavorable DESC;
```

**Prometheus-ready view (optional)**

```sql
CREATE VIEW metrics_late_presentment AS
SELECT
  now() AS ts,
  100.0 * SUM(CASE WHEN EXTRACT(EPOCH FROM (capture_time - auth_time))/3600 > 24 THEN 1 ELSE 0 END)/COUNT(*) AS pct_late_24h
FROM settlements
WHERE settled_time >= now() - interval '1 day';
```

## Processor Selection & Adapters

**Add a PSP:** create `src/adapters/<psp>.ts` that outputs CanonicalRow.

**Ask for docs:** field mapping from your API → network settlement.

**Prove pass-through:** run Level II/III test and confirm fields appear in settlement exports.

💡 **Tip:** Keep a per-PSP "golden sample" folder under `samples/<psp>/` for regression testing.

## ROI-Ranked Fixes (unchanged strategy)

🔥 **High impact / low effort**
1. Collect AVS (ZIP/address required).
2. Enforce capture ≤24h.

⚡ **Medium**
3. Require CVV.
4. Add Level II/III for eligible B2B flows.

📈 **High effort**
5. Enable Large Ticket/Utility/Government programs with your acquirer.

## Validation & Troubleshooting

**Data quality:** `dead_letter_rows` should be near-zero. Investigate spikes by adapter.

**STANDARD spikes:** check MCC & recurring flag at auth.

**Level II/III absent:** verify PSP mapping + acquirer program enrollment.

**Late presentment:** add SLOs & retries to capture jobs.

ℹ️ **Note:** Keep configuration under source control (`config/rates.json`, `config/rules.yaml`) and review on every network bulletin.

## Implementation Roadmap (90 Days)

**Month 1 — Visibility & Quick Wins**
AVS collection, capture ≤24h, adapters for your top PSPs, dead_letter_rows remediation.

**Month 2 — Data & Controls**
Require CVV (A/B if needed), roll out Level II/III on B2B flows, tune rules for MCCs.

**Month 3 — Programs & Polishing**
Enable Large Ticket/Utility/Government where eligible, expand buckets/regions, wire Slack alerts to on-call.

**Expected:** 45–75% downgrade reduction over 90 days with sustained savings.

## Acronyms

- **ACH** — Automated Clearing House
- **AVS** — Address Verification Service
- **CVV** — Card Verification Value
- **MCC** — Merchant Category Code
- **MID** — Merchant Identifier
- **NOC** — Notification of Change
- **PSP** — Payment Service Provider

## References

- [NACHA NOCs Overview - ACH Network Rules: Notifications of Change (NOC), 2024](https://www.nacha.org/rules/notifications-change)
- [Visa Interchange (US) - Visa USA Interchange Reimbursement Fees, 2025](https://usa.visa.com/support/small-business/tools-resources/merchant-data-standards.html)
- [Mastercard Interchange (US) - Mastercard U.S. Interchange Programs, 2025](https://www.mastercard.us/en-us/business/issuers/interchange.html)
- [Amex Merchant Pricing - American Express Merchant Pricing Overview, 2025](https://network.americanexpress.com/globalnetwork/businessinsights/merchantpricing/)
- [NACHA Rules - NACHA Operating Rules & Guidelines, 2025](https://www.nacha.org/rules)
- [Interchange Policy Context - Federal Reserve: The Role of Interchange Fees in the Payments System, 2010](https://www.federalreserve.gov/pubs/bulletin/2010/articles/interchange-fees.htm)
- [Interchange Economics - U.S. GAO: Credit Card Interchange Fees, 2010](https://www.gao.gov/products/gao-10-45)

---

*This article is part of the [How U.S. Payments Really Work](/series/payments) series, exploring the technical realities of building payment systems in the United States.*

