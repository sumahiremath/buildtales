---
layout: default
title: "Series"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Series</h1>
  <p class="text-lg opacity-80 mb-8">Deep, structured explorations of complex topics. Perfect for building comprehensive understanding over time.</p>
  
  <!-- Featured Series -->
  <div class="space-y-6">
    <article class="card">
      <div class="flex flex-col gap-3">
        <div class="flex justify-between items-start">
          <h2 class="text-2xl font-semibold mb-2">
            <a href="/series/payments" style="text-decoration: none; color: #333;">How U.S. Payments Really Work</a>
          </h2>
          <span class="text-sm opacity-60">3 of 45 articles</span>
        </div>
        <p class="opacity-80">A builder's guide to rails, risk, and reconciliation. Everything you need to understand, build, and scale payment systems in the United States.</p>
        <div class="flex gap-3">
          <a class="btn-primary" href="/series/payments">View Series</a>
          <a class="btn-secondary" href="/fintech/payments/2025/08/13/money-flow-bank-account.html">Start Reading</a>
        </div>
      </div>
    </article>
    
    <!-- Future Series -->
    <article class="card">
      <div class="flex flex-col gap-3">
        <div class="flex justify-between items-start">
          <h2 class="text-2xl font-semibold mb-2">
            <span style="color: #666;">Engineering Leadership Patterns</span>
          </h2>
          <span class="text-sm opacity-60">Coming Q2 2026</span>
        </div>
        <p class="opacity-80">Practical patterns for scaling teams, systems, and culture. From your first tech lead role to VP of Engineering.</p>
        <div class="flex gap-3">
          <span class="btn-secondary" style="opacity: 0.5; cursor: not-allowed;">Coming Soon</span>
        </div>
      </div>
    </article>
    
    <article class="card">
      <div class="flex flex-col gap-3">
        <div class="flex justify-between items-start">
          <h2 class="text-2xl font-semibold mb-2">
            <span style="color: #666;">Systems Design at Scale</span>
          </h2>
          <span class="text-sm opacity-60">Coming Q3 2026</span>
        </div>
        <p class="opacity-80">Real-world architecture decisions, tradeoffs, and lessons learned from building systems that handle millions of transactions.</p>
        <div class="flex gap-3">
          <span class="btn-secondary" style="opacity: 0.5; cursor: not-allowed;">Coming Soon</span>
        </div>
      </div>
    </article>
  </div>
</div>

<style>
.flex {
  display: flex;
}

.flex-col {
  flex-direction: column;
}

.justify-between {
  justify-content: space-between;
}

.items-start {
  align-items: flex-start;
}

.gap-3 {
  gap: 12px;
}

.space-y-6 > * + * {
  margin-top: 24px;
}

.card a:hover {
  color: var(--accent);
}

@media (max-width: 640px) {
  .flex {
    flex-direction: column;
  }
  
  .btn-primary,
  .btn-secondary {
    width: 100%;
    text-align: center;
  }
}
</style>