---
layout: default
title: Build Tales
---

<!-- Hero Section -->
<section class="py-16">
  <div class="mx-auto max-w-3xl text-center space-y-6">
    <h1 class="text-5xl font-bold">Deep, no-fluff essays on engineering leadership & U.S. payments.</h1>
    <p class="text-xl font-medium" style="color: #333; margin: 1.5rem auto; max-width: 600px; text-align: center;">Actionable breakdowns you can read in 7–12 minutes.</p>
    <div class="hero-buttons">
      <a class="hero-btn-primary" href="/series/payments">🚀 Start the Payments Series</a>
      <a class="hero-btn-secondary" href="/blog">📚 Explore All Posts</a>
    </div>
  </div>
</section>

<!-- Start Here Section -->
<section class="py-10">
  <div class="mx-auto max-w-3xl">
    <h2 class="text-2xl font-semibold mb-6">Start here</h2>
    <div class="grid sm:grid-cols-3 gap-6">
      <a class="card" href="/series/payments">
        <h3 class="font-semibold mb-2">How U.S. Payments Really Work</h3>
        <p class="opacity-80 text-sm">Rails, risk & real-world ops.</p>
      </a>
      <a class="card" href="/posts/engineering-leadership-staff-systems">
        <h3 class="font-semibold mb-2">Staff+ Systems Thinking</h3>
        <p class="opacity-80 text-sm">Lead through architecture.</p>
      </a>
      <a class="card" href="/posts/designing-for-failure">
        <h3 class="font-semibold mb-2">Designing for Failure</h3>
        <p class="opacity-80 text-sm">Resilience & incident habits.</p>
      </a>
    </div>
  </div>
</section>

<!-- Recent Articles Section -->
<section class="py-10">
  <div class="mx-auto max-w-3xl">
    <h2 class="text-2xl font-semibold mb-6">Recent Articles</h2>
    <div class="space-y-6">
      {% for post in site.posts limit:3 %}
      <article class="card">
        <a href="{{ post.url }}" class="text-xl font-semibold" style="text-decoration: none; color: #333;">{{ post.title }}</a>
        <p class="opacity-80">{{ post.excerpt | strip_html | truncatewords: 15 }}</p>
        <span class="text-sm opacity-60">{{ post.date | date: "%B %d, %Y" }}</span>
      </article>
      {% endfor %}
    </div>
  </div>
</section>

<style>
/* Custom styles for this page */

/* Hero Buttons - Large, Prominent CTAs */
.hero-buttons {
  display: flex;
  justify-content: center;
  gap: 1.5rem;
  margin-top: 2rem;
}

.hero-btn-primary {
  background: linear-gradient(135deg, #157878 0%, #1a8a8a 100%);
  color: white;
  padding: 18px 36px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 600;
  font-size: 1.1rem;
  display: inline-block;
  box-shadow: 0 4px 12px rgba(21, 120, 120, 0.3);
  transition: all 0.3s ease;
  transform: translateY(0);
}

.hero-btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(21, 120, 120, 0.4);
  text-decoration: none;
  color: white;
}

.hero-btn-secondary {
  background: white;
  color: #157878;
  padding: 18px 36px;
  border: 2px solid #157878;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 600;
  font-size: 1.1rem;
  display: inline-block;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  transform: translateY(0);
}

.hero-btn-secondary:hover {
  background: #157878;
  color: white;
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(21, 120, 120, 0.3);
  text-decoration: none;
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
  .hero-buttons {
    flex-direction: column;
    align-items: center;
    gap: 1rem;
  }
  
  .hero-btn-primary,
  .hero-btn-secondary {
    width: 100%;
    max-width: 320px;
    text-align: center;
    padding: 16px 24px;
    font-size: 1rem;
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