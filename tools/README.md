# Build Tales Automation Tools

This directory contains the automation tools for publishing Build Tales content to multiple platforms using **GitHub's free image hosting**.

## Tools Overview

### Core Tools

- **`render-mermaid.mjs`** - Renders Mermaid diagrams to SVG/PNG files
- **`generate-github-urls.mjs`** - Creates GitHub image URLs for rendered diagrams
- **`compile-markdown.mjs`** - Compiles Markdown with image fallbacks and disclaimer
- **`generate-snippets.mjs`** - Generates social media snippets for all platforms

### Publishing Tools

- **`publish-medium.mjs`** - Publishes articles to Medium via API
- **`prepare-substack.mjs`** - Prepares Substack-ready markdown files

## How It Works

1. **Render Diagrams** → SVG files saved to `assets/diagrams/`
2. **Generate URLs** → GitHub raw URLs in `assets/diagrams-manifest.json`
3. **Compile Content** → Markdown with GitHub image links
4. **Publish** → Medium API + Substack preparation + Zapier triggers

## Why GitHub Images?

- **💰 Free**: No storage or bandwidth costs
- **🚀 Integrated**: Works with your GitHub workflow
- **🌐 Global CDN**: GitHub serves images worldwide
- **📝 Versioned**: Images tied to repository commits

## Usage

```bash
# Complete pipeline
npm run ci:all

# Individual steps
npm run ci:render        # Render diagrams
npm run ci:github-urls   # Generate GitHub URLs
npm run ci:build         # Compile markdown
npm run ci:snippets      # Generate social snippets
npm run ci:medium        # Publish to Medium
npm run ci:substack      # Prepare Substack content
```

## Output

- `assets/diagrams/` - Rendered SVG/PNG images
- `assets/diagrams-manifest.json` - GitHub image URLs
- `dist/` - Compiled content ready for publishing
- `dist/social-snippets.json` - Social media snippets
- `dist/medium-publish-results.json` - Medium publishing results
- `dist/substack/` - Substack-ready markdown files

## Dependencies

- `@mermaid-js/mermaid-cli` - Mermaid diagram rendering
- `gray-matter` - Frontmatter parsing
- `globby` - File pattern matching
- `picocolors` - Terminal colors

## Environment Variables

- `MEDIUM_ACCESS_TOKEN` - Medium API token
- `MEDIUM_USER_ID` - Medium user ID
- `ZAPIER_HOOK_URL` - Zapier webhook URL (optional)

## GitHub Actions

The workflow automatically:
1. Renders diagrams on push
2. Commits images to repository
3. Generates GitHub image URLs
4. Builds content with image fallbacks
5. Publishes to platforms
6. Triggers Zapier workflows

## Benefits Over S3

| Feature | GitHub Images | S3 + CloudFront |
|---------|---------------|------------------|
| Cost | **Free** | $5-50+/month |
| Setup | **None** | Complex IAM setup |
| Integration | **Native** | External service |
| Maintenance | **Zero** | Ongoing monitoring |
| Reliability | **GitHub SLA** | AWS SLA |

**GitHub Images save you $60-600+ annually!**
