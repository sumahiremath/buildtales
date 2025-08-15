---
layout: default
title: "Blog"
---

# Blog

Here's a collection of posts from the field — lessons learned, patterns discovered, and occasional rants with love.

## Featured Series

<div style="background: linear-gradient(135deg, #007acc, #0099ff); color: white; padding: 2rem; border-radius: 8px; margin: 2rem 0;">
  <h3 style="margin-top: 0; color: white;">How U.S. Payments Really Work</h3>
  <p style="font-size: 1.1rem; line-height: 1.6;">A survival manual for building resilient platforms that move money — and earn trust. A comprehensive 45-article series covering everything from ACH basics to advanced compliance strategies and fintech leadership insights.</p>
  <p><strong>Progress:</strong> 3 of 45 articles published • <strong>Target completion:</strong> Q3 2026</p>
  <a href="/rebuilding-us-payments/" style="background: rgba(255,255,255,0.2); color: white; padding: 0.75rem 1.5rem; border-radius: 4px; text-decoration: none; display: inline-block; margin-top: 1rem;">
    View Complete Series Roadmap →
  </a>
</div>

{% if site.posts.size > 0 %}
  {% for post in site.posts %}
  <article style="margin-bottom: 2rem; padding-bottom: 1rem; border-bottom: 1px solid #eee;">
    <h2><a href="{{ post.url }}" style="text-decoration: none;">{{ post.title }}</a></h2>
    <p style="color: #666; font-size: 0.9rem;">
      <time>{{ post.date | date: "%B %d, %Y" }}</time> • 
      {% if post.categories %}{{ post.categories | join: ", " }}{% endif %}
    </p>
    {% if post.excerpt %}
      <p>{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
    {% endif %}
    <p><a href="{{ post.url }}">Read more →</a></p>
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
