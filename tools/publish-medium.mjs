#!/usr/bin/env node
import fs from "fs/promises";
import pc from "picocolors";

const MEDIUM_ACCESS_TOKEN = process.env.MEDIUM_ACCESS_TOKEN;
const MEDIUM_USER_ID = process.env.MEDIUM_USER_ID;

if (!MEDIUM_ACCESS_TOKEN || !MEDIUM_USER_ID) {
  console.error(pc.red("Missing env: MEDIUM_ACCESS_TOKEN, MEDIUM_USER_ID"));
  process.exit(1);
}

async function publishToMedium(articleData) {
  const { title, content, tags, canonicalUrl, publishStatus } = articleData;
  
  // Medium API endpoint
  const url = `https://api.medium.com/v1/users/${MEDIUM_USER_ID}/posts`;
  
  // Format content for Medium (convert markdown to HTML if needed)
  const formattedContent = await formatContentForMedium(content);
  
  const payload = {
    title: title,
    contentFormat: "markdown", // Medium supports markdown
    content: formattedContent,
    tags: tags,
    canonicalUrl: canonicalUrl,
    publishStatus: publishStatus, // "draft" or "public"
    license: "all-rights-reserved"
  };
  
  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${MEDIUM_ACCESS_TOKEN}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(payload)
    });
    
    if (!response.ok) {
      const error = await response.text();
      throw new Error(`Medium API error: ${response.status} - ${error}`);
    }
    
    const result = await response.json();
    return {
      success: true,
      postId: result.data.id,
      url: result.data.url,
      publishedAt: result.data.publishedAt
    };
  } catch (error) {
    return {
      success: false,
      error: error.message
    };
  }
}

async function formatContentForMedium(content) {
  // Medium handles most markdown well, but we can optimize here
  // Convert any custom syntax if needed
  
  // Ensure images have proper alt text
  let formatted = content.replace(
    /!\[([^\]]*)\]\(([^)]+)\)/g,
    (match, alt, url) => {
      if (!alt || alt === "Diagram") {
        alt = "Technical diagram from Build Tales";
      }
      return `![${alt}](${url})`;
    }
  );
  
  // Add Medium-specific formatting if needed
  // Medium supports most standard markdown
  
  return formatted;
}

async function main() {
  try {
    const snippetsPath = "dist/social-snippets.json";
    const snippets = JSON.parse(await fs.readFile(snippetsPath, "utf8"));
    
    console.log(pc.cyan(`Found ${snippets.length} articles to process`));
    
    const results = [];
    
    for (const snippet of snippets) {
      if (snippet.medium) {
        console.log(pc.yellow(`Publishing "${snippet.title}" to Medium...`));
        
        const result = await publishToMedium(snippet.medium);
        results.push({
          title: snippet.title,
          medium: result
        });
        
        if (result.success) {
          console.log(pc.green(`✓ Published to Medium: ${result.url}`));
        } else {
          console.log(pc.red(`✗ Failed to publish to Medium: ${result.error}`));
        }
        
        // Rate limiting - Medium allows 10 requests per minute
        await new Promise(resolve => setTimeout(resolve, 6000));
      }
    }
    
    // Save results
    await fs.writeFile(
      "dist/medium-publish-results.json", 
      JSON.stringify(results, null, 2)
    );
    
    console.log(pc.green(`\nMedium publishing complete. Results saved to dist/medium-publish-results.json`));
    
  } catch (error) {
    console.error(pc.red(`Error: ${error.message}`));
    process.exit(1);
  }
}

main();
