---
layout: default
title: "Articles"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Articles</h1>
  
  <!-- Tag/Category Clouds -->
  <section class="mb-8">
    <h2 class="text-2xl font-semibold mb-4">Explore by Topic</h2>
    <div class="tag-cloud-container">
      {% assign all_categories = '' | split: '' %}
      {% assign all_posts = site.posts | concat: site.payments | concat: site.ach | concat: site.leadership | concat: site.system %}
      {% for post in all_posts %}
        {% for category in post.categories %}
          {% assign all_categories = all_categories | push: category %}
        {% endfor %}
      {% endfor %}
      
      {% assign unique_categories = all_categories | uniq %}
      {% for category in unique_categories limit: 12 %}
        {% assign category_count = all_categories | where_exp: "cat", "cat == category" | size %}
        {% assign font_size = category_count | times: 3 | plus: 14 %}
        {% assign opacity = category_count | times: 15 | plus: 50 %}
        
        {% assign tag_color = '#3b82f6' %}
        {% assign category_lower = category | downcase %}
        {% if category_lower contains 'payment' or category_lower contains 'ach' or category_lower contains 'nacha' or category_lower contains 'wire' %}
          {% assign tag_color = '#3b82f6' %}
        {% elsif category_lower contains 'leadership' or category_lower contains 'management' or category_lower contains 'team' %}
          {% assign tag_color = '#10b981' %}
        {% elsif category_lower contains 'system' or category_lower contains 'architecture' or category_lower contains 'scale' %}
          {% assign tag_color = '#f59e0b' %}
        {% elsif category_lower contains 'engineering' or category_lower contains 'development' %}
          {% assign tag_color = '#8b5cf6' %}
        {% else %}
          {% assign tag_color = '#6b7280' %}
        {% endif %}
        
        <a href="/blog?tag={{ category | downcase }}" class="tag-cloud-item" 
           style="font-size: {{ font_size }}px; color: {{ tag_color }}; opacity: {{ opacity | divided_by: 100.0 }};"
           data-tag="{{ category | downcase }}">
          {{ category | capitalize }}
        </a>
      {% endfor %}
    </div>
  </section>
  
  <!-- Staff+ Systems Thinking Signup Card -->
  <section class="py-8 mb-8">
    <div class="bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-lg p-6 shadow-sm">
      <div class="text-center">
        <h3 class="text-lg font-semibold text-gray-800 mb-2">Don't miss when Staff+ Systems Thinking drops</h3>
        <p class="text-gray-600 mb-4">Subscribe and I'll send it straight to you.</p>
        <form action="https://app.kit.com/forms/8443001/subscriptions" method="post" class="convertkit-form flex flex-col sm:flex-row gap-3 max-w-md mx-auto" data-sv-form="8443001" data-uid="8443001" data-format="inline" data-version="5">
          <input type="email" name="email_address" placeholder="Enter your email" required 
                 class="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm">
          <button type="submit" 
                  class="px-6 py-2 text-white font-medium rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 text-sm whitespace-nowrap"
                  style="background-color: #157878; border-color: #157878;"
                  onmouseover="this.style.backgroundColor='#0f6b6b'"
                  onmouseout="this.style.backgroundColor='#157878'">
            Subscribe
          </button>
        </form>
      </div>
    </div>
  </section>
  


  <!-- Posts Grid - Finshots Style -->
  <div class="posts-grid">
    {% assign all_posts = site.posts | concat: site.payments | concat: site.ach | concat: site.leadership | concat: site.system | sort: 'date' | reverse %}
    {% for post in all_posts %}
    <a href="{{ post.url }}" class="post-card-link">
      <article class="post-card">
        <!-- Clean Banner Image -->
        <div class="post-banner" 
             {% if post.banner_image %}
             style="background-image: url('{{ post.banner_image | relative_url }}');"
             {% else %}
             style="background: {{ post.banner_color | default: '#157878' }};"
             {% endif %}>
        </div>
        
        <div class="post-content">
          <!-- Date and Series Info -->
          <div class="post-meta">
            <span class="post-date">{{ post.date | date: "%b %d, %Y" }}</span>
            {% if post.series.name %}
            <span class="post-series">{{ post.series.name }} Part {{ post.series.part }}</span>
            {% endif %}
          </div>
          
          <h2 class="post-title">{{ post.title }}</h2>
          
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
        </div>
      </article>
    </a>
    {% endfor %}
  </div>
</div>

<style>
/* Tag Cloud Styling */
.tag-cloud-container {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: center;
  align-items: center;
  min-height: 120px;
  padding: 1.5rem;
  background: #f8fafc;
  border-radius: 12px;
  border: 1px solid #e2e8f0;
}

.tag-cloud-item {
  display: inline-block;
  padding: 0.5rem 1rem;
  margin: 0.25rem;
  background: white;
  border: 1px solid #e2e8f0;
  border-radius: 20px;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
  cursor: pointer;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.tag-cloud-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  text-decoration: none;
  border-color: currentColor;
}

/* Finshots-inspired blog styling */

.posts-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  margin-top: 2rem;
}

/* Post Card Link - Entire Card Clickable */
.post-card-link {
  display: block;
  text-decoration: none;
  color: inherit;
  transition: all 0.2s ease;
}

.post-card-link:hover {
  text-decoration: none;
  color: inherit;
}

.post-card {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  overflow: hidden;
  transition: all 0.2s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.post-card-link:hover .post-card {
  border-color: var(--accent);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
  transform: translateY(-2px);
}

/* Clean Banner - No Text Overlay */
.post-banner {
  height: 160px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.post-content {
  padding: 1.5rem;
}

/* Meta Info Below Banner */
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
  color: #111827;
  transition: color 0.2s ease;
}

.post-card-link:hover .post-title {
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



.flex {
  display: flex;
}

.gap-2 {
  gap: 8px;
}

/* Responsive adjustments */
@media (max-width: 640px) {
  .tag-cloud-container {
    padding: 1rem;
    gap: 0.5rem;
  }
  
  .tag-cloud-item {
    padding: 0.375rem 0.75rem;
    font-size: 14px !important;
  }
  

  
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

/* Extra small mobile devices */
@media (max-width: 480px) {
  .tag-cloud-container {
    padding: 0.75rem;
    gap: 0.25rem;
  }
  
  .tag-cloud-item {
    padding: 0.25rem 0.5rem;
    font-size: 12px !important;
  }
  

}
</style>


