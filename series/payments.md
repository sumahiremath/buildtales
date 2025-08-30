---
layout: default
title: "How U.S. Payments Really Work"
permalink: /series/payments
---
# How U.S. Payments Really Work

<p class="series-intro">A comprehensive builder's guide to U.S. payment systems. From ACH to modern crypto rails, everything you need to understand, build, and scale payment systems in the United States.</p>

<!-- Quick Navigation -->
<div class="quick-nav">
  <a href="#ach-batch" class="quick-nav-item">
    <span class="nav-icon">🏦</span>
    <span class="nav-text">ACH & Batch</span>
  </a>
  <a href="#real-time" class="quick-nav-item">
    <span class="nav-icon">⚡</span>
    <span class="nav-text">Real-Time</span>
  </a>
  <a href="#card-networks" class="quick-nav-item">
    <span class="nav-icon">💳</span>
    <span class="nav-text">Card Networks</span>
  </a>
  <a href="#modern-rails" class="quick-nav-item">
    <span class="nav-icon">🚀</span>
    <span class="nav-text">Modern Rails</span>
  </a>
</div>

<!-- ACH & Batch Processing Section -->
<section id="ach-batch" class="content-section">
  <h2 class="section-title">🏦 ACH & Batch Processing</h2>
  <p class="section-description">Master the fundamentals of Automated Clearing House operations, from basic concepts to advanced compliance and operational challenges.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign ach_posts = site.posts | where_exp: "post", "post.payment_type contains 'ach'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in ach_posts %}
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
  <div class="expandable-section" id="ach-expanded" style="display: none;">
    <h3>All ACH Articles:</h3>
    {% for post in ach_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('ach-expanded', this)">
      <span class="btn-text">View All ACH Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Real-Time Payments Section -->
<section id="real-time" class="content-section">
  <h2 class="section-title">⚡ Real-Time Payments</h2>
  <p class="section-description">Explore instant payment systems including wire transfers, RTP, FedNow, and other real-time settlement networks.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign wire_posts = site.posts | where_exp: "post", "post.payment_type contains 'wire'" | sort: 'date' %}
    {% assign faster_posts = site.posts | where_exp: "post", "post.payment_type contains 'faster'" | sort: 'date' %}
    {% assign real_time_posts = wire_posts | concat: faster_posts | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in real_time_posts %}
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
  <div class="expandable-section" id="realtime-expanded" style="display: none;">
    <h3>All Real-Time Articles:</h3>
    {% assign all_wire_posts = site.posts | where_exp: "post", "post.payment_type contains 'wire'" | sort: 'date' %}
    {% assign all_faster_posts = site.posts | where_exp: "post", "post.payment_type contains 'faster'" | sort: 'date' %}
    {% assign all_realtime_posts = all_wire_posts | concat: all_faster_posts | sort: 'date' %}
    {% for post in all_realtime_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('realtime-expanded', this)">
      <span class="btn-text">View All Real-Time Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Card Networks Section -->
<section id="card-networks" class="content-section">
  <h2 class="section-title">💳 Card Networks & Processing</h2>
  <p class="section-description">Dive into credit card processing, interchange fees, 3D Secure, and the complex world of card network operations.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign card_posts = site.posts | where_exp: "post", "post.payment_type contains 'card'" | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in card_posts %}
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
  <div class="expandable-section" id="cards-expanded" style="display: none;">
    <h3>All Card Articles:</h3>
    {% for post in card_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('cards-expanded', this)">
      <span class="btn-text">View All Card Articles</span>
      <span class="btn-icon">▼</span>
    </button>
  </div>
</section>

<!-- Modern Rails Section -->
<section id="modern-rails" class="content-section">
  <h2 class="section-title">🚀 Modern Payment Rails</h2>
  <p class="section-description">Explore digital wallets, P2P networks, crypto payments, and emerging technologies shaping the future of money movement.</p>
  
  <!-- Featured Articles (Show First 3) -->
  <div class="featured-articles">
    <h3>Featured Articles:</h3>
    {% assign wallet_posts = site.posts | where_exp: "post", "post.payment_type contains 'wallet'" | sort: 'date' %}
    {% assign crypto_posts = site.posts | where_exp: "post", "post.payment_type contains 'crypto'" | sort: 'date' %}
    {% assign legacy_posts = site.posts | where_exp: "post", "post.payment_type contains 'legacy'" | sort: 'date' %}
    {% assign emerging_posts = site.posts | where_exp: "post", "post.payment_type contains 'emerging'" | sort: 'date' %}
    {% assign modern_posts = wallet_posts | concat: crypto_posts | concat: legacy_posts | concat: emerging_posts | sort: 'date' %}
    {% assign count = 0 %}
    {% for post in modern_posts %}
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
  <div class="expandable-section" id="modern-expanded" style="display: none;">
    <h3>All Modern Rails Articles:</h3>
    {% assign all_wallet_posts = site.posts | where_exp: "post", "post.payment_type contains 'wallet'" | sort: 'date' %}
    {% assign all_crypto_posts = site.posts | where_exp: "post", "post.payment_type contains 'crypto'" | sort: 'date' %}
    {% assign all_legacy_posts = site.posts | where_exp: "post", "post.payment_type contains 'legacy'" | sort: 'date' %}
    {% assign all_emerging_posts = site.posts | where_exp: "post", "post.payment_type contains 'emerging'" | sort: 'date' %}
    {% assign all_modern_posts = all_wallet_posts | concat: all_crypto_posts | concat: all_legacy_posts | concat: all_emerging_posts | sort: 'date' %}
    {% for post in all_modern_posts %}
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
    <button class="view-all-btn" onclick="toggleSection('modern-expanded', this)">
      <span class="btn-text">View All Modern Rails Articles</span>
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
