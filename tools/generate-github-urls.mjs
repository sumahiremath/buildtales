#!/usr/bin/env node
import fs from "fs/promises";
import path from "path";
import globby from "globby";
import pc from "picocolors";

const DIAGRAMS_DIR = "assets/diagrams";
const REPO_OWNER = process.env.GITHUB_REPOSITORY_OWNER || "your-username";
const REPO_NAME = process.env.GITHUB_REPOSITORY?.split("/")[1] || "buildtales";
const BRANCH = process.env.GITHUB_REF_NAME || "main";

async function main() {
  try {
    // Check if diagrams directory exists
    try {
      await fs.access(DIAGRAMS_DIR);
    } catch {
      console.log(pc.yellow(`No diagrams directory found at ${DIAGRAMS_DIR}`));
      console.log(pc.cyan("Run 'npm run ci:render' first to generate diagrams"));
      return;
    }

    // Find all image files
    const imageFiles = await globby([`${DIAGRAMS_DIR}/**/*.{svg,png,jpg,jpeg,gif,webp}`]);
    
    if (imageFiles.length === 0) {
      console.log(pc.yellow("No image files found in diagrams directory"));
      return;
    }

    const imageManifest = {};
    
    for (const file of imageFiles) {
      const filename = path.basename(file);
      const relativePath = path.relative(process.cwd(), file);
      
      // Generate GitHub URLs
      const rawUrl = `https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/${BRANCH}/${relativePath}`;
      const blobUrl = `https://github.com/${REPO_OWNER}/${REPO_NAME}/blob/${BRANCH}/${relativePath}`;
      
      imageManifest[filename] = {
        filename,
        relativePath,
        rawUrl,        // Direct image URL
        blobUrl,       // GitHub page URL
        localPath: file
      };
    }

    // Save manifest
    await fs.writeFile(
      "assets/diagrams-manifest.json", 
      JSON.stringify(imageManifest, null, 2)
    );

    console.log(pc.green(`Generated image manifest for ${Object.keys(imageManifest).length} images`));
    console.log(pc.cyan(`Manifest saved to: assets/diagrams-manifest.json`));
    console.log(pc.cyan(`\nImage URLs will be in format:`));
    console.log(pc.cyan(`https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/${BRANCH}/assets/diagrams/filename.svg`));
    
    // Show sample URLs
    const sampleImages = Object.values(imageManifest).slice(0, 3);
    if (sampleImages.length > 0) {
      console.log(pc.yellow(`\nSample image URLs:`));
      sampleImages.forEach(img => {
        console.log(pc.cyan(`  ${img.filename}: ${img.rawUrl}`));
      });
    }

  } catch (error) {
    console.error(pc.red(`Error: ${error.message}`));
    process.exit(1);
  }
}

main();
