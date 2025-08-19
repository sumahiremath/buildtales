---
layout: default
title: "Engineering Leadership & Systems Thinking"
excerpt: "Master the art of leading engineering teams while building scalable systems. From individual contributor to engineering manager to organizational leader."
permalink: /series/leadership-systems.html
categories: [leadership, systems]
---

{%- assign leadership_articles = site.posts | where_exp: "post", "post.categories contains 'leadership'" | sort: "date" -%}
{%- assign systems_articles = site.posts | where_exp: "post", "post.categories contains 'systems'" | sort: "date" -%}
{%- assign all_articles = leadership_articles | concat: systems_articles | uniq | sort: "date" -%}
{%- assign published = all_articles | where_exp: "post", "post.draft != true" -%}

<div class="mx-auto max-w-3xl">
  <header class="space-y-3 mb-8">
    <h1 class="text-4xl font-bold">Engineering Leadership & Systems Thinking</h1>
    <p class="text-lg opacity-80">From individual contributor to engineering manager to organizational leader.</p>
  </header>

  <!-- Series Progress -->
  <div class="card mb-8">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-semibold">Series Progress</h2>
      <span class="text-sm opacity-60">{{ published.size }} articles published</span>
    </div>
    <div style="background: #f0f0f0; height: 8px; border-radius: 4px; overflow: hidden;">
      <div style="background: var(--accent); height: 100%; width: 100%; border-radius: 4px;"></div>
    </div>
    <p class="text-sm opacity-60 mt-2">Updated weekly • Deep dives on leadership and systems thinking</p>
  </div>

  <!-- Table of Contents -->
  <h2 class="text-2xl font-semibold mb-6">Table of Contents</h2>
  
  <div class="space-y-6">
    <!-- Published Articles -->
    {% if published.size > 0 %}
    <section>
      <h3 class="text-lg font-semibold mb-4">Published Articles</h3>
      <ol class="space-y-3">
        {% for article in published %}
        <li>
          <a href="{{ article.url }}" class="published-article-link">
            <div class="flex justify-between items-center">
              <div class="flex-grow">
                <h4 class="font-medium text-accent article-title">{{ article.title }}</h4>
                {% if article.excerpt %}
                <p class="text-sm opacity-70 mt-2">{{ article.excerpt }}</p>
                {% endif %}
                <div class="flex gap-2 mt-2">
                  {% if article.categories contains 'leadership' %}
                  <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded">Leadership</span>
                  {% endif %}
                  {% if article.categories contains 'systems' %}
                  <span class="text-xs bg-green-100 text-green-800 px-2 py-1 rounded">Systems</span>
                  {% endif %}
                </div>
              </div>
              <span class="text-sm text-green-600 font-medium published-badge">{{ article.date | date: "%B %d, %Y" }}</span>
            </div>
          </a>
        </li>
        {% endfor %}
      </ol>
    </section>
    {% endif %}

    <!-- Upcoming Articles -->
    <section>
      <h3 class="text-lg font-semibold mb-4">Coming Soon</h3>
      <div class="space-y-3">
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">My Framework for 1:1s That Actually Help Career Growth</p>
          <p class="text-sm opacity-70">Transform routine check-ins into career acceleration conversations</p>
          <span class="text-sm text-gray-600 font-medium">September 2025</span>
        </div>
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">Incident Response Culture: Beyond the Postmortem</p>
          <p class="text-sm opacity-70">Building resilient teams that learn from failures</p>
          <span class="text-sm text-gray-600 font-medium">September 2025</span>
        </div>
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">How The Phoenix Project Changed the Way I Managed Projects</p>
          <p class="text-sm opacity-70">Applying DevOps principles to engineering management</p>
          <span class="text-sm text-gray-600 font-medium">October 2025</span>
        </div>
        <div class="p-4 unpublished-section">
          <p class="font-medium text-gray-700">Planning Multi-Quarter Roadmaps That Survive Contact With Reality</p>
          <p class="text-sm opacity-70">Strategic planning that adapts to changing business needs</p>
          <span class="text-sm text-gray-600 font-medium">October 2025</span>
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
