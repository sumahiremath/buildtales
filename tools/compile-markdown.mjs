#!/usr/bin/env node
import fs from "fs/promises";
import path from "path";
import globby from "globby";
import pc from "picocolors";

const files = process.argv.slice(2);
const manifestPath = "assets/diagrams-manifest.json";
const DISCLAIMER = "⚠️ **Disclaimer**: All scenarios, accounts, names, and data used in examples are not real. They are realistic scenarios provided only for educational and illustrative purposes.";

const MERMAID_RE = /```mermaid\s*\n([\s\S]*?)\n```/g;
const TLDR_RE = /(\*\*TL;DR\.:?\*\*[\s\S]*?)(?:\n\n|\r\n\r\n)/i;

async function main() {
  // Check if image manifest exists
  let imageManifest = {};
  try {
    imageManifest = JSON.parse(await fs.readFile(manifestPath, "utf8"));
    console.log(pc.cyan(`Loaded image manifest with ${Object.keys(imageManifest).length} images`));
  } catch (error) {
    console.log(pc.yellow(`No image manifest found at ${manifestPath}`));
    console.log(pc.cyan("Run 'npm run ci:render' and 'npm run ci:github-urls' first"));
  }

  const mdFiles = await globby(files);
  await fs.rm("dist", { recursive: true, force: true });
  await fs.mkdir("dist", { recursive: true });

  for (const file of mdFiles) {
    let md = await fs.readFile(file, "utf8");

    // Insert disclaimer right after TL;DR if not already present
    if (!md.includes(DISCLAIMER)) {
      md = md.replace(TLDR_RE, (m) => `${m}\n\n> ${DISCLAIMER}\n\n`);
    }

    // For each mermaid block, append static image fallback after it.
    let index = 0;
    md = md.replace(MERMAID_RE, (whole, code) => {
      const base = path
        .relative(process.cwd(), file)
        .replace(/[\\/]/g, "_")
        .replace(/\.md$/i, "");
      
      const crypto = awaitDynamic("node:crypto"); // lazy import
      const hash = crypto.createHash("sha1").update(code.trim()).digest("hex").slice(0, 10);
      const name = `${base}__m${index}-${hash}.svg`;
      index++;

      const imageInfo = imageManifest[name];
      const fallback = imageInfo ? `\n\n![Diagram](${imageInfo.rawUrl})\n` : "\n";
      return `\`\`\`mermaid\n${code}\n\`\`\`${fallback}`;
    });

    const out = path.join("dist", path.basename(file));
    await fs.writeFile(out, md, "utf8");
    console.log(pc.green(`Wrote ${out}`));
  }
}

async function awaitDynamic(spec) {
  return (await import(spec)).default ?? (await import(spec));
}

main().catch(err => {
  console.error(pc.red(err.stack || err.message));
  process.exit(1);
});
