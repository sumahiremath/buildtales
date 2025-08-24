---
layout: default
title: Systems & Architecture Series
---

# Systems & Architecture Series

<!-- Table of Contents -->
<div class="toc-container">
  <h2 class="toc-title">Topics</h2>
  <nav class="toc-nav">
    <a href="#section-1" class="toc-link">System Design Fundamentals</a>
    <a href="#section-2" class="toc-link">Scalability & Performance</a>
    <a href="#section-3" class="toc-link">Advanced Architecture Patterns</a>
    <a href="#section-4" class="toc-link">Distributed Systems & Microservices</a>
    <a href="#section-5" class="toc-link">Leveraging AI Tools</a>
  </nav>
</div>

<!-- Series Articles -->
<div class="series-articles-container">
  {% assign systems_posts = site.posts | where_exp: "post", "post.categories contains 'systems'" | sort: 'date' %}

  <!-- System Design Fundamentals Section -->
  <section class="section-section" id="section-1">
    <h2 class="phase-title">System Design Fundamentals</h2>
    <p class="phase-description">Core principles of system design, architecture patterns, and foundational concepts.</p>

    <div class="articles-grid">
      {% for post in systems_posts %}
        {% if post.section contains 'System Design Fundamentals' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <!-- Scalability & Performance Section -->
  <section class="section-section" id="section-2">
    <h2 class="phase-title">Scalability & Performance</h2>
    <p class="phase-description">Building scalable systems, performance optimization, and operational excellence.</p>

    <div class="articles-grid">
      {% for post in systems_posts %}
        {% if post.section contains 'Scalability & Performance' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <!-- Advanced Architecture Patterns Section -->
  <section class="section-section" id="section-3">
    <h2 class="phase-title">Advanced Architecture Patterns</h2>
    <p class="phase-description">Advanced patterns, distributed systems, and cutting-edge architectural approaches.</p>

    <div class="articles-grid">
      {% for post in systems_posts %}
        {% if post.section contains 'Advanced Architecture Patterns' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <!-- Distributed Systems & Microservices Section -->
  <section class="section-section" id="section-4">
    <h2 class="phase-title">Distributed Systems & Microservices</h2>
    <p class="phase-description">Designing distributed systems, microservices architecture, and service orchestration.</p>

    <div class="articles-grid">
      {% for post in systems_posts %}
        {% if post.section contains 'Distributed Systems & Microservices' %}
          {% include article_card.html post=post %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <!-- Leveraging AI Tools Section -->
  <section class="section-section" id="section-5">
    <h2 class="phase-title">Leveraging AI Tools</h2>
    <p class="phase-description">Integrating AI tools into system design, automation, and intelligent architectures.</p>

    <div class="articles-grid">
      {% for post in systems_posts %}
        {% if post.section contains 'Leveraging AI Tools' %}
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
}

.phase-description {
  color: #4b5563;
  font-size: 1.125rem;
  margin-bottom: 1.5rem;
  line-height: 1.6;
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
