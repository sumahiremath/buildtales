---
layout: default
title: "Posts"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Posts</h1>
  
  <!-- Filter Navigation -->
  <div class="filter-nav mb-6">
    <a class="filter-link filter-link--active" href="/blog">All</a>
    <span class="filter-separator">|</span>
    <a class="filter-link" href="/blog?tag=payments">Payments</a>
    <span class="filter-separator">|</span>
    <a class="filter-link" href="/blog?tag=leadership">Leadership</a>
    <span class="filter-separator">|</span>
    <a class="filter-link" href="/blog?tag=systems">Systems</a>
  </div>

  <!-- Posts Grid - Finshots Style -->
  <div class="posts-grid">
    {% for post in site.posts %}
    <a href="{{ post.url }}" class="post-card-link" data-categories="{{ post.categories | join: ',' | downcase }}">
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

/* Filter Navigation - Header Style */
.filter-nav {
  display: flex;
  justify-content: center;
  align-items: baseline;
  gap: 0.75rem;
  padding: 1rem 0;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  background: #fafbfc;
}

.filter-link {
  color: #4b5563;
  text-decoration: none;
  padding: 4px 8px;
  font-size: 16px;
  font-weight: 500;
  border-radius: 3px;
  transition: all 0.2s ease;
  display: inline-block;
  line-height: 1.2;
  vertical-align: baseline;
}

.filter-link:hover {
  color: var(--accent);
  background: rgba(21, 120, 120, 0.08);
  text-decoration: none;
}

.filter-link--active {
  color: var(--accent);
  font-weight: 600;
  background: rgba(21, 120, 120, 0.12);
}

.filter-separator {
  color: #9ca3af;
  margin: 0;
  font-size: 16px;
  line-height: 1.2;
  vertical-align: baseline;
  display: inline-block;
  user-select: none;
}

.flex {
  display: flex;
}

.gap-2 {
  gap: 8px;
}

/* Responsive adjustments */
@media (max-width: 640px) {
  .filter-nav {
    gap: 0.5rem;
    padding: 0.75rem;
    flex-wrap: wrap;
  }
  
  .filter-link {
    font-size: 14px;
    padding: 2px 6px;
  }
  
  .filter-separator {
    font-size: 14px;
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
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterLinks = document.querySelectorAll('.filter-link');
  const postCards = document.querySelectorAll('.post-card-link');
  
  // Get current filter from URL parameter
  const urlParams = new URLSearchParams(window.location.search);
  const currentFilter = urlParams.get('tag') || 'all';
  
  // Update active filter link
  function updateActiveFilter(activeFilter) {
    filterLinks.forEach(link => {
      link.classList.remove('filter-link--active');
      
      if (activeFilter === 'all' && link.getAttribute('href') === '/blog') {
        link.classList.add('filter-link--active');
      } else if (link.getAttribute('href').includes(`tag=${activeFilter}`)) {
        link.classList.add('filter-link--active');
      }
    });
  }
  
  // Filter posts based on category
  function filterPosts(filter) {
    postCards.forEach(card => {
      const categories = card.getAttribute('data-categories') || '';
      
      if (filter === 'all' || categories.includes(filter)) {
        card.style.display = 'block';
      } else {
        card.style.display = 'none';
      }
    });
  }
  
  // Initialize page with current filter
  updateActiveFilter(currentFilter);
  filterPosts(currentFilter);
  
  // Handle filter link clicks
  filterLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      
      const href = this.getAttribute('href');
      const newFilter = href.includes('tag=') ? href.split('tag=')[1] : 'all';
      
      // Update URL without page reload
      const newUrl = newFilter === 'all' ? '/blog' : `/blog?tag=${newFilter}`;
      window.history.pushState({}, '', newUrl);
      
      // Update display
      updateActiveFilter(newFilter);
      filterPosts(newFilter);
    });
  });
});
</script>