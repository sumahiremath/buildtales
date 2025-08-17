---
layout: default
title: Build Tales
---

<!-- Hero Section -->
<section class="py-16">
  <div class="mx-auto max-w-4xl text-center space-y-6">
    <h1 class="text-5xl font-bold">Deep, no-fluff essays on engineering leadership & U.S. payments.</h1>
    <p class="text-xl font-medium" style="color: #333; margin: 1.5rem auto; max-width: 600px; text-align: center;">Actionable breakdowns you can read in 7–12 minutes.</p>
    
    <!-- Hero Cards -->
    <div class="hero-cards-grid">
      <a class="hero-card primary" href="/series/payments">
        <div class="hero-card-icon">🚀</div>
        <h3>Start the Payments Series</h3>
        <p>Deep dive into U.S. payment systems - from ACH to wire transfers</p>
        <span class="hero-card-action">Begin Reading →</span>
      </a>
      <a class="hero-card secondary" href="/blog">
        <div class="hero-card-icon">📚</div>
        <h3>Explore All Posts</h3>
        <p>Browse engineering leadership, systems, and payment articles</p>
        <span class="hero-card-action">View Posts →</span>
      </a>
    </div>
  </div>
</section>
<br>  

<!-- Start Here Section -->
<section class="py-10">
  <div class="mx-auto max-w-5xl">
    <h2 class="text-2xl font-semibold mb-8 text-center">Start here</h2>
    <div class="start-here-grid">
      <a class="start-here-card" href="/series/payments">
        <div class="card-icon" style="background: #157878; color: white;">🚀</div>
        <h3 class="font-semibold mb-2">How U.S. Payments Really Work</h3>
        <p class="opacity-80 text-sm">Rails, risk & real-world ops.</p>
        <span class="card-status available">Available now</span>
      </a>
      <a class="start-here-card" href="/posts/engineering-leadership-staff-systems">
        <div class="card-icon" style="background: #6b7280; color: white;">⚡</div>
        <h3 class="font-semibold mb-2">Staff+ Systems Thinking</h3>
        <p class="opacity-80 text-sm">Lead through architecture.</p>
        <span class="card-status coming-soon">Coming soon</span>
      </a>
      <a class="start-here-card" href="/posts/designing-for-failure">
        <div class="card-icon" style="background: #6b7280; color: white;">🛡️</div>
        <h3 class="font-semibold mb-2">Designing for Failure</h3>
        <p class="opacity-80 text-sm">Resilience & incident habits.</p>
        <span class="card-status coming-soon">Coming soon</span>
      </a>
    </div>
  </div>
</section>

<!-- Recent Articles Section -->
<section class="py-10">
  <div class="mx-auto max-w-3xl">
    <h2 class="text-2xl font-semibold mb-6">Recent Articles</h2>
    <div class="recent-posts-grid">
      {% for post in site.posts limit:3 %}
      <article class="recent-post-card">
        <!-- Banner Image with Teal Fallback -->
        <div class="recent-post-banner" 
             {% if post.banner_image %}
             style="background-image: url('{{ post.banner_image | relative_url }}');"
             {% else %}
             style="background: {{ post.banner_color | default: '#157878' }};"
             {% endif %}>
          <div class="post-meta">
            <span class="post-date">{{ post.date | date: "%b %d, %Y" }}</span>
            {% if post.series.name %}
            <span class="post-series">{{ post.series.name }} Part {{ post.series.part }}</span>
            {% endif %}
          </div>
        </div>
        
        <div class="recent-post-content">
          <h3 class="recent-post-title">
            <a href="{{ post.url }}">{{ post.title }}</a>
          </h3>
          
          <p class="recent-post-excerpt">{{ post.excerpt | strip_html | truncatewords: 20 }}</p>
          
          {% if post.categories %}
          <div class="recent-post-categories">
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
</section>

<style>
/* Custom styles for this page */

/* Recent Articles - Finshots Style */
.recent-posts-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  margin-top: 1.5rem;
}

.recent-post-card {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  overflow: hidden;
  transition: all 0.2s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.recent-post-card:hover {
  border-color: var(--accent);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
  transform: translateY(-2px);
}

/* Recent post banner styling */
.recent-post-banner {
  height: 140px;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  position: relative;
  display: flex;
  align-items: flex-end;
  padding: 1rem;
}

.recent-post-banner::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(to bottom, rgba(0,0,0,0.1), rgba(0,0,0,0.4));
  pointer-events: none;
}

.recent-post-content {
  padding: 1.5rem;
}

.recent-post-banner .post-meta {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  position: relative;
  z-index: 1;
}

.recent-post-banner .post-date {
  font-size: 0.875rem;
  color: rgba(255, 255, 255, 0.9);
  font-weight: 500;
  text-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
}

.recent-post-banner .post-series {
  font-size: 0.75rem;
  background: rgba(255, 255, 255, 0.2);
  color: white;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-weight: 500;
  backdrop-filter: blur(4px);
  text-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
}

.recent-post-title {
  margin: 0 0 0.75rem 0;
  font-size: 1.1rem;
  font-weight: 600;
  line-height: 1.3;
}

.recent-post-title a {
  color: #111827;
  text-decoration: none;
  transition: color 0.2s ease;
}

.recent-post-title a:hover {
  color: var(--accent);
}

.recent-post-excerpt {
  color: #4b5563;
  line-height: 1.6;
  margin: 0 0 1rem 0;
  font-size: 0.95rem;
}

.recent-post-categories {
  display: flex;
  gap: 0.5rem;
}

/* Start Here Section - Enhanced Card Layout */
.start-here-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  margin-top: 2rem;
}

.start-here-card {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 12px;
  padding: 2rem 1.5rem;
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  transition: all 0.3s ease;
  position: relative;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

.start-here-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
  border-color: var(--accent);
  text-decoration: none;
}

.card-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  margin-bottom: 1rem;
}

.start-here-card h3 {
  color: #333;
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
}

.start-here-card p {
  color: #666;
  margin-bottom: 1rem;
  flex-grow: 1;
}

.card-status {
  font-size: 0.75rem;
  font-weight: 600;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.card-status.available {
  background: #d1fae5;
  color: #065f46;
}

.card-status.coming-soon {
  background: #f3f4f6;
  color: #6b7280;
}

@media (max-width: 768px) {
  .start-here-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  
  .start-here-card {
    padding: 1.5rem 1rem;
  }
}

/* Hero Cards - Card-style CTAs */
.hero-cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-top: 3rem;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.hero-card {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 16px;
  padding: 2rem;
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  transition: all 0.3s ease;
  position: relative;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  min-height: 200px;
}

.hero-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
  text-decoration: none;
}

.hero-card.primary {
  border-color: #157878;
  background: linear-gradient(135deg, #157878 0%, #1a8a8a 100%);
  color: white;
}

.hero-card.primary:hover {
  box-shadow: 0 12px 32px rgba(21, 120, 120, 0.3);
  color: white;
}

.hero-card.secondary {
  border-color: #157878;
}

.hero-card.secondary:hover {
  border-color: #157878;
  background: #f8fffe;
}

.hero-card-icon {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.hero-card h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin: 0 0 0.75rem 0;
  color: inherit;
}

.hero-card p {
  font-size: 0.95rem;
  opacity: 0.9;
  margin: 0 0 1.5rem 0;
  flex-grow: 1;
  color: inherit;
}

.hero-card-action {
  font-size: 0.9rem;
  font-weight: 600;
  opacity: 0.8;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

/* Card styles */
.card {
  display: block;
  text-decoration: none;
  color: inherit;
}

.card h3 {
  color: #333;
}

.card:hover {
  text-decoration: none;
}

.card:hover h3 {
  color: var(--accent);
}

.flex {
  display: flex;
}

.justify-center {
  justify-content: center;
}

.gap-3 {
  gap: 12px;
}

/* Mobile responsive */
@media (max-width: 640px) {
  .hero-cards-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
    margin-top: 2rem;
  }
  
  .hero-card {
    padding: 1.5rem;
    min-height: 160px;
  }
  
  .hero-card-icon {
    font-size: 2rem;
    margin-bottom: 0.75rem;
  }
  
  .hero-card h3 {
    font-size: 1.125rem;
  }
  
  .flex {
    flex-direction: column;
    align-items: center;
  }
  
  .btn-primary,
  .btn-secondary {
    width: 100%;
    max-width: 300px;
    text-align: center;
  }
}
</style>