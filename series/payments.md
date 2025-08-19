---
layout: series
title: "How U.S. Payments Really Work"
excerpt: "A builder's guide to rails, risk, and reconciliation. Everything you need to understand, build, and scale payment systems in the United States."
categories: [payments]
series:
  name: "How U.S. Payments Really Work"
  description: "A comprehensive guide to understanding how money moves through the U.S. financial system. From ACH and wire transfers to real-time payments and failure modes. Perfect for developers, product managers, and anyone building fintech applications."
  total_parts: 45
  benefits:
    - icon: "🏗️"
      title: "System Architecture"
      description: "Understand the complete payment infrastructure and how different systems interact."
    - icon: "⚡"
      title: "Real-World Implementation"
      description: "Learn from actual code examples and system designs used in production."
    - icon: "🛡️"
      title: "Risk Management"
      description: "Master the failure modes, edge cases, and safety mechanisms of payment systems."
    - icon: "📊"
      title: "Reconciliation"
      description: "Build robust systems that can track, trace, and reconcile every transaction."
---

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
