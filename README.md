# Jekyll on SnapDeploy

A minimal [Jekyll](https://jekyllrb.com) 4 site (no theme gem: one layout, one post, one page) with a two-stage Dockerfile that lets [SnapDeploy](https://snapdeploy.dev) build and serve it straight from this repository — no Ruby on your machine, no committed `_site`.

| Stage | Image | What happens |
|---|---|---|
| build | `ruby:3.3-slim` | `bundle install`, `JEKYLL_ENV=production jekyll build` |
| serve | `nginx:1.27-alpine` | only the generated `_site` is copied in; `nginx.conf` maps pretty permalinks and the 404 page |

The final image is about 76 MB. Nothing from the Ruby stage ships.

## Deploy on SnapDeploy

Full guide: https://snapdeploy.dev/deploy-jekyll-site

1. Push this repository (or your own site with the same `Dockerfile` and `nginx.conf` at the root) to GitHub.
2. SnapDeploy → Deploy Your Application → GitHub → the repository and branch. The Dockerfile is detected; port 80 comes from `EXPOSE`.
3. Deploy. Every push to the branch rebuilds the site. No environment variables are needed; set `url:` in `_config.yml` to your container URL or custom domain if you generate absolute links (feeds, sitemaps).

## Run locally

```bash
bundle install
bundle exec jekyll serve
```
