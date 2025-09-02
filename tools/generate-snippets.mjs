#!/usr/bin/env node
import fs from "node:fs/promises";
import path from "path";
import globby from "globby";
import matter from "gray-matter";
import pc from "picocolors";

const root = process.argv[2] || "dist";

function truncate(str, n) {
  if (str.length <= n) return str;
  return str.slice(0, n - 1) + "…";
}

async function main() {
  const files = await globby([`${root}/**/*.md`]);
  const packs = [];

  for (const file of files) {
    const raw = await fs.readFile(file, "utf8");
    const { data, content } = matter(raw);
    const title = data.title || path.basename(file, ".md");
    const url = data.canonical_url || data.url || data.link || "https://buildtales.dev/";
    const tldr = extractTLDR(content);
    const excerpt = extractExcerpt(content);
    const tags = extractTags(data, content);

    // LinkedIn (≤1300 chars).
    const li = truncate(`${title}\n\n${tldr}\n\nRead more: ${url}`, 1300);

    // X/Twitter: first + 2 follow-ups from headings.
    const bullets = extractBullets(content);
    const tw1 = truncate(`${title} — ${tldr}\n\n${url}`, 260);
    const tw2 = truncate(`• ${bullets[0] || "Problem → Solution in 2h"} #buildtales`, 260);
    const tw3 = truncate(`• ${bullets[1] || "Runnable code + monitoring included"}`, 260);

    const fb = truncate(`${title}\n\n${tldr}\n\nFull article: ${url}`, 2200);
    const mdn = truncate(`${title}\n${tldr}\n${url}`, 500);

    // Medium-specific content
    const medium = {
      title: title,
      content: content,
      tags: tags.slice(0, 5), // Medium allows max 5 tags
      canonicalUrl: url,
      publishStatus: "draft" // Start as draft for review
    };

    // Substack-specific content
    const substack = {
      title: title,
      subtitle: excerpt,
      body: content,
      tags: tags.slice(0, 10), // Substack allows more tags
      isPublished: false, // Start unpublished for review
      sendEmail: true
    };

    packs.push({
      source: path.basename(file),
      title,
      url,
      linkedin: li,
      twitter_thread: [tw1, tw2, tw3],
      facebook: fb,
      mastodon: mdn,
      medium,
      substack
    });
  }

  await fs.writeFile("dist/social-snippets.json", JSON.stringify(packs, null, 2));
  console.log(pc.green(`Wrote dist/social-snippets.json (${packs.length} posts)`));
}

function extractTLDR(md) {
  const m = md.match(/\*\*TL;DR\.:?\*\*[\s\S]*?(?=\n\n|$)/i);
  if (!m) return "TL;DR coming in hot: practical, runnable steps + validation.";
  return m[0].replace(/^\*\*TL;DR\.:?\*\*\s*/i, "").trim();
}

function extractExcerpt(md) {
  // Extract first paragraph after TL;DR or first meaningful paragraph
  const lines = md.split('\n');
  let startIndex = 0;
  
  // Find start of content after frontmatter and TL;DR
  for (let i = 0; i < lines.length; i++) {
    if (lines[i].match(/^\*\*TL;DR\.:?\*\*/i)) {
      startIndex = i + 1;
      break;
    }
  }
  
  // Find first non-empty paragraph
  for (let i = startIndex; i < lines.length; i++) {
    if (lines[i].trim() && !lines[i].startsWith('#')) {
      return lines[i].trim();
    }
  }
  
  return "Practical insights for engineering leaders and fintech engineers.";
}

function extractTags(data, content) {
  // Extract tags from frontmatter or generate from content
  if (data.tags && Array.isArray(data.tags)) {
    return data.tags;
  }
  
  if (data.categories && Array.isArray(data.categories)) {
    return data.categories;
  }
  
  // Generate tags from content if none provided
  const defaultTags = [
    "engineering-leadership",
    "fintech",
    "payments",
    "ach",
    "compliance",
    "systems-design"
  ];
  
  return defaultTags;
}

function extractBullets(md) {
  const headings = [...md.matchAll(/^#{2,3}\s+(.+)$/gm)].map(m => m[1].trim());
  return headings.slice(0, 2);
}

main().catch(err => {
  console.error(pc.red(err.stack || err.message));
  process.exit(1);
});
