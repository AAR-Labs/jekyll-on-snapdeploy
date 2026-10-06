---
layout: post
title: Hello from a container
---

The build runs in a `ruby:3.3-slim` stage, the result is copied into `nginx:alpine`, and the final image is a few dozen megabytes. Nothing from the Ruby stage ships.
