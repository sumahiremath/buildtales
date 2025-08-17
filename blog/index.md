---
layout: default
title: "Posts"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Posts</h1>
  
  <!-- Filter Chips -->
  <div class="flex gap-2 mb-6">
    <a class="chip chip--active" href="/blog">All</a>
    <a class="chip" href="/blog?tag=payments">Payments</a>
    <a class="chip" href="/blog?tag=leadership">Leadership</a>
    <a class="chip" href="/blog?tag=systems">Systems</a>
  </div>

  <!-- Posts Grid - Finshots Style -->
  <div class="posts-grid">
    {% for post in site.posts %}
    <article class="post-card">
      <div class="post-meta">
        <span class="post-date">{{ post.date | date: "%b %d, %Y" }}</span>
        {% if post.series.name %}
        <span class="post-series">{{ post.series.name }} Part {{ post.series.part }}</span>
        {% endif %}
      </div>
      
      <h2 class="post-title">
        <a href="{{ post.url }}">{{ post.title }}</a>
      </h2>
      
      <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
      
      <div class="post-footer">
        {% if post.categories %}
        <div class="post-categories">
          {% for category in post.categories %}
          <span class="category-tag">{{ category | capitalize }}</span>
          {% endfor %}
        </div>
        {% endif %}
      </div>
    </article>
    {% endfor %}
  </div>
</div>

<style>
/* Finshots-inspired blog styling */

.posts-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  margin-top: 2rem;
}

.post-card {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 1.5rem;
  transition: all 0.2s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.post-card:hover {
  border-color: var(--accent);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transform: translateY(-1px);
}

.post-meta {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 0.75rem;
}

.post-date {
  font-size: 0.875rem;
  color: #6b7280;
  font-weight: 500;
}

.post-series {
  font-size: 0.75rem;
  background: #f3f4f6;
  color: #374151;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-weight: 500;
}

.post-title {
  margin: 0 0 0.75rem 0;
  font-size: 1.25rem;
  font-weight: 600;
  line-height: 1.3;
}

.post-title a {
  color: #111827;
  text-decoration: none;
  transition: color 0.2s ease;
}

.post-title a:hover {
  color: var(--accent);
}

.post-excerpt {
  color: #4b5563;
  line-height: 1.6;
  margin: 0 0 1rem 0;
  font-size: 0.95rem;
}

.post-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 0.75rem;
  border-top: 1px solid #f3f4f6;
}

.post-categories {
  display: flex;
  gap: 0.5rem;
}

.category-tag {
  font-size: 0.75rem;
  background: #e0f2fe;
  color: #0369a1;
  padding: 0.25rem 0.5rem;
  border-radius: 12px;
  font-weight: 500;
}

/* Filter chips styling */
.flex {
  display: flex;
}

.gap-2 {
  gap: 8px;
}

/* Responsive adjustments */
@media (max-width: 640px) {
  .post-card {
    padding: 1.25rem;
  }
  
  .post-title {
    font-size: 1.125rem;
  }
  
  .post-meta {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }
  
  .flex {
    flex-wrap: wrap;
  }
}
</style>