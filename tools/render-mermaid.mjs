#!/usr/bin/env node
import { spawn } from "node:child_process";
import fs from "node:fs/promises";
import path from "path";
import crypto from "node:crypto";
import globby from "globby";
import pc from "picocolors";

const args = process.argv.slice(2);
const patterns = args.filter(a => !a.startsWith("--"));
const outDir = arg("--out", "assets/diagrams");
const imageType = arg("--image-type", "svg");
const theme = arg("--theme", "neutral");

function arg(flag, def) {
  const i = args.indexOf(flag);
  return i >= 0 ? args[i + 1] : def;
}

const MERMAID_RE = /```mermaid\s*\n([\s\S]*?)\n```/g;

async function main() {
  await fs.mkdir(outDir, { recursive: true });
  const files = await globby(patterns);
  let total = 0;

  for (const file of files) {
    const md = await fs.readFile(file, "utf8");
    const mermaids = [...md.matchAll(MERMAID_RE)];
    if (!mermaids.length) continue;

    const relBase = path.relative(process.cwd(), file).replace(/[\\/]/g, "_");
    let idx = 0;

    for (const m of mermaids) {
      const code = m[1].trim();
      const hash = crypto.createHash("sha1").update(code).digest("hex").slice(0, 10);
      const baseName = `${relBase.replace(/\.md$/i, "")}__m${idx}-${hash}`;
      const mmdPath = path.join(outDir, `${baseName}.mmd`);
      const outPath = path.join(outDir, `${baseName}.${imageType}`);

      await fs.writeFile(mmdPath, code, "utf8");
      await renderMermaid(mmdPath, outPath);
      total++;
      idx++;
    }
  }
  console.log(pc.green(`Rendered ${total} diagram(s) → ${outDir}`));
  console.log(pc.cyan(`Images saved locally - commit them to use GitHub's free image hosting`));
}

function renderMermaid(inFile, outFile) {
  return new Promise((resolve, reject) => {
    const proc = spawn("npx", [
      "-y", "@mermaid-js/mermaid-cli",
      "-i", inFile,
      "-o", outFile,
      "-b", "transparent",
      "-t", theme
    ], { stdio: "inherit" });

    proc.on("exit", code => code === 0 ? resolve() : reject(new Error(`mmdc failed: ${code}`)));
  });
}

main().catch(err => {
  console.error(pc.red(err.stack || err.message));
  process.exit(1);
});
