---
layout: default
title: "Series"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Series</h1>
  <p class="text-lg opacity-80 mb-8">Deep, structured explorations of complex topics. Perfect for building comprehensive understanding over time.</p>
  
  <!-- Featured Series -->
  <div class="series-grid">
    <a href="/series/payments" class="series-card available">
      <div class="series-card-header">
        <div class="series-meta">
          <span class="series-status active">Available Now</span>
          <span class="series-progress">3 of 12 articles</span>
        </div>
      </div>
      <h2 class="series-title"><span class="series-title-icon">🚀</span> How U.S. Payments Really Work</h2>
      <p class="series-description">A builder's guide to rails, risk, and reconciliation. Everything you need to understand, build, and scale payment systems in the United States.</p>
      <div class="series-actions">
        <span class="series-cta primary">Start Reading →</span>
        <span class="series-secondary">View Complete Series</span>
      </div>
    </a>
    
    <!-- Engineering Leadership Series -->
    <a href="/series/engineering-leadership" class="series-card available">
      <div class="series-card-header">
        <div class="series-meta">
          <span class="series-status active">Available Now</span>
          <span class="series-progress">1 of 13 articles</span>
        </div>
      </div>
      <h2 class="series-title"><span class="series-title-icon">⚡</span> Engineering Leadership: From IC to VP</h2>
      <p class="series-description">A comprehensive guide to scaling yourself, your team, and your organization through engineering leadership.</p>
      <div class="series-actions">
        <span class="series-cta primary">Start Reading →</span>
        <span class="series-secondary">View Complete Series</span>
      </div>
    </a>
    
    <!-- Future Series -->
    <div class="series-card coming-soon">
      <div class="series-card-header">
        <div class="series-meta">
          <span class="series-status upcoming">Coming Q2 2026</span>
          <span class="series-progress">15 articles planned</span>
        </div>
      </div>
      <h2 class="series-title"><span class="series-title-icon">🛡️</span> Systems Design at Scale</h2>
      <p class="series-description">Real-world architecture decisions, tradeoffs, and lessons learned from building systems that handle millions of transactions.</p>
      <div class="series-actions">
        <span class="series-cta disabled">Coming Soon</span>
      </div>
    </div>
    
    <div class="series-card coming-soon">
      <div class="series-card-header">
        <div class="series-meta">
          <span class="series-status upcoming">Coming Q3 2026</span>
          <span class="series-progress">18 articles planned</span>
        </div>
      </div>
      <h2 class="series-title"><span class="series-title-icon">🛡️</span> Systems Design at Scale</h2>
      <p class="series-description">Real-world architecture decisions, tradeoffs, and lessons learned from building systems that handle millions of transactions.</p>
      <div class="series-actions">
        <span class="series-cta disabled">Coming Soon</span>
      </div>
    </div>
  </div>
</div>

<style>
/* Series Grid Layout */
.series-grid {
  display: flex;
  flex-direction: column;
  gap: 2rem;
  margin-top: 2rem;
}

/* Series Card Base */
.series-card {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 16px;
  padding: 2rem;
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.series-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
  text-decoration: none;
}

.series-card.available {
  border-color: #157878;
}

.series-card.available:hover {
  box-shadow: 0 12px 24px rgba(21, 120, 120, 0.15);
}

.series-card.coming-soon {
  border-color: #d1d5db;
  opacity: 0.8;
}

/* Series Card Header */
.series-card-header {
  display: flex;
  justify-content: flex-end;
  align-items: flex-start;
  margin-bottom: 1.5rem;
}

.series-meta {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 0.25rem;
}

.series-status {
  font-size: 0.75rem;
  font-weight: 600;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.series-status.active {
  background: #d1fae5;
  color: #065f46;
}

.series-status.upcoming {
  background: #fef3c7;
  color: #92400e;
}

.series-progress {
  font-size: 0.875rem;
  color: #6b7280;
  font-weight: 500;
}

/* Series Content */
.series-title {
  font-size: 1.5rem;
  font-weight: 600;
  margin: 0 0 1rem 0;
  color: inherit;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.series-title-icon {
  font-size: 1.8rem;
  display: inline-flex;
  align-items: center;
}

.series-description {
  font-size: 1rem;
  line-height: 1.6;
  color: #4b5563;
  margin: 0 0 1.5rem 0;
  flex-grow: 1;
}

/* Series Actions */
.series-actions {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  align-items: flex-start;
}

.series-cta {
  font-size: 0.9rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.series-cta.primary {
  color: #157878;
  border-bottom: 2px solid transparent;
}

.series-card.available:hover .series-cta.primary {
  border-bottom-color: #157878;
}

.series-cta.disabled {
  color: #9ca3af;
  cursor: not-allowed;
}

.series-secondary {
  font-size: 0.8rem;
  color: #6b7280;
  font-weight: 500;
}

/* Mobile Responsive */
@media (max-width: 640px) {
  .series-card {
    padding: 1.5rem;
  }
  
  .series-card-header {
    justify-content: flex-start;
  }
  
  .series-meta {
    align-items: flex-start;
    flex-direction: row;
    gap: 1rem;
  }
  
  .series-title {
    font-size: 1.25rem;
    flex-direction: column;
    align-items: flex-start;
    gap: 0.25rem;
  }
  
  .series-title-icon {
    font-size: 1.5rem;
  }
}
</style>