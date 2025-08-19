# Daily Build Scheduling

This repository is configured to automatically build and deploy the site daily at 3 AM Pacific Time (11 AM UTC) to ensure future-dated posts are published on their scheduled dates.

## How It Works

1. **GitHub Actions Workflow**: `.github/workflows/daily-build.yml` runs automatically every day at 3 AM Pacific
2. **Future Posts Enabled**: Jekyll is configured with `future: true` to include posts with future dates
3. **Automatic Deployment**: The workflow builds the site and deploys it to GitHub Pages

## Schedule Details

- **Time**: 3:00 AM Pacific Time (11:00 AM UTC)
- **Frequency**: Daily
- **Trigger**: Automated via GitHub Actions cron job
- **Manual Trigger**: Available via GitHub Actions UI (workflow_dispatch)

## Future-Dated Posts

Posts with dates in the future will be:
- ✅ **Included** in the daily build
- ✅ **Published** when their date arrives
- ✅ **Automatically deployed** to the live site

## Example Future Post

```yaml
---
layout: default
title: "Future Post Example"
date: 2025-08-25  # This post will be published on August 25, 2025
categories: [example]
---
```

## Manual Build

If you need to trigger a build manually:

1. Go to the **Actions** tab in your GitHub repository
2. Select **Daily Build and Deploy** workflow
3. Click **Run workflow**
4. Select the branch (usually `main`)
5. Click **Run workflow**

## Troubleshooting

- **Posts not appearing**: Check that the date is correct and not in the past
- **Build failures**: Check the Actions tab for error logs
- **Deployment issues**: Verify GitHub Pages settings in repository settings

## Time Zone Notes

- The workflow runs at 11 AM UTC (3 AM Pacific)
- All post dates should be in your local time zone
- GitHub Actions uses UTC for scheduling
