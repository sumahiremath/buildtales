---
layout: default
title: "Blog"
---

# Blog

Here's a collection of posts from the field — lessons learned, patterns discovered, and occasional rants with love.

## All Articles

<div style="display: flex; gap: 1rem; margin-bottom: 2rem; flex-wrap: wrap;">
  <a href="/rebuilding-us-payments/" style="background: #007acc; color: white; padding: 0.75rem 1.5rem; border-radius: 4px; text-decoration: none; font-weight: bold;">
    📚 Payment Series (3/45)
  </a>
  <a href="#bonus-articles" style="background: transparent; color: #007acc; padding: 0.75rem 1.5rem; border: 2px solid #007acc; border-radius: 4px; text-decoration: none; font-weight: bold;">
    ✨ Bonus Articles
  </a>
  <a href="#all-posts" style="background: transparent; color: #666; padding: 0.75rem 1.5rem; border: 1px solid #ccc; border-radius: 4px; text-decoration: none;">
    📄 All Posts
  </a>
</div>

## Featured Series

<div style="background: linear-gradient(135deg, #007acc, #0099ff); color: white; padding: 1.5rem; border-radius: 8px; margin: 2rem 0;">
  <h3 style="margin-top: 0; color: white;">How U.S. Payments Really Work</h3>
  <p>A survival manual for building resilient platforms that move money — and earn trust.</p>
  <a href="/rebuilding-us-payments/" style="background: rgba(255,255,255,0.2); color: white; padding: 0.5rem 1rem; border-radius: 4px; text-decoration: none; font-weight: bold;">
    View Series Roadmap →
  </a>
</div>

{% if site.posts.size > 0 %}
  
  <!-- Series Articles -->
  {% assign series_posts = site.posts | where_exp: "post", "post.series.name == 'How U.S. Payments Really Work'" %}
  {% if series_posts.size > 0 %}
  <h3 id="series-articles">📚 Payment Series Articles</h3>
  {% for post in series_posts %}
  <article style="margin-bottom: 1.5rem; padding: 1.5rem; border: 1px solid #007acc; border-radius: 8px; background: #f8f9fa;">
    <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem;">
      <span style="background: #007acc; color: white; padding: 0.25rem 0.5rem; border-radius: 4px; font-size: 0.8rem; font-weight: bold;">
        Part {{ post.series.part }}
      </span>
      <span style="color: #666; font-size: 0.9rem;">{{ post.date | date: "%B %d, %Y" }}</span>
    </div>
    <h3 style="margin: 0.5rem 0;"><a href="{{ post.url }}" style="text-decoration: none; color: #333;">{{ post.title }}</a></h3>
    {% if post.excerpt %}
      <p style="margin: 0.5rem 0;">{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
    {% endif %}
    <a href="{{ post.url }}" style="color: #007acc; font-weight: bold;">Read Part {{ post.series.part }} →</a>
  </article>
  {% endfor %}
  {% endif %}
  
  <!-- Bonus Articles -->
  {% assign bonus_posts = site.posts | where_exp: "post", "post.series.name != 'How U.S. Payments Really Work'" %}
  {% if bonus_posts.size > 0 %}
  <h3 id="bonus-articles" style="margin-top: 3rem;">✨ Bonus Articles</h3>
  <p style="color: #666; margin-bottom: 1.5rem;">Spontaneous deep dives and thoughts from the field — outside the main series.</p>
  {% for post in bonus_posts %}
  <article style="margin-bottom: 1.5rem; padding: 1.5rem; border: 1px solid #ddd; border-radius: 8px;">
    <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem;">
      <span style="background: #28a745; color: white; padding: 0.25rem 0.5rem; border-radius: 4px; font-size: 0.8rem; font-weight: bold;">
        Bonus
      </span>
      <span style="color: #666; font-size: 0.9rem;">{{ post.date | date: "%B %d, %Y" }}</span>
      {% if post.categories %}
        <span style="color: #666; font-size: 0.9rem;">• {{ post.categories | join: ", " }}</span>
      {% endif %}
    </div>
    <h3 style="margin: 0.5rem 0;"><a href="{{ post.url }}" style="text-decoration: none; color: #333;">{{ post.title }}</a></h3>
    {% if post.excerpt %}
      <p style="margin: 0.5rem 0;">{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
    {% endif %}
    <a href="{{ post.url }}" style="color: #28a745; font-weight: bold;">Read more →</a>
  </article>
  {% endfor %}
  {% endif %}
  
  <!-- All Posts Fallback -->
  <h3 id="all-posts" style="margin-top: 3rem;">📄 All Posts</h3>
  {% for post in site.posts %}
  <article style="margin-bottom: 1rem; padding-bottom: 1rem; border-bottom: 1px solid #eee;">
    <h4 style="margin: 0;"><a href="{{ post.url }}" style="text-decoration: none;">{{ post.title }}</a></h4>
    <p style="color: #666; font-size: 0.9rem; margin: 0.25rem 0;">
      <time>{{ post.date | date: "%B %d, %Y" }}</time>
      {% if post.categories %} • {{ post.categories | join: ", " }}{% endif %}
      {% if post.series.name %} • {{ post.series.name }} (Part {{ post.series.part }}){% endif %}
    </p>
  </article>
  {% endfor %}
{% else %}
  <div style="text-align: center; padding: 2rem; color: #666;">
    <p>Posts are loading... If this persists, the site may still be building.</p>
    <p><strong>Expected posts:</strong></p>
    <ul style="list-style: none;">
      <li>• <a href="/fintech/payments/2025/08/13/money-flow-bank-account.html">How Money Moves In And Out Of Your Bank Account?</a></li>
    </ul>
  </div>
{% endif %}
