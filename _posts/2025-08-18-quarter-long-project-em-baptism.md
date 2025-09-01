---
layout: default
title: "When a Supposedly Quarter-Long Project Became My Real EM Baptism"
date: 2025-08-18
categories: [engineering, leadership, management, systems]
section: "Strategies & Tactics"
tags: [engineering-management, project-management, leadership, team-building, technical-decision-making]
excerpt: "Sometimes the projects that look simple on paper become the most transformative experiences. Here's how what was supposed to be a straightforward quarter-long initiative became my real introduction to engineering management."
banner_image: "/assets/banners/resized/20250818mousefinish-blog.jpg"
banner_image_series: "/assets/banners/resized/20250818mousefinish-series.jpg"
banner_color: "#157878"

# Series information
series:
  name: "Leadership Series"
  index_url: "/series/leadership"
  part: 1
  series_type: "Strategies & Tactics"

# Content classification
content_level: "intermediate"
content_type: "personal_experience"

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/engineering/leadership/2025/08/18/quarter-long-project-em-baptism.html"
author:
  name: "Suma Manjunath"
  twitter: "@buildtales"
  
# Open Graph / Social Media
og:
  title: "When a Supposedly Quarter-Long Project Became My Real EM Baptism"
  description: "How a seemingly simple quarter-long project became the real test of engineering management skills - lessons learned about team dynamics, technical decisions, and leadership under pressure."
  type: "article"
  
# Twitter Card
twitter:
  card: "summary"
  title: "When a Supposedly Quarter-Long Project Became My Real EM Baptism"
  description: "How a seemingly simple quarter-long project became the real test of engineering management skills - lessons learned about team dynamics, technical decisions, and leadership under pressure."

# Syndication and Original Content Declaration
robots: "index, follow"
syndication:
  original: true
  republish_allowed: true
  canonical_source: "BuildTales.dev"

# NOTE: No "series" metadata = this will be classified as a bonus article
---

# When a Supposedly Quarter-Long Project Became My Real EM Baptism
*Planned as a 12-week ACH integration, it stretched across 9 months, tested every system I had as a new EM, and became my real baptism into engineering management.*

{% include personal-branding.html %}

<img src="/assets/banners/resized/20250818mousefinish-blog.jpg" alt="Mouse finish line" class="article-header-image"/>

**Audience:** Engineering managers, tech leads, directors of engineering  
**Reading time:** 10 minutes  
**Prerequisites:** Experience managing at least 3 engineers, exposure to cross-functional delivery  
**Why now:** Enterprise integrations are never “just another project.” For new EMs, they are where leadership is tested in fire.

> **TL;DR:**
> - Shared **system maps beat date-driven Gantt charts** every time.
> - **Spreadsheets as slippage radar** prevent end-of-quarter surprises.
> - **Enterprise calendars > sprint velocity** — release trains are the real boss fights.
> - **Operationalize failure modes** before they happen. Fire drills save launches.
> - **Smooth delivery = visible calm, hidden chaos**. That’s the job.

⚠️ **Disclaimer**: This article reflects my real experience as an engineering manager. Specific details, names, and accounts have been generalized for educational purposes.

---

## Problem Definition

**The challenge:** My “simple” quarter-long ACH integration ballooned into a 9-month odyssey. As a first-time EM, I faced unclear requirements, new stakeholders, shifting deadlines, enterprise release cycles, and compliance complexity — all while onboarding a new project manager and product manager.

**Who faces this:** First-time engineering managers handling external integrations, fintech projects tied to NACHA rules, or cross-functional launches where external release schedules dominate.

**Cost of inaction:**
- **Missed launches** due to client release cycle bottlenecks.
- **Stakeholder erosion** when progress is invisible (e.g., tech debt, refactors).
- **Operational risk** if no playbook exists for ACH file errors, reversals, or misreports.

**Why standard advice fails:** Textbook sprint planning assumes stable scope and internal control. In enterprise payments, **external calendars, regulatory reporting, and client freezes dictate the real timeline**.

---

## The Framework: Surviving My First EM Baptism

### Phase 1: Planning Before Dates
- Mapped every ACH flow (NACHA files, reconciliations, consumer bank statements).
- Built **shared diagrams in Miro** as the single reference point.
- Delayed timelines until alignment was reached.

💡 **Tip:** *Flows don’t lie. Dates do.*

---

### Phase 2: Slippage Radar
- Built a **sprint-by-sprint spreadsheet** that showed dependency slippage immediately.
- Accounted for **Nov/Dec release freezes** → front-loaded heavy work.
- Tracked sprint debt vs. client expectations.

ℹ️ **Note:** Treat spreadsheets as **early warning systems**, not as project dashboards.

---

### Phase 3: Chaos in the Middle
- **Late-arriving PM**: few weeks pre-launch, got project and product manager onboarded about the project while delivering.
- **Tech debt cleanup**: 2 sprints of invisible work.
- **Client pause/restart**: documentation preserved alignment.

❗ **Warning:** Adding new people late **slows before it speeds** — the Mythical Man-Month is very real.

---

### Phase 4: Curveballs
- **Reporting reversal**: “No changes” became “new reports required.” Solved by writing SQL specs myself.
- **Enterprise release train**: one missed slot = 30-day delay.
- **NACHA validation/observability**: proactive dashboards for early detection.

> *In enterprise projects, the real deadline isn’t your sprint — it’s the client’s release train.*

---

### Phase 5: Operationalization
- Documented **“break glass” escalation flows** (duplicate files, reversals, missing reports).
- Ran **fire drills** for each scenario with engineering + client support.
- Defined **decision hierarchies** across company, client, and bank.

💡 **Tip:** Payments fire drills feel paranoid — until the day they don’t.

---

### Phase 6: Intentional Rollout
- Phased rollout: **test → 1% → 5% → 20% → 50% → 100%**.
- Designed reconciliation to be boring, not exciting.

ℹ️ **Note:** *In payments, boring = success.*

---

### Phase 7: Managing the Tail
- NACHA returns and retries continued for **60 days** via old originator.
- Built **Looker report** to monitor zombie flows until they tapered.
- Weekly reports to client ensured confidence in the transition.

❗ **Warning:** Legacy systems cast **long shadows** — never assume launch = done.

---

## Results

- **Seamless external launch**: client saw stability, not chaos.
- **Resilient ops**: dashboards + escalation flows caught errors early.
- **Learned leadership muscles**: handling uncertainty, onboarding, and misaligned calendars.

> *Great delivery isn’t about eliminating chaos. It’s about ensuring the chaos never shows.*

---

## What I’d Do Differently

Looking back, a few things stand out:

- I underestimated how much complexity came from the client’s **multiple sites and environments**, each with their own development, QA, and release cycles. If I had pushed for clearer configurability expectations upfront, it could have reduced later coordination churn.
- If I had aligned earlier on the **client’s enterprise release calendar**, we might have avoided some of the heartburn that came from missing narrow release windows.
- One thing I’d absolutely keep: we built **monitoring and observability into development from the start** — dashboards, Looker reports, and ACH file validation checks. That investment paid off twice: it made the **intentional phased rollout safe and boring**, and it made the **tail-end “zombie return” phase measurable and manageable** instead of chaotic.

None of these gaps derailed us — and the observability work, in particular, made the difference between **guessing and knowing**.

---

## Closing

This wasn’t the clean 12-week project I imagined. It was **messy, unpredictable, and exhausting**.

But it made me an EM. It taught me that engineering management isn’t about keeping projects on straight tracks — it’s about **navigating curves, absorbing chaos, and ensuring the client never sees it**.

> *In leadership, success isn’t smooth execution. It’s smooth perception.*

---
