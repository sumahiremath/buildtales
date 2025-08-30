---
layout: default
title: "Articles"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Articles</h1>
  
    <!-- Filter Navigation -->
  <div class="filter-nav mb-6">
    <a class="filter-link filter-link--active" href="/blog">All</a>
    <span class="filter-separator">|</span>
    <a class="filter-link" href="/blog?tag=payments">Payments</a>
    <span class="filter-separator">|</span>
    <a class="filter-link" href="/blog?tag=leadership">Leadership</a>
    <span class="filter-separator">|</span>
    <a class="filter-link" href="/blog?tag=systems">Systems</a>
    
    <!-- Additional Categories Dropdown -->
    <div class="filter-dropdown">
      <button class="filter-dropdown-btn" onclick="toggleDropdown()">
        More <span class="dropdown-arrow">▼</span>
      </button>
      <div class="filter-dropdown-content" id="filterDropdown">
        {% assign all_categories = site.posts | map: "categories" | uniq | sort %}
        {% for category in all_categories %}
          {% if category != "fintech" and category != "leadership" and category != "systems" and category != "payments" %}
            <a href="/blog?tag={{ category }}" class="filter-dropdown-link">{{ category | capitalize }}</a>
          {% endif %}
        {% endfor %}
      </div>
    </div>
  </div>

  <!-- Posts Grid - Finshots Style -->
  <div class="posts-grid">
    {% assign current_date = site.time | date: '%s' %}
    {% assign published_posts = site.posts | where_exp: "post", "post.date <= site.time" | sort: 'date' | reverse %}
    {% for post in published_posts %}
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
  height: 180px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

/* Desktop banner height */
@media (min-width: 768px) {
  .post-banner {
    height: 200px;
  }
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
  flex-wrap: wrap;
}

/* Filter Dropdown */
.filter-dropdown {
  position: relative;
  display: inline-block;
}

.filter-dropdown-btn {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  padding: 0.5rem 0.75rem;
  color: #6b7280;
  font-size: 0.875rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
  display: flex;
  align-items: center;
  gap: 0.25rem;
}

.filter-dropdown-btn:hover {
  background: #f3f4f6;
  border-color: #d1d5db;
}

.dropdown-arrow {
  font-size: 0.75rem;
  transition: transform 0.2s ease;
}

.filter-dropdown.active .dropdown-arrow {
  transform: rotate(180deg);
}

.filter-dropdown-content {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  z-index: 1000;
  min-width: 150px;
  margin-top: 0.25rem;
}

.filter-dropdown-content.show {
  display: block;
}

.filter-dropdown-link {
  display: block;
  padding: 0.75rem 1rem;
  color: #374151;
  text-decoration: none;
  font-size: 0.875rem;
  border-bottom: 1px solid #f3f4f6;
  transition: background-color 0.2s ease;
}

.filter-dropdown-link:last-child {
  border-bottom: none;
}

.filter-dropdown-link:hover {
  background-color: #f9fafb;
  color: #157878;
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
    gap: 0.25rem;
    padding: 0.5rem;
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .filter-link {
    font-size: 13px;
    padding: 1px 4px;
  }
  
  .filter-dropdown-btn {
    font-size: 12px;
    padding: 1px 6px;
  }
  
  .filter-separator {
    font-size: 13px;
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
  .filter-nav {
    gap: 0.125rem;
    padding: 0.375rem;
  }
  
  .filter-link {
    font-size: 12px;
    padding: 1px 3px;
  }
  
  .filter-separator {
    font-size: 12px;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterLinks = document.querySelectorAll('.filter-link');
  const postCards = document.querySelectorAll('.post-card-link');
  
  // Dropdown functionality
  window.toggleDropdown = function() {
    const dropdown = document.getElementById('filterDropdown');
    const dropdownContainer = document.querySelector('.filter-dropdown');
    
    if (dropdown.classList.contains('show')) {
      dropdown.classList.remove('show');
      dropdownContainer.classList.remove('active');
    } else {
      dropdown.classList.add('show');
      dropdownContainer.classList.add('active');
    }
  }
  
  // Close dropdown when clicking outside
  document.addEventListener('click', function(event) {
    const dropdown = document.querySelector('.filter-dropdown');
    if (!dropdown.contains(event.target)) {
      document.getElementById('filterDropdown').classList.remove('show');
      dropdown.classList.remove('active');
    }
  });
  
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
      } else if (filter === 'payments' && (categories.includes('payments') || categories.includes('ach'))) {
        // Show both payments and ACH posts when filtering by payments
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
