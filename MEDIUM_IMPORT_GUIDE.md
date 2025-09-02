# Medium Import Guide for BuildTales

This guide provides step-by-step instructions for importing BuildTales articles to Medium using the new clean permalink structure.

## New URL Structure

All articles now use clean, Medium-friendly URLs:

**Before (Old URLs):**
- `/fintech/payments/2025/08/13/money-flow-bank-account.html`
- `/fintech/systems/2025/08/28/publish-subscribe-pattern-software-architecture.html`

**After (New URLs):**
- `/money-flow-bank-account/`
- `/publish-subscribe-pattern-software-architecture/`

## Article Permalink Mapping

### ACH Series
- Money Flow: `/money-flow-bank-account/`
- Wire Transfers: `/wire-transfers-explained/`
- NACHA Files: `/nacha-file-demystified/`
- SEC Codes: `/sec-codes-authorization-boss-level/`
- Correction Codes: `/ach-correction-codes-fix-log-prove/`
- ACH Good/Bad/Ugly: `/ach-good-bad-ugly/`
- Returns Guide: `/ach-returns-compliance-survival-guide/`
- Cutoffs: `/ach-cutoffs-hidden-clock-breaks-ux/`
- Limits & Scale: `/ach-limits-scale-surviving-entry-file-dollar-caps/`
- Retries: `/ach-retries-designing-safe-compliant-retry-engine/`
- Dishonored Returns: `/handling-dishonored-contested-returns/`
- File Reversals: `/surviving-ach-file-reversals-em/`
- Missing Data: `/handling-ach-returns-missing-broken-data/`
- File Resubmission: `/inevitable-handling-missed-entries-file-resubmission/`
- Trace IDs: `/tracking-ach-trace-ids-yours-theirs-feds/`
- Wrong File: `/day-submitted-wrong-ach-file-personal-tale/`
- Returns Monitoring: `/ach-returns-corrections-threshold-monitoring-engineering-leaders/`
- Audit Guide: `/surviving-ach-audit-engineering-managers-guide/`
- Legal Risk: `/working-legal-risk-stay-within-ach-thresholds/`
- Legal Risk Core: `/building-legal-risk-core/`
- Third Party Senders: `/designing-systems-third-party-senders-service-providers/`
- Ghost Reconciliation: `/reconciling-like-ghost-ach-ops-third-party-service-providers/`
- EPN vs FedACH: `/epn-vs-fedach-operational-deep-dive-efficiency-comparison/`
- Recurring Payments: `/recurring-payments-silent-beast-subscription-infrastructure/`
- Recurring Audits: `/recurring-payments-ach-audits-engineering-long-term-compliance/`
- Cutoffs Revisited: `/ach-cutoffs-revisited-scheduling-systems/`
- Refunds Revisited: `/ach-refunds-revisited-lifecycle-integrity/`

### Payments Series
- Credit Cards: `/credit-cards-swipe-smile-settle-later/`
- Chargebacks & 3DS: `/money-flows-chargebacks-rails-leaders-guide-3d-secure/`
- Interchange Reconciliation: `/failure-modes-interchange-fee-reconciliation/`
- Card Networks: `/why-card-networks-dont-have-nocs-downgrade-feedback-loop/`
- Wallets & P2P: `/wallets-p2p-networks-venmo-cash-app-paypal-zelle/`
- RTP: `/rtp-real-time-payments-real-world-bottlenecks/`
- FedNow: `/fednow-built-by-fed-moving-like-fed/`
- Recurring Infrastructure: `/recurring-payments-silent-beast-subscription-infrastructure/`
- UPI Integration: `/upi-integration-developer/`
- UPI Comparison: `/upi-vs-fednow-vs-rtp-developer-centric-comparison/`

### Systems Series
- Pub/Sub Pattern: `/publish-subscribe-pattern-software-architecture/`
- Bulkheading: `/bulkheading-daemons-jobs-rails/`
- Rails Failures: `/why-rails-apps-fail-production-ach-teaches-us/`
- Stability Patterns: `/stability-patterns-every-rails-fintech-engineer-should-know/`
- Third Party Systems: `/designing-systems-third-party-senders-service-providers/`

### Leadership Series
- EM Baptism: `/quarter-long-project-em-baptism/`
- Building Teams: `/breaking-builds-to-building-teams/`
- Compliance Survival: `/engineering-leaders-survival-guide-compliance/`
- Reg E & UDAAP: `/reg-e-udaap-engineering-leaders-playbook/`

### Tools Series
- Cursor Pro: `/cursor-pro-zero-expert/`
- Cursor API Limits: `/optimizing-cursor-prompts-api-limits/`
- GitHub Copilot: `/github-copilot-ruby-zero-hero/`

### Crypto Series
- Stablecoins: `/stablecoins-crypto-rails-new-instant-settlement-layer/`
- DeFi Infrastructure: `/defi-infrastructure-protocols-liquidity-future-money-movement/`
- On/Off Ramps: `/on-off-ramp-infrastructure-bridging-tradfi-crypto/`

## Import Process

### 1. Prepare Articles for Medium

Each article should include:
- Clean title (without date prefixes)
- Full content with proper formatting
- Author attribution: "Suma Manjunath"
- Original source link: "Originally published on [BuildTales.dev](https://buildtales.dev/[permalink])"
- Proper tags based on content category

### 2. Medium Import Settings

**Canonical URL:** Set to the new BuildTales permalink
**Import Source:** BuildTales.dev
**Author:** Suma Manjunath
**Publication:** Your Medium publication (if applicable)

### 3. Content Formatting

- Preserve all code blocks with proper syntax highlighting
- Maintain Mermaid diagrams (convert to images if needed)
- Keep internal links updated to new permalinks
- Ensure proper heading hierarchy
- Preserve callouts and warning boxes

### 4. SEO Optimization

- Use descriptive titles
- Add relevant tags
- Include proper meta descriptions
- Optimize for Medium's search algorithm

## Redirect Verification

After deployment, verify that all old URLs redirect properly:

```bash
# Test redirects locally
curl -I "http://localhost:4000/fintech/payments/2025/08/13/money-flow-bank-account.html"
# Should return 301 redirect to /money-flow-bank-account/

# Test new URLs
curl -I "http://localhost:4000/money-flow-bank-account/"
# Should return 200 OK
```

## Benefits of New Structure

1. **Medium-Friendly:** Clean URLs that work well with Medium's import system
2. **SEO Optimized:** Shorter, more memorable URLs
3. **Redirects Preserved:** All existing links continue to work
4. **Consistent Format:** Uniform structure across all articles
5. **Easy Maintenance:** Simple to manage and update

## Troubleshooting

### Common Issues

1. **Redirects Not Working:** Ensure `_redirects` file is included in build
2. **Jekyll Build Errors:** Check for malformed front matter
3. **Missing Articles:** Verify all articles have permalink front matter
4. **Medium Import Failures:** Check canonical URLs and content formatting

### Support

For issues with:
- **Permalinks:** Check article front matter
- **Redirects:** Verify `_redirects` file configuration
- **Medium Import:** Review content formatting and canonical URLs
- **Build Process:** Check Jekyll configuration and plugins

## Next Steps

1. **Test Locally:** Run `bundle exec jekyll serve` to verify changes
2. **Deploy:** Push changes to production
3. **Verify Redirects:** Test old URLs redirect to new ones
4. **Import to Medium:** Use new permalinks for Medium import
5. **Monitor:** Check analytics for any broken links

## File Structure

```
buildtales/
├── _config.yml          # Updated permalink configuration
├── _redirects           # Comprehensive redirect rules
├── _posts/              # Articles with permalink front matter
├── add_permalinks.py    # Script to add permalinks (can be removed after use)
└── MEDIUM_IMPORT_GUIDE.md # This guide
```

All articles now have clean, Medium-friendly URLs while maintaining full backward compatibility through redirects.
