---
layout: default
title: Build Tales
---
<link rel="stylesheet" href="/assets/css/style.css">

## Engineering Leadership & Complex Systems

> *"Stories and insights from the journey of building teams, systems, and culture."*

Welcome! I'm **Suma Manjunath**, an engineering leader who writes about the intersection of **fintech**, **systems design**, and **team building**. If you're scaling systems, leading teams, or navigating complex technical domains, you're in the right place.

---

## 🔥 Featured Content

{% if site.posts.size > 0 %}
  {% assign featured_post = site.posts.first %}
  <div style="border: 2px solid #157878; border-radius: 8px; padding: 1.5rem; margin: 1.5rem 0; background: #f8f9fa;">
    <h3 style="margin-top: 0;"><a href="{{ featured_post.url }}" style="text-decoration: none; color: #157878;">{{ featured_post.title }}</a></h3>
    <p style="color: #666; margin: 0.5rem 0;">{{ featured_post.date | date: "%B %d, %Y" }} • {{ featured_post.categories | join: ", " }}</p>
    <p>{{ featured_post.excerpt | strip_html | truncatewords: 25 }}</p>
    <a href="{{ featured_post.url }}" style="font-weight: bold; color: #157878;">Read the full deep dive →</a>
  </div>
{% endif %}

## 📚 What You'll Learn

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin: 1.5rem 0;">
  <div style="padding: 1rem; border-left: 4px solid #157878;">
    <strong>💰 Fintech Engineering</strong><br>
    <small>Payment systems, ACH, real-time rails, compliance</small>
  </div>
  <div style="padding: 1rem; border-left: 4px solid #157878;">
    <strong>🏗️ Systems Design</strong><br>
    <small>Scaling backends, architecture patterns, reliability</small>
  </div>
  <div style="padding: 1rem; border-left: 4px solid #157878;">
    <strong>👥 Engineering Leadership</strong><br>
    <small>Team building, career growth, technical strategy</small>
  </div>
  <div style="padding: 1rem; border-left: 4px solid #157878;">
    <strong>🧪 Lessons from the Field</strong><br>
    <small>Real stories, patterns, wins, and failures</small>
  </div>
</div>

## 📖 Recent Posts

{% for post in site.posts limit:3 %}
<article style="margin: 1rem 0; padding: 1rem 0; border-bottom: 1px solid #eee;">
  <h4 style="margin: 0;"><a href="{{ post.url }}" style="text-decoration: none;">{{ post.title }}</a></h4>
  <small style="color: #666;">{{ post.date | date: "%B %d, %Y" }}</small>
  <p style="margin: 0.5rem 0;">{{ post.excerpt | strip_html | truncatewords: 15 }}</p>
</article>
{% endfor %}

<div style="text-align: center; margin: 2rem 0;">
  <a href="/blog/" style="background: #157878; color: white; padding: 0.75rem 1.5rem; text-decoration: none; border-radius: 4px; font-weight: bold;">📝 Read All Posts</a>
  <a href="/about/" style="background: transparent; color: #157878; padding: 0.75rem 1.5rem; text-decoration: none; border: 2px solid #157878; border-radius: 4px; font-weight: bold; margin-left: 1rem;">👤 About Me</a>
</div>

---

<div style="text-align: center; padding: 1rem; background: #f8f9fa; border-radius: 8px;">
  <p style="margin: 0;"><strong>Building something interesting?</strong> I'd love to hear about it!</p>
  <small>Find me on <a href="https://linkedin.com/in/sumamanjunath">LinkedIn</a> or drop me a line.</small>
</div>
