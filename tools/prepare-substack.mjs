#!/usr/bin/env node
import fs from "fs/promises";
import path from "path";
import pc from "picocolors";

async function prepareSubstackContent(articleData) {
  const { title, subtitle, body, tags, isPublished, sendEmail } = articleData;
  
  // Substack content preparation
  // Since Substack has limited API access, we'll prepare the content
  // for manual copy-paste or use their email publishing feature
  
  const substackContent = {
    title: title,
    subtitle: subtitle,
    body: body,
    tags: tags,
    metadata: {
      isPublished: isPublished,
      sendEmail: sendEmail,
      publishDate: new Date().toISOString(),
      estimatedReadTime: calculateReadTime(body)
    }
  };
  
  return substackContent;
}

function calculateReadTime(content) {
  // Rough estimate: 200 words per minute
  const wordCount = content.split(/\s+/).length;
  const minutes = Math.ceil(wordCount / 200);
  return `${minutes} min read`;
}

async function main() {
  try {
    const snippetsPath = "dist/social-snippets.json";
    const snippets = JSON.parse(await fs.readFile(snippetsPath, "utf8"));
    
    console.log(pc.cyan(`Preparing ${snippets.length} articles for Substack...`));
    
    const substackArticles = [];
    
    for (const snippet of snippets) {
      if (snippet.substack) {
        console.log(pc.yellow(`Preparing "${snippet.title}" for Substack...`));
        
        const substackContent = await prepareSubstackContent(snippet.substack);
        substackArticles.push(substackContent);
      }
    }
    
    // Save Substack-ready content
    await fs.writeFile(
      "dist/substack-articles.json", 
      JSON.stringify(substackArticles, null, 2)
    );
    
    // Create individual markdown files for easy copy-paste
    const substackDir = "dist/substack";
    await fs.mkdir(substackDir, { recursive: true });
    
    for (const article of substackArticles) {
      const filename = `${slugify(article.title)}.md`;
      const filepath = path.join(substackDir, filename);
      
      const markdownContent = `# ${article.title}

${article.subtitle ? `## ${article.subtitle}\n` : ''}

${article.body}

---
*Published on ${new Date().toLocaleDateString()} | ${article.metadata.estimatedReadTime} | Tags: ${article.tags.join(', ')}*
`;
      
      await fs.writeFile(filepath, markdownContent, "utf8");
      console.log(pc.green(`✓ Created ${filename}`));
    }
    
    // Create a summary file with instructions
    const instructions = `# Substack Publishing Instructions

## Automated Content Preparation Complete

${substackArticles.length} articles have been prepared for Substack publishing.

## What's Been Created

1. **substack-articles.json** - Complete article data in JSON format
2. **substack/** - Individual markdown files for each article

## Publishing Options

### Option 1: Manual Copy-Paste
1. Copy content from individual .md files in the substack/ folder
2. Paste into Substack's editor
3. Add tags, set publish date, and configure email settings
4. Publish manually

### Option 2: Email Publishing
1. Use the markdown files as email content
2. Send via Substack's email publishing feature
3. Articles will be automatically added to your archive

### Option 3: RSS Import (if available)
1. Use the JSON data to create RSS feeds
2. Import RSS feeds into Substack
3. Automate future updates

## Next Steps

- Review prepared content in the substack/ folder
- Customize any articles before publishing
- Set up recurring automation if desired
- Monitor performance and engagement

## Notes

- All articles start as unpublished drafts
- Email notifications are enabled by default
- Tags are automatically assigned based on content
- Read time estimates are calculated automatically
`;
    
    await fs.writeFile(path.join(substackDir, "PUBLISHING_INSTRUCTIONS.md"), instructions);
    
    console.log(pc.green(`\nSubstack preparation complete!`));
    console.log(pc.cyan(`- JSON data: dist/substack-articles.json`));
    console.log(pc.cyan(`- Markdown files: dist/substack/`));
    console.log(pc.cyan(`- Instructions: dist/substack/PUBLISHING_INSTRUCTIONS.md`));
    
  } catch (error) {
    console.error(pc.red(`Error: ${error.message}`));
    process.exit(1);
  }
}

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/[\s_-]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

main();
