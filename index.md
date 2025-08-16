---
layout: default
title: Build Tales
---

<!-- Hero Section -->
<section class="py-16">
  <div class="mx-auto max-w-3xl text-center space-y-6">
    <h1 class="text-5xl font-bold">Deep, no-fluff essays on engineering leadership & U.S. payments.</h1>
    <p class="text-lg opacity-80">Actionable breakdowns you can read in 7–12 minutes.</p>
    <div class="flex justify-center gap-3">
      <a class="btn-primary" href="/series/payments">Start the Payments Series</a>
      <a class="btn-secondary" href="/blog">Explore All Posts</a>
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

@media (max-width: 640px) {
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