---
layout: default
title: "How U.S. Payments Really Work"
permalink: /series/payments
---

<div class="mx-auto max-w-3xl">
  <header class="space-y-3 mb-8">
    <h1 class="text-4xl font-bold">How U.S. Payments Really Work</h1>
    <p class="text-lg opacity-80">A builder's guide to rails, risk, and reconciliation.</p>
    <a class="btn-primary" href="/subscribe">Get new parts by email</a>
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
        <li class="flex justify-between items-center p-4 border rounded-lg">
          <div>
            <a href="/fintech/payments/2025/08/13/money-flow-bank-account.html" class="font-medium text-accent">How Money Moves In And Out Of Your Bank Account?</a>
            <p class="text-sm opacity-70 mt-1">The foundational mechanics of money movement</p>
          </div>
          <span class="text-sm text-green-600 font-medium">✓ Published</span>
        </li>
        <li class="flex justify-between items-center p-4 border rounded-lg">
          <div>
            <a href="/fintech/payments/2025/08/14/wire-transfers-explained.html" class="font-medium text-accent">Wire Transfers: Old Money Energy</a>
            <p class="text-sm opacity-70 mt-1">When speed and finality matter most</p>
          </div>
          <span class="text-sm text-green-600 font-medium">✓ Published</span>
        </li>
        <li class="flex justify-between items-center p-4 border rounded-lg">
          <div>
            <a href="/fintech/payments/2025/08/20/ach-good-bad-ugly.html" class="font-medium text-accent">ACH: The Good, The Bad, and The Ugly</a>
            <p class="text-sm opacity-70 mt-1">Understanding America's payment backbone</p>
          </div>
          <span class="text-sm text-green-600 font-medium">✓ Published</span>
        </li>
        <li class="flex justify-between items-center p-4 border rounded-lg bg-gray-50">
          <div>
            <span class="font-medium text-gray-600">ACH Cutoffs: The Hidden Clock That Breaks Your UX</span>
            <p class="text-sm opacity-70 mt-1">Why timing matters in batch processing</p>
          </div>
          <span class="text-sm text-gray-500">Aug 27, 2025</span>
        </li>
        <li class="flex justify-between items-center p-4 border rounded-lg bg-gray-50">
          <div>
            <span class="font-medium text-gray-600">RTP: Real-Time Payments With Real-World Bottlenecks</span>
            <p class="text-sm opacity-70 mt-1">The promise and reality of instant payments</p>
          </div>
          <span class="text-sm text-gray-500">Sep 10, 2025</span>
        </li>
      </ol>
    </section>

    <!-- Phase 2: Coming Soon -->
    <section>
      <h3 class="text-lg font-semibold mb-4">Phase 2: Failure Modes</h3>
      <div class="p-4 border rounded-lg bg-gray-50">
        <p class="font-medium text-gray-600">Returns, Reversals & Retrying Safely</p>
        <p class="text-sm opacity-70 mt-1">8 articles covering what happens when payments go wrong</p>
        <span class="text-sm text-gray-500">Starting October 2025</span>
      </div>
    </section>

    <!-- Phase 3: Further Out -->
    <section>
      <h3 class="text-lg font-semibold mb-4">Upcoming Phases</h3>
      <div class="space-y-3">
        <div class="p-4 border rounded-lg bg-gray-50">
          <p class="font-medium text-gray-600">Phase 3: Resilience</p>
          <p class="text-sm opacity-70">Ops, audit, and legal alignment</p>
        </div>
        <div class="p-4 border rounded-lg bg-gray-50">
          <p class="font-medium text-gray-600">Phase 4: Complexity</p>
          <p class="text-sm opacity-70">TPS, partner access, and multi-entity ops</p>
        </div>
        <div class="p-4 border rounded-lg bg-gray-50">
          <p class="font-medium text-gray-600">Phase 5: Lifecycle</p>
          <p class="text-sm opacity-70">Recurring systems & revenue reliability</p>
        </div>
      </div>
    </section>
  </div>

  <!-- Subscribe Box -->
  <div class="card mt-8" style="background: #f8f9fa; border: 2px solid var(--accent);">
    <h3 class="text-lg font-semibold mb-3">Get New Articles by Email</h3>
    <p class="opacity-80 mb-4">Join 1,000+ engineers getting deep dives on payments, systems, and leadership. No spam, just quality content.</p>
    <a class="btn-primary" href="/subscribe">Subscribe Now</a>
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
    gap: 8px;
  }
  
  .justify-between {
    justify-content: flex-start;
  }
}
</style>
