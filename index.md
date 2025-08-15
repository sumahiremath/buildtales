---
layout: default
title: Build Tales
---
<link rel="stylesheet" href="/assets/css/style.css">

_A blog by Suma, where engineering leadership, complex systems, and team culture come together._

> “Stories and insights from the journey of building teams, systems, and culture.”

---

### What You'll Find Here

-  Fintech engineering
-  Systems design & scale
-  Leadership growth
-  Team dynamics and culture

---

### Latest Posts

{% for post in site.posts limit:3 %}
- **[{{ post.title }}]({{ post.url }})** - {{ post.date | date: "%B %d, %Y" }}  
  {{ post.excerpt | strip_html | truncatewords: 20 }}
{% endfor %}

[📝 Read All Posts](/blog/) | [👤 About Me](/about/)
