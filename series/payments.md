---
layout: default
title: "How U.S. Payments Really Work"
permalink: /series/payments
---
# How U.S. Payments Really Work

<!-- Table of Contents -->
<div class="toc-container">
  <h2 class="toc-title">📚 Table of Contents</h2>
  <nav class="toc-nav">
    <a href="#phase-1" class="toc-link">Phase 1: Understanding the Rails</a>
    <a href="#phase-2" class="toc-link">Phase 2: Failure Modes — Returns, Reversals, & Chaos</a>
    <a href="#phase-3" class="toc-link">Phase 3: Observability & Ops Strategy</a>
    <a href="#phase-4" class="toc-link">Phase 4: Multi-Client, Multi-Rail Complexity</a>
    <a href="#phase-5" class="toc-link">Phase 5: Recurring, Revenue, and Lifecycle Systems</a>
    <a href="#phase-6" class="toc-link">Phase 6: Modern Money Movement (Crypto & Global)</a>
  </nav>
</div>

<!-- Series Articles -->
<div class="series-articles-container">
  {% assign payments_posts = site.posts | where_exp: "post", "post.categories contains 'payments'" | sort: 'date' %}
  {% assign grouped_posts = payments_posts | group_by: "section" | sort: "name" %}
  
  {% for group in grouped_posts %}
    <section class="phase-section" id="phase-{{ forloop.index }}">
      <h2 class="phase-title">{{ group.name }}</h2>
      {% if group.name == "Phase 1: Understanding the Rails" %}
        <p class="phase-description">These articles ground the reader in how money moves and why rebuilding is even needed.</p>
      {% elsif group.name == "Phase 2: Failure Modes — Returns, Reversals, & Chaos" %}
        <p class="phase-description">Here we dive into what breaks, why it breaks, and how to prevent it.</p>
      {% elsif group.name == "Phase 3: Observability & Ops Strategy" %}
        <p class="phase-description">Time to get technical with ledger states, alerting, and team-level maturity.</p>
      {% elsif group.name == "Phase 4: Multi-Client, Multi-Rail Complexity" %}
        <p class="phase-description">Now that readers understand core movement + ops, we introduce third-party roles, ledger separation, and reconciliation at scale.</p>
      {% elsif group.name == "Phase 5: Recurring, Revenue, and Lifecycle Systems" %}
        <p class="phase-description">Now it's about customer lifecycle, recurring flows, and revenue resilience.</p>
      {% elsif group.name == "Phase 6: Modern Money Movement (Crypto & Global)" %}
        <p class="phase-description">Now shift to what comes next, or what we can learn from adjacent ecosystems.</p>
      {% endif %}
      
      <div class="articles-grid">
        {% for post in group.items %}
          {% assign current_date = site.time | date: "%s" %}
          {% assign post_date = post.date | date: "%s" %}
          
          {% if post.draft %}
            <div class="article-card draft-card">
              <div class="card-content">
                <h3 class="article-title">{{ post.title }}</h3>
                <p class="article-date">{{ post.date | date: "%B %d, %Y" }}</p>
                <span class="status-badge draft">Draft</span>
              </div>
            </div>
          {% elsif post_date > current_date %}
            <div class="article-card future-card">
              <div class="card-content">
                <h3 class="article-title">{{ post.title }}</h3>
                <p class="article-date">{{ post.date | date: "%B %d, %Y" }}</p>
                <span class="status-badge future">Coming Soon</span>
              </div>
            </div>
          {% else %}
            <a href="{{ post.url }}" class="article-card published-card">
              <div class="card-content">
                <h3 class="article-title">{{ post.title }}</h3>
                <p class="article-date">{{ post.date | date: "%B %d, %Y" }}</p>
                <span class="status-badge published">Published</span>
              </div>
            </a>
          {% endif %}
        {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>

<style>
/* Table of Contents */
.toc-container {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 12px;
  padding: 2rem;
  margin: 2rem 0 3rem 0;
}

.toc-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #111827;
  margin: 0 0 1.5rem 0;
  text-align: center;
}

.toc-nav {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.toc-link {
  display: block;
  padding: 0.75rem 1rem;
  background: white;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  color: #157878;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
}

.toc-link:hover {
  background: #f0fdf4;
  border-color: #157878;
  transform: translateX(4px);
}

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
  background: #f3f4f6;
  border-color: #9ca3af;
  opacity: 0.9;
  cursor: default;
}

.future-card:hover {
  background: #e5e7eb;
  border-color: #6b7280;
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
