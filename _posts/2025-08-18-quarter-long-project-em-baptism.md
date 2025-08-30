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

# SEO and Canonical Tags
canonical_url: "https://buildtales.dev/engineering/leadership/2025/08/18/quarter-long-project-em-baptism.html"
author:
  name: "Suma Manjunath"
  twitter: "@sumahiremath"
  
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

*Published on: August 18, 2025*

![mousefinish](/assets/banners/resized/20250818mousefinish-blog.jpg)

Every engineering manager (EM) remembers their first big project. For me, it was integrating a third-party service provider with a client's bank.

On paper, it looked like a simple quarter-long integration: gather requirements, build the flows, test, launch. Clean. Predictable. Neat.

>**Reality had other plans. (Spoiler: the universe laughs at clean Gantt charts.)**

The project stretched across multiple quarters, wound through pauses and reversals, and tested every ounce of **planning, adaptability, and persistence** I had as a new EM. By the end, it launched **flawlessly** — but it became my **true baptism into engineering management**.

## Planning Before Dates

I didn’t start with timelines. I started by making sure **I understood** every piece of the system — how money moved, what reports were generated, where reconciliation lived, even what a consumer would see on their bank statement per NACHA rules.

Only after I could see it clearly myself did I set out to create **shared understanding**. I turned those flows into Miro diagrams that became the universal reference point — something engineers, support, compliance, and even the client’s bank could all point to.

That shared map turned arguments into alignment. We weren’t debating opinions anymore; we were debating the same picture.

Only once we had that did I even think about dates.

>_**(Spoiler: dates lie. Flows don’t.)**_

## The Spreadsheet That Made Slippage Visible

Next came the spreadsheet: sprint by sprint deliverables, dependencies, and release timing.

It wasn't just backlog grooming. It was **slippage radar**. If something slipped in Sprint 3, it **screamed at us** in Sprint 4 — not buried until the end.

I also knew **Nov/Dec freezes** were coming. Translation: no one's pushing code when half the company is in ski chalets or watching Hallmark movies. So I **front-loaded heavy releases** and left December **lean**.

It was **proactive, not reactive**. Also: **mildly soul-saving**.

## Chaos in the Middle

**No project manager until the last mile**. Forty-five days before launch, we finally got a project manager — **brand-new to the company, brand-new to ACH, and dropped straight into the fire**. The **mythical man month is real**: adding people late slows you down before it speeds you up. I spent as much time **onboarding as delivering**.

A new product manager, too. A few months before development even started, a new product manager had joined the company. They were new to both our product and ACH. Which meant in parallel with everything else, I was running **crash courses in SEC codes, NACHA returns, and reconciliation flows** so product decisions could be made with confidence.

**Tech debt first**. Two sprints went to **architecture cleanup**. No demos, no visible progress. Telling stakeholders, **"Trust me, we're deleting old code"** went about as well as you'd expect.

**Client pause + restart**. Midstream, the client paused. Months later, they restarted with new requirements. **Documentation saved us** — otherwise we'd still be arguing about what we were building.

## Curveballs

**Reporting flip.** For months: **"No reporting changes."** Then in November: **"Actually, new reports are required for launch."** Cue the sound of every engineer's soul leaving their body. I pulled in a dev from another team, handed them a spec so detailed it included the **SQL qery and run time**, and we shipped… in January, **one week before launch**.

**Enterprise release cycles.** I was enlightened to the fact that our sprint board wasn’t the only calendar that mattered. The **client’s release schedule was the real boss fight** — and some releases only happened on a specific day of the month. Miss it, and you weren’t just a week late, you were a *month* late. Nothing will give you heartburn quite like realizing a single slip can cascade into thirty days of delay. *Sprint velocity is optional; the client’s release train is not.*

> *In enterprise projects, the real deadline isn’t your sprint — it’s the client’s release train. Miss it, and you wait a month to board again.*

**NACHA file validation & observability.** Every filename and field at the new bank had to match spec or the file would be rejected. I pushed for **dashboards and alerts from the start** — because if ACH breaks silently, you don't find out until your client calls at **7 a.m.**

## Operationalization: Break Glass if Needed

**Code wasn’t enough.** We had to prepare for when things went wrong — internally, with the client, and with their bank. I established DLs for communication and mapped escalation paths before we ever hit production.

We rehearsed **fire drills** such as:

- What if a **NACHA file is submitted twice**?  
- What if a **reversal is required**?  
- What if **reports were missing**?  
- What would be **our engineering team SLA** for inquiry vs. incident?  
- **Who approves changes** — at our company, at the client, at the bank?  

I documented the **hierarchy of decisions and "break glass" procedures** in Confluence like a **Payments Doomsday Prepper**. We prayed we’d never need it — but if we did, at least we wouldn’t be **inventing policy mid-incident**.  

And because this was a new flow, I also thought through **scenarios we hadn’t yet encountered**. Planning for the unknown felt paranoid at times — but it was the only way to be extra prepared.  

> *In payments, you don’t just plan for failures you’ve seen — you plan for the ones you haven’t.*

## Intentional Phased Roll Out

When code was ready, we **didn't flip the switch overnight**.  

We earned trust in increments: **a few transactions → 1% → 5% → 20% → 50% → 100%**.  

It stretched another quarter, but it made **reconciliation boring** — which is exactly how you want it.  

> *In payments, boring is a feature. If the cutover feels exciting, you probably did it wrong.*

## Managing the Tail

Even after **100% rollout**, the old bank wasn’t done with us. Per **NACHA rules**, returns, refunds and retries had to flow through the original originator. That meant a **60-day tail of zombie transactions**.

To manage it, I built a **Looker report** that landed in my inbox weekly. Every Monday it reminded me: **"Surprise, you’re still not done."**

But it also gave me **proof for the client** that the **old pipeline was quietly dying off** — no hidden stragglers, no surprises.

> *In payments, launch isn’t the finish line. The tail can chase you for months.*

## The ACH Integration Journey

Here’s the journey in one picture — because sometimes a chart tells the story better than paragraphs.  

**Nodes (with cheeky labels):**  
- Kickoff → *“The Quarter-Long Fantasy”*  
- Spreadsheet Therapy → *“My Slippage Radar”*  
- Chaos in the Middle → *“New PMs, Who Dis?”*  
- Curveballs → *“Reporting Flip + Boss Fight Calendar”*  
- Operationalization → *“Payments Doomsday Prepper”*  
- Intentional Rollout → *“Boring by Design”*  
- Managing the Tail → *“Zombie Returns”*  
- Seamless Launch → *“The Magic Trick”*  

<div class="mermaid">
flowchart TD
    A["The Quarter-Long Fantasy"] --> B["Spreadsheet Therapy"]
    B --> C["New PMs, Who Dis?"]
    C --> D["Reporting Flip + Boss Fight Calendar"]
    D --> E["Payments Doomsday Prepper"]
    E --> F["Boring by Design"]
    F --> G["Zombie Returns"]
    G --> H["The Magic Trick (Seamless Launch)"]

    style A fill:#e3f2fd,stroke:#90caf9,stroke-width:2px
    style B fill:#f3e5f5,stroke:#ce93d8,stroke-width:2px
    style C fill:#fff3e0,stroke:#ffb74d,stroke-width:2px
    style D fill:#f3e5f5,stroke:#ba68c8,stroke-width:2px
    style E fill:#e8f5e9,stroke:#81c784,stroke-width:2px
    style F fill:#ffebee,stroke:#ef9a9a,stroke-width:2px
    style G fill:#ffebee,stroke:#ef5350,stroke-width:2px
    style H fill:#ede7f6,stroke:#9575cd,stroke-width:2px
</div>
---

## The Outcome

From the outside, the launch looked **seamless**. Clean rollout. Reconciled reports. Stable ops.  

From the inside, it was **chaos with a spreadsheet**: a late project manager, a new product manager, the client pause, the reporting flip, the overloaded team, the phased rollout, the zombie tail of returns, the fire drills — **none of it was visible**.  

And that was the point.  

> *Great delivery isn’t about showing the chaos. It’s about making sure the chaos never shows.*

## What I Learned

- **Miro diagrams are lies you tell yourself early — but useful lies.** People forgive delays; they don't forgive **surprises**.
- **Don't fight holiday freezes or enterprise cycles.** **Ski season always wins**.
- **Pulling in help only works if you hand over a blueprint.** Give people **complete requirements**, not partial context.
- **Earn trust in increments, not big bangs.** **Phased cutovers are your friend**.
- **Old systems die slowly — zombie returns are forever.** **Legacy systems have long shadows**.
- **Compliance and contracts matter as much as code.** **Technical solutions are only part of the equation**.
- **Set expectations when work is invisible.** **Refactors don't demo well**.
- **Onboarding late hires takes time.** The **mythical man month doesn't care about your deadline**.
- **Operationalize the "what ifs."** **Payments fire drills are weird, but they work**.

## What I Might Have Done Differently

Looking back, a few things stand out.

- I could have invested earlier in **cross-training the product manager** on ACH fundamentals instead of drip-feeding knowledge under pressure. That might have accelerated decision-making.
- I underestimated how much complexity came from the client’s **multiple sites and environments**, each with their own development, QA, and release cycles. If I had pushed for clearer configurability expectations upfront, it could have reduced later coordination churn.
- And if I had aligned earlier on the **client’s enterprise release calendar**, we might have avoided some of the heartburn that came from missing narrow release windows.

None of these gaps derailed us — but recognizing them makes me sharper for the next big program.

## Closing  

This wasn’t the **clean, quarter-long project** I imagined. It was **messy, unpredictable, and exhausting**.  

But it wasn’t just me. A **lean but determined cross-functional team** — engineering, QA, support, compliance, client services, project manager, and product managers — made it possible. My **manager’s support** also helped **unblock key decisions** and keep things moving when momentum stalled. Together we carried the chaos without ever letting it show.  

It **made me an EM**. And it taught me that **engineering management isn’t about keeping projects on straight tracks**. It’s about **navigating the curves** — and making sure that, when the client looks, all they see is a **smooth road**.  

**That project made me. Every one since has built on it.**  

> *In payments and in leadership, the job isn’t to eliminate chaos — it’s to make sure chaos never shows.*

---

*Enjoyed this deep dive into engineering management? Check out the main [How U.S. Payments Really Work](/series/payments) series for more technical deep dives into payment systems.*
