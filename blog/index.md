---
layout: default
title: "Blog"
---

# Blog

Here’s a collection of posts from the field — lessons learned, patterns discovered, and occasional rants with love.

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>  
      <br /><small>{{ post.date | date: "%B %d, %Y" }}</small>
    </li>
  {% endfor %}
</ul>
