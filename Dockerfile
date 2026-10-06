# Jekyll site on SnapDeploy: build with Ruby, serve the static result with nginx.
# Stage 1 runs `jekyll build`; stage 2 contains only the generated _site and nginx.

FROM ruby:3.3-slim AS build
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /site
COPY Gemfile Gemfile.lock* ./
RUN bundle install --jobs 4
COPY . .
# JEKYLL_ENV=production enables the usual production conditionals in templates and plugins
RUN JEKYLL_ENV=production bundle exec jekyll build --destination /site/_site

FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /site/_site /usr/share/nginx/html
EXPOSE 80
