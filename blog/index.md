---
layout: default
title: "Posts"
---

<div class="mx-auto max-w-3xl">
  <h1 class="text-4xl font-bold mb-6">Posts</h1>
  
  <!-- Filter Chips -->
  <div class="flex gap-2 mb-6">
    <a class="chip chip--active" href="/blog">All</a>
    <a class="chip" href="/blog?tag=payments">Payments</a>
    <a class="chip" href="/blog?tag=leadership">Leadership</a>
    <a class="chip" href="/blog?tag=systems">Systems</a>
  </div>

  <!-- Posts Grid -->
  <div class="space-y-6">
    {% for post in site.posts %}
    <article class="card flex flex-col gap-2">
      <a href="{{ post.url }}" class="text-xl font-semibold" style="text-decoration: none; color: #333;">{{ post.title }}</a>
      <p class="opacity-80">{{ post.excerpt | strip_html | truncatewords: 20 }}</p>
      <span class="text-sm opacity-60">{{ post.date | date: "%B %d, %Y" }}{% if post.series.name %} • {{ post.series.name }} Part {{ post.series.part }}{% endif %}</span>
    </article>
    {% endfor %}
  </div>
</div>

<style>
/* Additional styles for blog page */
.card a:hover {
  color: var(--accent);
  text-decoration: none;
}

.flex {
  display: flex;
}

.flex-col {
  flex-direction: column;
}

.gap-2 {
  gap: 8px;
}

.space-y-6 > * + * {
  margin-top: 24px;
}

/* Responsive adjustments for filter chips */
@media (max-width: 640px) {
  .flex {
    flex-wrap: wrap;
  }
}
</style>