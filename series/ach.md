---
layout: default
title: ACH Series
---

# ACH (Automated Clearing House) Series

<!-- Table of Contents -->
<div class="toc-container">
  <h2 class="toc-title">Topics</h2>
  <nav class="toc-nav">
    <a href="#section-1" class="toc-link">ACH Fundamentals</a>
    <a href="#section-2" class="toc-link">ACH Operations & Compliance</a>
    <a href="#section-3" class="toc-link">Advanced ACH Concepts</a>
  </nav>
</div>

<!-- Series Articles -->
<div class="series-articles-container">
  {% assign ach_posts = site.posts | where_exp: "post", "post.categories contains 'ach'" | sort: 'date' %}
  
  <!-- ACH Fundamentals Section -->
  <section class="section-section" id="section-1">
    <h2 class="phase-title">ACH Fundamentals</h2>
    <p class="phase-description">Master the basics before you build. Understand how money actually moves through the ACH network.</p>
    
    <div class="articles-grid">
      {% for post in ach_posts %}
        {% if post.section contains 'Fundamentals' or post.section contains 'Understanding the Rails' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <!-- ACH Operations & Compliance Section -->
  <section class="section-section" id="section-2">
    <h2 class="phase-title">ACH Operations & Compliance</h2>
    <p class="phase-description">Where theory meets reality. Learn to handle the daily chaos of ACH operations while staying compliant.</p>
    
    <div class="articles-grid">
      {% for post in ach_posts %}
        {% if post.section contains 'Operations' or post.section contains 'Compliance' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <!-- Advanced Concepts Section -->
  <section class="section-section" id="section-3">
    <h2 class="phase-title">Advanced ACH Concepts</h2>
    <p class="phase-description">Push the boundaries of what's possible. Enterprise integrations, performance optimization, and cutting-edge ACH implementations.</p>
    
    <div class="articles-grid">
      {% for post in ach_posts %}
        {% if post.section contains 'Advanced' or post.section contains 'Enterprise' or post.section contains 'Performance' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>
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
.section-section {
  margin-bottom: 3rem;
}

.phase-title {
  font-size: 2rem;
  font-weight: 700;
  color: #111827;
  margin-bottom: 0.75rem;
  padding-bottom: 0.5rem;
  border-bottom: 2px solid #e5e7eb;
  font-family: 'Open Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

.phase-description {
  color: #4b5563;
  font-size: 1.125rem;
  margin-bottom: 1.5rem;
  line-height: 1.6;
  font-weight: 500;
  font-family: 'Open Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

/* Card Content Styling */
.card-content {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.article-title {
  font-size: 1.25rem;
  font-weight: 600;
  color: #111827;
  margin: 0;
  line-height: 1.4;
  font-family: 'Open Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

.article-date {
  color: #6b7280;
  font-size: 0.875rem;
  margin: 0;
}

/* Status Badge Styling */
.status-badge {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  border-radius: 9999px;
  font-size: 0.75rem;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  align-self: flex-start;
}

.status-badge.published {
  background: #d1fae5;
  color: #065f46;
}

.status-badge.draft {
  background: #fef3c7;
  color: #92400e;
}

.status-badge.future {
  background: #e0e7ff;
  color: #3730a3;
}

/* Responsive Design */
@media (max-width: 768px) {
  .toc-container {
    padding: 1.5rem;
    margin: 1.5rem 0 2rem 0;
  }
  
  .toc-title {
    font-size: 1.25rem;
  }
  
  .phase-title {
    font-size: 1.5rem;
  }
  
  .article-card {
    padding: 1.25rem;
  }
  
  .article-title {
    font-size: 1.125rem;
  }
}
</style>
