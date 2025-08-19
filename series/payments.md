---
layout: default
title: "How U.S. Payments Really Work"
permalink: /series/payments
---
# How U.S. Payments Really Work

<!-- Series Articles -->
<div class="series-articles-container">
  <h2 class="text-2xl font-semibold mb-6">Series Articles</h2>
  <div class="articles-grid">
    {% assign payments_posts = site.posts | where_exp: "post", "post.categories contains 'payments'" | sort: 'date' %}
    {% for post in payments_posts %}
      {% if post.draft %}
        <div class="article-card draft-card">
          <div class="card-content">
            <h3 class="article-title">{{ post.title }}</h3>
            <p class="article-date">{{ post.date | date: "%B %d, %Y" }}</p>
            <span class="status-badge draft">Draft</span>
          </div>
        </div>
      {% else %}
        <a href="{{ post.url }}" class="article-card published-card">
          <div class="card-content">
            <h3 class="article-title">{{ post.title }}</h3>
            <p class="article-date">{{ post.date | date: "%B %d, %Y" }}</p>
          </div>
        </a>
      {% endif %}
    {% endfor %}
  </div>
</div>

🧭 Phase 1: Orientation — Set the Stage

These articles ground the reader in how money moves and why rebuilding is even needed.

ACH: The Good, The Bad, and The Ugly

Credit Cards: Swipe, Smile, Settle Later

RTP: Real-Time Payments With Real-World Bottlenecks

FedNow: Built by the Fed. Moving Like the Fed

Wire Transfers: Old Money Energy

ACH Cutoffs: The Hidden Clock That Breaks Your UX

ACH Limits at Scale: Surviving Entry, File, and Dollar Caps

Goal: By the end, the reader knows the core rails, their constraints, and the invisible rules.

🔁 Phase 2: Failure Modes — Returns, Reversals, & Chaos

Here we dive into what breaks, why it breaks, and how to prevent it.

ACH Retries: Designing a Safe and Compliant Retry Engine

ACH Refunds: Designing a Compliant and Observable Return Flow

Handling Dishonored and Contested Returns

Surviving ACH File Reversals as an EM

Handling ACH Returns with Missing or Broken Data

The Inevitable: Handling Missed Entries and File Resubmission

Tracking ACH Trace IDs: Yours, Theirs, and the Fed’s

The Day I Submitted the Wrong ACH File (Personal tale for empathy + realism)

Goal: Readers now understand the full lifecycle of errors — and how to detect + mitigate them.

🔍 Phase 3: Observability & Ops Strategy

Time to get technical with ledger states, alerting, and team-level maturity.

ACH Returns, Corrections & Threshold Monitoring for Engineering Leaders

Surviving an ACH Audit: Engineering Manager’s Guide

Working with Legal & Risk to Stay Within ACH Thresholds

Building with Legal and Risk at the Core

Reg E & UDAAP: The Engineering Leader’s Playbook

Goal: Connect product behavior to legal, audit, and trust outcomes. Infra meets policy.

🧑‍💻 Phase 4: Multi-Client, Multi-Rail Complexity

Now that readers understand core movement + ops, we introduce third-party roles, ledger separation, and reconciliation at scale.

Designing Systems for Third-Party Senders & Service Providers

Reconciling Like a Ghost: ACH Ops for Third-Party Service Providers

EPN vs. FedACH: Operational Deep Dive & Efficiency Comparison

EPN Access for Fintechs: What You Need to Know

Can a Fintech Connect Directly to FedACH?

Goal: Get readers thinking about scaling clients, partnerships, and ops.

📆 Phase 5: Recurring, Revenue, and Lifecycle Systems

Now it’s about customer lifecycle, recurring flows, and revenue resilience.

Recurring Payments: The Silent Beast Behind Subscription Infrastructure

Recurring Payments & ACH Audits: Engineering for Long-Term Compliance

ACH Cutoffs (Revisited for scheduling systems)

ACH Refunds (Revisited for lifecycle integrity)

Goal: Payments is never one-and-done — it's systems that must live for years.

🌐 Phase 6: Modern Money Movement (Crypto & Global)

Now shift to what comes next, or what we can learn from adjacent ecosystems.

Stablecoins & Crypto Rails: The New Instant Settlement Layer?

DeFi Infrastructure: Protocols, Liquidity, and the Future of Money Movement

On/Off-Ramp Infrastructure: Bridging TradFi and Crypto

UPI Integration as a Developer

UPI vs FedNow vs RTP: Developer-Centric Comparison

🎯 Optional Final Chapter: Vision, Patterns, and Observability

These are future or in-progress suggestions you can write next to wrap the series:

🧠 What to Log, Alert, and Visualize in Payments Infra

🕓 ACH is Not Atomic: Designing Systems That Survive Asynchronous Truth

⏱ How Long Does Money Actually Take? Modeling Settlement Timelines

🔁 Rebuilding State: How to Backfill, Retry, or Reconcile at Scale

<div class="mx-auto max-w-3xl">
  <header class="space-y-3 mb-8">
    <h1 class="text-4xl font-bold">How U.S. Payments Really Work</h1>
    <p class="text-lg opacity-80">A builder's guide to rails, risk, and reconciliation.</p>
  </header>

  <!-- Series Progress -->
  <div class="card mb-8">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-semibold">Series Progress</h2>
      <span class="text-sm opacity-60">3 of 45 articles</span>
    </div>
    <div style="background: #f0f0f0; height: 8px; border-radius: 4px; overflow: hidden;">
      <div style="background: var(--accent); height: 100%; width: 7%; border-radius: 4px;"></div>
    </div>
    <p class="text-sm opacity-60 mt-2">Updated weekly • Expected completion Q3 2026</p>
  </div>

  <!-- Table of Contents -->
<h2 class="text-2xl font-semibold mb-6">Table of Contents</h2>

  <div class="space-y-6">
    <!-- Phase 1: Published Articles -->
    <section>
      <h3 class="text-lg font-semibold mb-4">Phase 1: Understanding the Rails</h3>
      <ol class="space-y-3">
        <li>
          <a href="/fintech/payments/2025/08/13/money-flow-bank-account.html" class="published-article-link">
            <div class="flex justify-between items-center">
              <div class="flex-grow">
                <h4 class="font-medium text-accent article-title">How Money Moves In And Out Of Your Bank Account?</h4>
                <p class="text-sm opacity-70 mt-2">The foundational mechanics of money movement</p>
              </div>
              <span class="text-sm text-green-600 font-medium published-badge">✓ Published</span>
            </div>
          </a>
        </li>
        <li>
          <a href="/fintech/payments/2025/08/14/wire-transfers-explained.html" class="published-article-link">
            <div class="flex justify-between items-center">
              <div class="flex-grow">
                <h4 class="font-medium text-accent article-title">Wire Transfers: Old Money Energy</h4>
                <p class="text-sm opacity-70 mt-2">When speed and finality matter most</p>
              </div>
              <span class="text-sm text-green-600 font-medium published-badge">✓ Published</span>
            </div>
          </a>
        </li>
        <li>
          <a href="/fintech/payments/2025/08/20/ach-good-bad-ugly.html" class="published-article-link">
            <div class="flex justify-between items-center">
              <div class="flex-grow">
                <h4 class="font-medium text-accent article-title">ACH: The Good, The Bad, and The Ugly</h4>
                <p class="text-sm opacity-70 mt-2">Understanding America's payment backbone</p>
              </div>
              <span class="text-sm text-green-600 font-medium published-badge">✓ Published</span>
            </div>
          </a>
        </li>
        <li class="unpublished-article">
          <div class="flex justify-between items-center">
            <div class="flex-grow">
              <h4 class="font-medium text-gray-700 article-title">ACH Cutoffs: The Hidden Clock That Breaks Your UX</h4>
              <p class="text-sm opacity-70 mt-2">Why timing matters in batch processing</p>
            </div>
            <span class="text-sm text-gray-600 font-medium">Aug 27, 2025</span>
          </div>
        </li>
        <li class="unpublished-article">
          <div class="flex justify-between items-center">
            <div class="flex-grow">
              <h4 class="font-medium text-gray-700 article-title">RTP: Real-Time Payments With Real-World Bottlenecks</h4>
              <p class="text-sm opacity-70 mt-2">The promise and reality of instant payments</p>
            </div>
            <span class="text-sm text-gray-600 font-medium">Sep 10, 2025</span>
          </div>
        </li>
      </ol>
    </section>

    <!-- Phase 2: Coming Soon -->
    <section>
      <h3 class="text-lg font-semibold mb-4">Phase 2: Failure Modes</h3>
      <div class="p-4 unpublished-section">
        <p class="font-medium text-gray-700">Returns, Reversals & Retrying Safely</p>
        <p class="text-sm opacity-70 mt-1">8 articles covering what happens when payments go wrong</p>
        <span class="text-sm text-gray-600 font-medium">Starting October 2025</span>
      </div>
    </section>

    <!-- Phase 3: Further Out -->
    <section>
      <h3 class="text-lg font-semibold mb-4">Upcoming Phases</h3>
      <div class="space-y-3">
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">Phase 3: Resilience</p>
          <p class="text-sm opacity-70">Ops, audit, and legal alignment</p>
        </div>
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">Phase 4: Complexity</p>
          <p class="text-sm opacity-70">TPS, partner access, and multi-entity ops</p>
        </div>
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">Phase 5: Lifecycle</p>
          <p class="text-sm opacity-70">Recurring systems & revenue reliability</p>
        </div>
      </div>
    </section>
  </div>
</div>

<style>
/* Series Articles Cards */
.series-articles-container {
  margin-bottom: 3rem;
}

.articles-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  margin-top: 1.5rem;
}

.article-card {
  background: white;
  border-radius: 12px;
  padding: 1.5rem;
  text-decoration: none;
  color: inherit;
  transition: all 0.2s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  border: 2px solid transparent;
}

.article-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

/* Published Card Styling */
.published-card {
  border-color: #157878;
}

.published-card:hover {
  border-color: #0f5a5a;
  background: #f8fffe;
}

/* Draft Card Styling */
.draft-card {
  background: #f9fafb;
  border-color: #d1d5db;
  opacity: 0.8;
  cursor: default;
}

.draft-card:hover {
  background: #f3f4f6;
  border-color: #9ca3af;
}

/* Future Card Styling */
.future-card {
  background: #fef3c7;
  border-color: #f59e0b;
  opacity: 0.9;
  cursor: default;
}

.future-card:hover {
  background: #fde68a;
  border-color: #d97706;
}

/* Phase Section Styling */
.phase-section {
  margin-bottom: 3rem;
}

.phase-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #111827;
  margin: 0 0 0.75rem 0;
  line-height: 1.3;
}

.phase-description {
  font-size: 1rem;
  color: #6b7280;
  margin: 0 0 1.5rem 0;
  line-height: 1.6;
  max-width: 800px;
}

/* Card Content */
.card-content {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.article-title {
  margin: 0;
  font-size: 1.125rem;
  font-weight: 600;
  line-height: 1.4;
  color: #111827;
}

.published-card .article-title {
  color: #157878;
}

.draft-card .article-title {
  color: #6b7280;
  font-style: italic;
}

.article-date {
  margin: 0;
  font-size: 0.875rem;
  color: #6b7280;
  font-weight: 500;
}

.published-card .article-date {
  color: #059669;
}

.draft-card .article-date {
  color: #9ca3af;
  font-style: italic;
}

/* Date Styling */
.published-date {
  color: #059669;
  font-weight: 500;
}

.draft-date {
  color: #6b7280;
  font-style: italic;
}

/* Title Styling */
.published-title {
  color: #157878;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.2s ease;
}

.published-title:hover {
  color: #0f5a5a;
  text-decoration: underline;
}

.draft-title {
  color: #6b7280;
  font-style: italic;
}

/* Status Badge Styling */
.status-badge {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.status-badge.published {
  background: #d1fae5;
  color: #065f46;
}

.status-badge.draft {
  background: #f3f4f6;
  color: #6b7280;
}

.status-badge.future {
  background: #fef3c7;
  color: #92400e;
}

/* Responsive Table */
@media (max-width: 768px) {
  .series-table {
    font-size: 0.875rem;
  }
  
  .series-table th,
  .series-table td {
    padding: 0.75rem 0.5rem;
  }
  
  .series-table th:nth-child(3),
  .series-table td:nth-child(3) {
    display: none; /* Hide status column on mobile */
  }
}

.space-y-3 > * + * {
  margin-top: 12px;
}

.space-y-6 > * + * {
  margin-top: 24px;
}

.text-accent {
  color: var(--accent);
  text-decoration: none;
}

.text-accent:hover {
  text-decoration: underline;
}

.text-green-600 {
  color: #16a34a;
}

.text-gray-600 {
  color: #4b5563;
}

.text-gray-500 {
  color: #6b7280;
}

.bg-gray-50 {
  background-color: #f9fafb;
}

/* Published Article Styling - Entire Card Clickable */
.published-article-link {
  display: block;
  border: 2px solid #157878;
  border-radius: 8px;
  background-color: white;
  padding: 1.5rem;
  text-decoration: none;
  color: inherit;
  transition: all 0.2s ease;
}

.published-article-link:hover {
  border-color: #0f6b6b;
  background-color: #f8fffe;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(21, 120, 120, 0.15);
  text-decoration: none;
}

.published-article-link .article-title {
  color: #157878;
  transition: color 0.2s ease;
}

.published-article-link:hover .article-title {
  color: #0f6b6b;
}

/* Unpublished Article Styling - Clear but Minimalistic */
.unpublished-article {
  border: 2px solid #d1d5db;
  border-radius: 8px;
  background-color: #f9fafb;
  padding: 1.5rem;
  transition: all 0.2s ease;
}

.unpublished-article:hover {
  border-color: #9ca3af;
  background-color: #f3f4f6;
}

/* Spacing improvements */
.article-title {
  margin: 0;
  line-height: 1.4;
}

.published-badge {
  margin-left: 1rem;
  white-space: nowrap;
}

.unpublished-section {
  border: 2px solid #d1d5db;
  border-radius: 8px;
  background-color: #f9fafb;
  transition: all 0.2s ease;
}

.unpublished-section:hover {
  border-color: #9ca3af;
}

.flex {
  display: flex;
}

.justify-between {
  justify-content: space-between;
}

.items-center {
  align-items: center;
}

@media (max-width: 640px) {
  .flex {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
  }
  
  .justify-between {
    justify-content: flex-start;
  }
  
  .published-article-link,
  .unpublished-article {
    padding: 1.25rem;
  }
  
  .published-badge {
    margin-left: 0;
    margin-top: 0.5rem;
  }
}
</style>
