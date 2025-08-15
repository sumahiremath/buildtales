---
layout: default
title: Build Tales
---
<link rel="stylesheet" href="/assets/css/style.css">

## Engineering Leadership & Complex Systems

> *"Stories and insights from the journey of building teams, systems, and culture."*

Welcome! I'm **Suma Manjunath**, an engineering leader who writes about the intersection of **fintech**, **systems design**, and **team building**. If you're scaling systems, leading teams, or navigating complex technical domains, you're in the right place.

---

## Latest Article

{% if site.posts.size > 0 %}
  {% assign featured_post = site.posts.first %}
  <div style="border-left: 4px solid #157878; padding: 1.5rem; margin: 1rem 0; background: #f8f9fa;">
    <h3 style="margin-top: 0;"><a href="{{ featured_post.url }}" style="text-decoration: none; color: #333;">{{ featured_post.title }}</a></h3>
    <p style="color: #666; margin: 0.5rem 0; font-size: 0.9rem;">{{ featured_post.date | date: "%B %d, %Y" }}</p>
    <p style="margin: 1rem 0;">{{ featured_post.excerpt | strip_html | truncatewords: 20 }}</p>
    <a href="{{ featured_post.url }}" style="color: #157878; font-weight: bold;">Read more →</a>
  </div>
{% endif %}

## Featured Series

<div style="background: #157878; color: white; padding: 1.5rem; border-radius: 6px; margin: 1.5rem 0;">
  <h3 style="margin-top: 0; color: white;">How U.S. Payments Really Work</h3>
  <p style="margin: 0.5rem 0; opacity: 0.9;">A survival manual for building resilient platforms that move money — and earn trust.</p>
  <p style="font-size: 0.9rem; margin: 1rem 0; opacity: 0.8;">3 of 45 articles published</p>
  <a href="/how-us-payments-actually-work/" style="background: rgba(255,255,255,0.15); color: white; padding: 0.6rem 1.2rem; border-radius: 4px; text-decoration: none; font-weight: 500; display: inline-block;">
    View Complete Series →
  </a>
</div>

## Recent Articles

{% for post in site.posts limit:2 %}
<article style="margin: 1rem 0; padding-bottom: 1rem; border-bottom: 1px solid #eee;">
  <h4 style="margin: 0 0 0.5rem 0;"><a href="{{ post.url }}" style="text-decoration: none; color: #333;">{{ post.title }}</a></h4>
  <p style="color: #666; font-size: 0.9rem; margin: 0.25rem 0;">{{ post.date | date: "%B %d, %Y" }}</p>
</article>
{% endfor %}

<div style="text-align: center; margin: 2rem 0;">
  <a href="/blog/" style="background: #157878; color: white; padding: 0.75rem 1.5rem; text-decoration: none; border-radius: 4px; font-weight: 500;">Read All Articles</a>
  <a href="/about/" style="background: transparent; color: #157878; padding: 0.75rem 1.5rem; text-decoration: none; border: 2px solid #157878; border-radius: 4px; font-weight: 500; margin-left: 1rem;">About</a>
</div>

---

<div style="text-align: center; padding: 1rem; background: #f8f9fa; border-radius: 8px;">
  <p style="margin: 0;"><strong>Building something interesting?</strong> I'd love to hear about it!</p>
  <small>Find me on <a href="https://linkedin.com/in/sumamanjunath">LinkedIn</a> or drop me a line.</small>
</div>
