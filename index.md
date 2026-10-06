---
layout: default
title: Home
---

This site is built by `jekyll build` inside a Docker image and served by nginx on [SnapDeploy](https://snapdeploy.dev). Every push to the repository rebuilds it.

## Posts
{% for post in site.posts %}
- [{{ post.title }}]({{ post.url | relative_url }}) — {{ post.date | date: "%-d %B %Y" }}
{% endfor %}
