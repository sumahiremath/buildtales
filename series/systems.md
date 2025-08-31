---
layout: default
title: "Systems & Architecture: Building Scalable, Resilient Software"
permalink: /series/systems
---
# Systems & Architecture: Building Scalable, Resilient Software

<p class="series-intro">A comprehensive guide to system design, architecture patterns, and building software that scales. From fundamentals to advanced distributed systems, everything you need to architect robust applications.</p>

<!-- Quick Navigation -->
<div class="quick-nav">
  <a href="#fundamentals" class="quick-nav-item">
    <span class="nav-icon">🏗️</span>
    <span class="nav-text">Fundamentals</span>
  </a>
  <a href="#ai-tools" class="quick-nav-item">
    <span class="nav-icon">🤖</span>
    <span class="nav-text">AI Tools</span>
  </a>
  <a href="#architecture" class="quick-nav-item">
    <span class="nav-icon">🌐</span>
    <span class="nav-text">Architecture</span>
  </a>
</div>

<!-- System Design Fundamentals Section -->
<section id="fundamentals" class="content-section">
  <h2 class="section-title">🏗️ System Design Fundamentals</h2>
  <p class="section-description">Core principles of system design, architecture patterns, and foundational concepts that every engineer should master.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign fundamentals_posts = site.posts | where_exp: "post", "post.categories contains 'systems'" | where_exp: "post", "post.section contains 'System Design Fundamentals'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in fundamentals_posts %}
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
  <div class="expandable-section" id="fundamentals-expanded" style="display: none;">
    <h3>All Fundamentals Articles:</h3>
    {% for post in fundamentals_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('fundamentals-expanded', this)">
      <span class="btn-text">View All Fundamentals Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- AI Tools & Development Section -->
<section id="ai-tools" class="content-section">
  <h2 class="section-title">🤖 AI Tools & Development</h2>
  <p class="section-description">Leveraging AI tools like Cursor, GitHub Copilot, and other AI assistants to improve development productivity and code quality.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign ai_posts = site.posts | where_exp: "post", "post.categories contains 'systems'" | where_exp: "post", "post.section contains 'Leveraging AI Tools'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in ai_posts %}
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
  <div class="expandable-section" id="ai-expanded" style="display: none;">
    <h3>All AI Tools Articles:</h3>
    {% for post in ai_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('ai-expanded', this)">
      <span class="btn-text">View All AI Tools Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Architecture & Design Section -->
<section id="architecture" class="content-section">
  <h2 class="section-title">🌐 Architecture & Design</h2>
  <p class="section-description">System architecture, design patterns, and building robust, scalable applications with modern technologies.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign architecture_posts = site.posts | where_exp: "post", "post.categories contains 'systems'" | where_exp: "post", "post.categories contains 'rails'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in architecture_posts %}
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
  <div class="expandable-section" id="architecture-expanded" style="display: none;">
    <h3>All Architecture Articles:</h3>
    {% for post in architecture_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('architecture-expanded', this)">
      <span class="btn-text">View All Architecture Articles</span>
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
  grid-template-columns: repeat(3, 1fr);
  gap: 0.5rem;
  margin: 1rem 0 1.5rem 0;
  justify-content: center;
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
