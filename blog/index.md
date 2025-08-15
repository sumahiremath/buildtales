---
layout: default
title: "Blog"
---

# Blog

Here's a collection of posts from the field — lessons learned, patterns discovered, and occasional rants with love.

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
      <li>• <a href="/fintech/payments/2024/12/19/money_flow_bank_account.html">How Money Moves In And Out Of Your Bank Account?</a></li>
    </ul>
  </div>
{% endif %}
