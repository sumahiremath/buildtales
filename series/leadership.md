---
layout: default
title: "Engineering Leadership: From First Tech Lead to VP"
permalink: /series/leadership
---
# Engineering Leadership

<p class="series-intro">A comprehensive guide to engineering leadership at every level. From your first tech lead role to building and scaling engineering organizations, everything you need to succeed as an engineering leader.</p>

<!-- Quick Navigation -->
<div class="quick-nav">
  <a href="#vision-planning" class="quick-nav-item">
    <span class="nav-icon">🎯</span>
    <span class="nav-text">Vision & Planning</span>
  </a>
  <a href="#strategies-tactics" class="quick-nav-item">
    <span class="nav-icon">⚡</span>
    <span class="nav-text">Strategies & Tactics</span>
  </a>
  <a href="#execute-assess" class="quick-nav-item">
    <span class="nav-icon">🚀</span>
    <span class="nav-text">Execute & Assess</span>
  </a>
  <a href="#team-culture" class="quick-nav-item">
    <span class="nav-icon">👥</span>
    <span class="nav-text">Team & Culture</span>
  </a>
</div>

<!-- Vision & Planning Section -->
<section id="vision-planning" class="content-section">
  <h2 class="section-title">🎯 Vision & Planning</h2>
  <p class="section-description">Strategic thinking, planning, and execution. From project planning to organizational alignment, master the art of turning vision into reality.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign vision_posts = site.posts | where_exp: "post", "post.categories contains 'leadership'" | where_exp: "post", "post.section contains 'Strategies & Tactics'" | sort: 'date' %}
    {% assign management_posts = site.posts | where_exp: "post", "post.categories contains 'leadership'" | where_exp: "post", "post.section contains 'Execute & Assess'" | sort: 'date' %}
    {% assign all_vision_posts = vision_posts | concat: management_posts | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in all_vision_posts %}
      {% if count < 3 %}
        {% assign count = count | plus: 1 %}
        {% assign current_date = site.time | date: '%s' %}
        {% assign post_date = post.date | date: '%s' %}
        
        {% if post_date > current_date %}
          <div class="article-item future">
            <span class="article-title">{{ post.title }}</span>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
            <span class="status-badge">Coming Soon</span>
          </div>
        {% else %}
          <div class="article-item published">
            <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          </div>
        {% endif %}
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- Expandable Section -->
  <div class="expandable-section" id="vision-expanded" style="display: none;">
    <h3>All Vision & Planning Articles:</h3>
    {% for post in all_vision_posts %}
      {% assign current_date = site.time | date: '%s' %}
      {% assign post_date = post.date | date: '%s' %}
      
      {% if post_date > current_date %}
        <div class="article-item future">
          <span class="article-title">{{ post.title }}</span>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          <span class="status-badge">Coming Soon</span>
        </div>
      {% else %}
        <div class="article-item published">
          <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
        </div>
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- View All Button -->
  <div class="view-all-container">
    <button class="view-all-btn" onclick="toggleSection('vision-expanded', this)">
      <span class="btn-text">View All Vision & Planning Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Strategies & Tactics Section -->
<section id="strategies-tactics" class="content-section">
  <h2 class="section-title">⚡ Strategies & Tactics</h2>
  <p class="section-description">Translate vision into game plans and navigate the messy middle between planning and execution.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign strategy_posts = site.posts | where_exp: "post", "post.categories contains 'leadership'" | where_exp: "post", "post.section contains 'Strategies & Tactics'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in strategy_posts %}
      {% if count < 3 %}
        {% assign count = count | plus: 1 %}
        {% assign current_date = site.time | date: '%s' %}
        {% assign post_date = post.date | date: '%s' %}
        
        {% if post_date > current_date %}
          <div class="article-item future">
            <span class="article-title">{{ post.title }}</span>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
            <span class="status-badge">Coming Soon</span>
          </div>
        {% else %}
          <div class="article-item published">
            <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          </div>
        {% endif %}
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- Expandable Section -->
  <div class="expandable-section" id="strategy-expanded" style="display: none;">
    <h3>All Strategies & Tactics Articles:</h3>
    {% for post in strategy_posts %}
      {% assign current_date = site.time | date: '%s' %}
      {% assign post_date = post.date | date: '%s' %}
      
      {% if post_date > current_date %}
        <div class="article-item future">
          <span class="article-title">{{ post.title }}</span>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          <span class="status-badge">Coming Soon</span>
        </div>
      {% else %}
        <div class="article-item published">
          <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
        </div>
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- View All Button -->
  <div class="view-all-container">
    <button class="view-all-btn" onclick="toggleSection('strategy-expanded', this)">
      <span class="btn-text">View All Strategies & Tactics Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Execute & Assess Section -->
<section id="execute-assess" class="content-section">
  <h2 class="section-title">🚀 Execute & Assess</h2>
  <p class="section-description">Get things done and learn lessons from execution. Master delivery, feedback loops, and continuous improvement.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign execute_posts = site.posts | where_exp: "post", "post.categories contains 'leadership'" | where_exp: "post", "post.section contains 'Execute & Assess'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in execute_posts %}
      {% if count < 3 %}
        {% assign count = count | plus: 1 %}
        {% assign current_date = site.time | date: '%s' %}
        {% assign post_date = post.date | date: '%s' %}
        
        {% if post_date > current_date %}
          <div class="article-item future">
            <span class="article-title">{{ post.title }}</span>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
            <span class="status-badge">Coming Soon</span>
          </div>
        {% else %}
          <div class="article-item published">
            <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          </div>
        {% endif %}
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- Expandable Section -->
  <div class="expandable-section" id="execute-expanded" style="display: none;">
    <h3>All Execute & Assess Articles:</h3>
    {% for post in execute_posts %}
      {% assign current_date = site.time | date: '%s' %}
      {% assign post_date = post.date | date: '%s' %}
      
      {% if post_date > current_date %}
        <div class="article-item future">
          <span class="article-title">{{ post.title }}</span>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          <span class="status-badge">Coming Soon</span>
        </div>
      {% else %}
        <div class="article-item published">
          <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
        </div>
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- View All Button -->
  <div class="view-all-container">
    <button class="view-all-btn" onclick="toggleSection('execute-expanded', this)">
      <span class="btn-text">View All Execute & Assess Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Team & Culture Section -->
<section id="team-culture" class="content-section">
  <h2 class="section-title">👥 Team & Culture</h2>
  <p class="section-description">Leadership lessons from the trenches. Real stories and practical insights from engineering management experience.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign team_posts = site.posts | where_exp: "post", "post.categories contains 'leadership'" | where_exp: "post", "post.section contains 'Strategies & Tactics'" | sort: 'date' %}
    {% assign management_posts = site.posts | where_exp: "post", "post.categories contains 'leadership'" | where_exp: "post", "post.section contains 'Execute & Assess'" | sort: 'date' %}
    {% assign all_team_posts = team_posts | concat: management_posts | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in all_team_posts %}
      {% if count < 3 %}
        {% assign count = count | plus: 1 %}
        {% assign current_date = site.time | date: '%s' %}
        {% assign post_date = post.date | date: '%s' %}
        
        {% if post_date > current_date %}
          <div class="article-item future">
            <span class="article-title">{{ post.title }}</span>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
            <span class="status-badge">Coming Soon</span>
          </div>
        {% else %}
          <div class="article-item published">
            <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
            <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          </div>
        {% endif %}
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- Expandable Section -->
  <div class="expandable-section" id="team-expanded" style="display: none;">
    <h3>All Team & Culture Articles:</h3>
    {% for post in all_team_posts %}
      {% assign current_date = site.time | date: '%s' %}
      {% assign post_date = post.date | date: '%s' %}
      
      {% if post_date > current_date %}
        <div class="article-item future">
          <span class="article-title">{{ post.title }}</span>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
          <span class="status-badge">Coming Soon</span>
        </div>
      {% else %}
        <div class="article-item published">
          <a href="{{ post.url }}" class="article-title">{{ post.title }}</a>
          <span class="article-date">({{ post.date | date: "%b %d, %Y" }})</span>
        </div>
      {% endif %}
    {% endfor %}
  </div>
  
  <!-- View All Button -->
  <div class="view-all-container">
    <button class="view-all-btn" onclick="toggleSection('team-expanded', this)">
      <span class="btn-text">View All Team & Culture Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- JavaScript for Toggle Functionality -->
<script>
function toggleSection(sectionId, button) {
  const section = document.getElementById(sectionId);
  const btnText = button.querySelector('.btn-text');
  const btnIcon = button.querySelector('.btn-icon');
  
  if (section.style.display === 'none') {
    section.style.display = 'block';
    btnText.textContent = btnText.textContent.replace('View All', 'Show Less');
    btnIcon.textContent = '▲';
    button.classList.add('expanded');
  } else {
    section.style.display = 'none';
    btnText.textContent = btnText.textContent.replace('Show Less', 'View All');
    btnIcon.textContent = '▼';
    button.classList.remove('expanded');
  }
}
</script>

<style>
/* Series Introduction */
.series-intro {
  font-size: 1rem;
  color: #4b5563;
  line-height: 1.4;
  margin: 0.75rem 0 1rem 0;
  text-align: center;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

/* Main Heading */
h1 {
  text-align: center;
}

/* Quick Navigation */
.quick-nav {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 0.5rem;
  margin: 1rem 0 1.5rem 0;
}

.quick-nav-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0.75rem 0.5rem;
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  text-decoration: none;
  color: inherit;
  transition: all 0.2s ease;
  text-align: center;
}

.quick-nav-item:hover {
  border-color: #157878;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(21, 120, 120, 0.15);
  text-decoration: none;
}

.nav-icon {
  font-size: 1.25rem;
  margin-bottom: 0.25rem;
}

.nav-text {
  font-weight: 600;
  color: #374151;
  font-size: 0.75rem;
}

/* Content Sections */
.content-section {
  margin-bottom: 2rem;
  padding: 1.5rem;
  background: white;
  border-radius: 8px;
  border: 1px solid #e5e7eb;
}

.section-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #111827;
  margin: 0 0 0.5rem 0;
  line-height: 1.3;
  border-bottom: 2px solid #157878;
  padding-bottom: 0.5rem;
}

.section-description {
  font-size: 1rem;
  color: #6b7280;
  line-height: 1.5;
  margin: 0 0 1.5rem 0;
  max-width: 700px;
}

/* Featured Articles */
.featured-articles {
  margin-bottom: 1.5rem;
}

.featured-articles h3 {
  font-size: 1.125rem;
  font-weight: 600;
  color: #374151;
  margin: 0 0 1rem 0;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #e5e7eb;
}

/* Article Items */
.article-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.75rem 0;
  border-bottom: 1px solid #f3f4f6;
}

.article-item:last-child {
  border-bottom: none;
}

.article-title {
  font-size: 1rem;
  font-weight: 500;
  color: #111827;
  text-decoration: none;
  flex: 1;
}

.article-title:hover {
  color: #157878;
}

.article-date {
  font-size: 0.875rem;
  color: #6b7280;
  font-weight: 400;
}

.status-badge {
  font-size: 0.75rem;
  background: #f59e0b;
  color: white;
  padding: 0.25rem 0.5rem;
  border-radius: 6px;
  font-weight: 500;
}

/* Future Articles */
.article-item.future .article-title {
  color: #9ca3af;
  font-style: italic;
}

.article-item.future .article-date {
  color: #9ca3af;
}

/* Expandable Sections */
.expandable-section {
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid #e5e7eb;
}

.expandable-section h3 {
  font-size: 1.125rem;
  font-weight: 600;
  color: #374151;
  margin: 0 0 1rem 0;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #e5e7eb;
}

/* View All Button */
.view-all-container {
  text-align: center;
  margin-top: 1rem;
}

.view-all-btn {
  background: #f8fafc;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  padding: 0.75rem 1.5rem;
  font-size: 0.875rem;
  font-weight: 500;
  color: #374151;
  cursor: pointer;
  transition: all 0.2s ease;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
}

.view-all-btn:hover {
  background: #f1f5f9;
  border-color: #157878;
  color: #157878;
}

.view-all-btn.expanded {
  background: #157878;
  color: white;
  border-color: #157878;
}

.btn-icon {
  transition: transform 0.2s ease;
}

/* Mobile Responsive */
@media (max-width: 768px) {
  .quick-nav {
    grid-template-columns: repeat(2, 1fr);
    gap: 0.375rem;
  }
  
  .section-title {
    font-size: 1.25rem;
  }
  
  .series-intro {
    font-size: 0.875rem;
    margin: 0.5rem 0 0.75rem 0;
  }
  
  .content-section {
    margin-bottom: 1.5rem;
    padding: 1rem;
  }
  
  .view-all-btn {
    padding: 0.625rem 1.25rem;
    font-size: 0.8125rem;
  }
  
  .article-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }
  
  .article-date {
    font-size: 0.8125rem;
  }
}

@media (max-width: 480px) {
  .quick-nav {
    grid-template-columns: 1fr;
  }
  
  .quick-nav-item {
    padding: 0.625rem 0.375rem;
  }
  
  .nav-icon {
    font-size: 1.125rem;
  }
  
  .nav-text {
    font-size: 0.6875rem;
  }
}
</style>
