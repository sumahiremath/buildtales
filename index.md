---
layout: default
title: Build Tales
---
<link rel="stylesheet" href="/assets/css/style.css">

## Engineering Leadership & Complex Systems

> *"Stories and insights from the journey of building teams, systems, and culture."*

Welcome! I'm **Suma Manjunath**, an engineering leader who writes about the intersection of **fintech**, **systems design**, and **team building**. If you're scaling systems, leading teams, or navigating complex technical domains, you're in the right place.

---

## Featured Series

<div style="background: #157878; color: white; padding: 2rem; border-radius: 6px; margin: 2rem 0; text-align: center;">
  <h3 style="margin-top: 0; color: white; font-size: 1.4rem;">How U.S. Payments Really Work</h3>
  <p style="margin: 1rem 0; opacity: 0.9; font-size: 1.1rem;">A survival manual for building resilient platforms that move money — and earn trust.</p>
  <p style="font-size: 0.95rem; margin: 1.5rem 0; opacity: 0.85;">45-article deep dive into payment systems, compliance, and fintech leadership</p>
  <div style="margin: 1.5rem 0;">
    <span style="background: rgba(255,255,255,0.2); padding: 0.5rem 1rem; border-radius: 20px; font-size: 0.9rem;">
      3 of 45 articles published
    </span>
  </div>
  <div style="margin-top: 1.5rem; display: flex; flex-wrap: wrap; gap: 1rem; justify-content: center;">
    <a href="/how-us-payments-actually-work/" style="background: rgba(255,255,255,0.15); color: white; padding: 0.75rem 1.5rem; border-radius: 4px; text-decoration: none; font-weight: 500; flex: 1; min-width: 200px; max-width: 250px; text-align: center;">
      View Complete Series
    </a>
    <a href="/fintech/payments/2025/08/13/money-flow-bank-account.html" style="background: white; color: #157878; padding: 0.75rem 1.5rem; border-radius: 4px; text-decoration: none; font-weight: 500; flex: 1; min-width: 200px; max-width: 250px; text-align: center;">
      Start Reading
    </a>
  </div>
</div>

## Recent Articles

{% for post in site.posts limit:3 %}
<article style="margin: 1rem 0; padding-bottom: 1rem; border-bottom: 1px solid #eee;">
  <h4 style="margin: 0 0 0.5rem 0;"><a href="{{ post.url }}" style="text-decoration: none; color: #333;">{{ post.title }}</a></h4>
  <p style="color: #666; font-size: 0.9rem; margin: 0.25rem 0;">{{ post.date | date: "%B %d, %Y" }}</p>
  <p style="color: #777; font-size: 0.9rem; margin: 0.5rem 0;">{{ post.excerpt | strip_html | truncatewords: 15 }}</p>
</article>
{% endfor %}

<div style="margin: 2rem 0; display: flex; flex-wrap: wrap; gap: 1rem; justify-content: center;">
  <a href="/blog/" style="background: #157878; color: white; padding: 0.75rem 1.5rem; text-decoration: none; border-radius: 4px; font-weight: 500; flex: 1; min-width: 180px; max-width: 220px; text-align: center;">Read All Articles</a>
  <a href="/about/" style="background: transparent; color: #157878; padding: 0.75rem 1.5rem; text-decoration: none; border: 2px solid #157878; border-radius: 4px; font-weight: 500; flex: 1; min-width: 180px; max-width: 220px; text-align: center;">About</a>
</div>


