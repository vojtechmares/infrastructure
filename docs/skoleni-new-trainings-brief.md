# New trainings - technical writer brief

_Handoff brief for the technical writer. Covers four new courses: Azure cloud introduction,
Prometheus, Cloudflare, and AKS. Companion to
[skoleni-trainings-prioritization.md](./skoleni-trainings-prioritization.md)._

_Last updated: 2026-07-07._

## How to use this document

You (the technical writer) are producing the course materials listed under "Deliverables" for each of
the four courses below. This brief gives you the target audience, format, learning objectives, module
outlines, workshop specs, and constraints. It is the starting point, not the final word on technical
accuracy.

- **Subject-matter expert (SME):** Vojtěch Mareš (`vojtech@mares.cz`), the trainer. Interview the SME
  for anything ambiguous, and have the SME technically review every deliverable before release.
- **Do not invent commands, flags, or portal steps.** Verify every command and screenshot against the
  current product docs and the SME's own environment. These platforms change fast (see "Versioning").
- **Definition of done** for each course is the deliverables checklist plus SME sign-off.

## Context

- **Brand:** `mares.cz` DevOps training portfolio. Each course has its own landing domain (for example
  `prometheus-skoleni.cz`). Funnel traffic from `mares.cz`, which already has search authority.
- **Market:** Czech Republic, corporate and public trainings. Microsoft/Azure is well represented in
  Czech enterprise, which is why Azure (not AWS or GCP) is the cloud-introduction target.
- **Audience:** broad and beginner-leaning. Attendees are developers, operations staff, and technical
  managers who are new-to-intermediate on the topic. Design for people who have not used the tool in
  production yet.
- **Format model (important):** every course is a **single day, roughly 6 hours of content**, split
  into **about 4 hours of broad/beginner fundamentals** plus a **fixed 2-hour advanced hands-on
  workshop** at the end. The 2-hour workshop is the only "advanced" part of the day and doubles as a
  teaser for a future deep-dive course.

## Standard day timetable (template for all four courses)

Use this as the backbone. Adjust module lengths per course, but keep the 2-hour workshop fixed.

| Time | Block | Notes |
|---|---|---|
| 09:00 - 09:15 | Welcome, logistics, audience check | Set expectations, confirm prerequisites |
| 09:15 - 10:45 | Fundamentals block 1 | ~90 min |
| 10:45 - 11:00 | Break | |
| 11:00 - 12:30 | Fundamentals block 2 | ~90 min |
| 12:30 - 13:15 | Lunch | |
| 13:15 - 14:00 | Fundamentals block 3 / bridge to workshop | ~45 min |
| 14:00 - 16:00 | **Advanced hands-on workshop** | Fixed 2 hours |
| 16:00 - 16:30 | Wrap: recap, certification path, next course, Q&A | Upsell moment |

Realistic budget: about 3.5-4 hours of fundamentals content. Keep the beginner scope ruthless,
especially for Cloudflare and Azure, where the platform surface is huge.

## Deliverables (per course)

Produce all of the following for each of the four courses:

1. **Slide deck** with speaker notes. Sentence-case titles, minimal text per slide, diagrams over walls
   of bullets.
2. **Workshop guide** - step-by-step, copy-pasteable commands, expected output, and screenshots for the
   2-hour hands-on lab. Must be runnable start to finish by a beginner.
3. **Attendee prerequisites and setup guide** - a short pre-course document (and email snippet) listing
   required accounts, installed tools (CLIs, Docker), and versions. Broken laptops on the morning of
   are the most common failure mode.
4. **Cheat sheet / quick reference** - 1 to 2 pages of the key commands, concepts, and links attendees
   keep afterwards.
5. **Landing-page and marketing copy** for the course domain - title, one-line pitch, "who it is for"
   and "who it is not for", learning outcomes, agenda summary, prerequisites, and a call to action.
6. **Instructor run-of-show** - timings, talking points, and a list of frequently asked questions with
   answers (collect these from the SME).

## Shared conventions and style

- **Headings:** sentence case. **Dashes:** use hyphens, never em dashes.
- **Language:** delivery is in Czech. Materials language (Czech vs English) is an open decision (see
  "Open decisions"). Keep tool names, commands, and product terms in their original English form
  regardless.
- **Commands and code:** copy-pasteable blocks. Note operating-system differences (Windows, macOS,
  Linux) in setup instructions.
- **Screenshots:** date them and record the product version, because Azure Portal and the Cloudflare
  dashboard change frequently. Prefer CLI or IaC steps where they are more stable than the UI.
- **Examples:** use real, production-flavored examples from the SME's own infrastructure where possible.
  This is a differentiator, especially for Cloudflare.
- **Takeaways:** each workshop ships with a Git repo of the lab code that attendees keep.
- **Versioning:** maintain a per-course appendix pinning the exact versions used (Kubernetes/AKS,
  Prometheus, Grafana, Azure CLI, Cloudflare Wrangler, and so on), so materials can be refreshed on a
  schedule.

---

## Course 1 - Azure: cloud introduction

- **Domain:** (Azure intro; pairs with `aks-skoleni.cz` as the Azure track). See open decisions for the
  exact landing domain.
- **Duration:** 1 day.
- **Positioning:** a hands-on first day in the cloud, Azure-flavored. Breadth over depth.
- **Audience:** anyone new to cloud - developers, ops, managers. No prior Azure experience assumed.
- **Not for:** people who already run workloads on Azure day to day.
- **Prerequisites:** basic IT literacy. A laptop and an Azure account (see lab notes).
- **Certification hook:** align with **AZ-900 (Azure Fundamentals)**; can be sold as exam-adjacent.

**Learning objectives - after this course an attendee can:**
- Explain cloud service and responsibility models and Azure's global structure.
- Navigate the Azure Portal and run basic `az` CLI commands.
- Identify the right core service (compute, storage, networking, identity) for a simple workload.
- Deploy a small application to Azure with guidance.

**Fundamentals outline (~4 h):**
1. Cloud and Azure foundations (45 min) - IaaS/PaaS/SaaS, shared responsibility, cloud economics,
   regions and availability zones, resource hierarchy (management group, subscription, resource group).
2. Identity and governance (40 min) - Entra ID, RBAC, subscriptions, resource groups, tags, a note on
   policy, cost management and budgets.
3. Core compute and app hosting (45 min) - VMs, App Service, Functions, and where containers/AKS fit;
   how to choose.
4. Storage and databases (35 min) - Blob, Disks, Files; Azure SQL and Cosmos DB at an overview level.
5. Networking basics (40 min) - VNet, subnets, NSG, public IP, Load Balancer, DNS; a working mental
   model.
6. Working with Azure (35 min) - Portal tour, `az` CLI, and an intro to infrastructure as code
   (ARM/Bicep/Terraform) to set up the workshop.

**Advanced workshop (2 h):** deploy one real workload end to end. Recommended: an App Service web app
plus a storage account plus Entra-based access control. Alternative: a Bicep or Terraform deploy of the
same small stack, to introduce IaC. Deliverable: a running app and the repo/scripts that built it.

**Out of scope (defer to follow-ups):** hybrid connectivity (ExpressRoute/VPN), landing zones, advanced
networking, deep per-service dives.

**Lab environment:** Azure labs cost money. Decide the funding model (attendee subscriptions vs
instructor-provided sandbox subscriptions that are time-boxed and torn down). Provide a cleanup script.

---

## Course 2 - Prometheus (with Grafana)

- **Domain:** `prometheus-skoleni.cz`.
- **Duration:** 1 day.
- **Positioning:** monitoring with Prometheus, focused on metrics. **Always sell and teach with Grafana
  bundled; never Prometheus alone.**
- **Audience:** developers and ops new to monitoring/observability.
- **Prerequisites:** basic command line and Docker familiarity (needed for the lab). Provide a Docker
  setup guide.
- **Certification hook:** none mainstream; position as practitioner skills. Ties into a future
  Observability / OpenTelemetry course.

**Learning objectives - after this course an attendee can:**
- Explain the difference between metrics, logs, and traces, and where Prometheus fits.
- Describe Prometheus architecture (pull model, TSDB, exporters, service discovery).
- Write basic PromQL and build Grafana dashboards.
- Set up basic alerting rules and understand Alertmanager routing.

**Fundamentals outline (~4 h):**
1. Observability foundations (30 min) - why monitor, metrics vs logs vs traces, the Prometheus
   ecosystem.
2. Prometheus architecture (40 min) - pull model, TSDB, targets, exporters, service discovery, scrape
   configuration.
3. Metrics and instrumentation (45 min) - the four metric types (counter, gauge, histogram, summary),
   `node_exporter`, instrumenting an app, and a caution on labels and cardinality.
4. PromQL basics (45 min) - selectors, `rate()`, aggregations, common queries.
5. Grafana essentials (45 min) - adding a data source, building dashboards, panels, variables.
6. Alerting intro (35 min) - alerting rules, the Alertmanager concept, routing and notifications.

**Advanced workshop (2 h):** on a Docker Compose stack, do a PromQL deep dive, write recording and
alerting rules, configure Alertmanager routing, and build an SLO-style dashboard with an alert.
Deliverable: the compose stack, rules, and dashboard JSON in a repo.

**Out of scope (defer):** high availability and long-term storage (Thanos/Mimir), `remote_write`,
federation, logs (Loki) and traces (Tempo/OpenTelemetry). These become the Observability/OTel course.

**Lab environment:** cheapest of the four - runs locally via Docker Compose. Ship the compose files
in advance.

---

## Course 3 - Cloudflare

- **Domain:** `cloudflare-skoleni.cz`.
- **Duration:** 1 day (introduction). Note: the Cloudflare platform is effectively three products
  (web/CDN/security, developer platform, Zero Trust), so this day skims and later splits into
  specialized follow-ups.
- **Positioning:** a practical introduction to Cloudflare, taught with real production examples. The
  SME's first-hand Cloudflare expertise is the key differentiator - lean into it.
- **Audience:** web developers, ops, and infrastructure people new to Cloudflare.
- **Prerequisites:** basic web and DNS concepts. A free Cloudflare account.
- **Certification hook:** none mainstream; sell as practitioner skills.

**Learning objectives - after this course an attendee can:**
- Explain how Cloudflare's reverse proxy and DNS proxying work.
- Manage DNS, caching, and TLS for a site on Cloudflare.
- Apply core security features (WAF, rate limiting, DDoS, bot protection).
- Describe what the developer platform and Zero Trust offer, and complete one hands-on advanced task.

**Fundamentals outline (~4 h):**
1. How Cloudflare works (35 min) - reverse proxy, DNS proxying ("orange cloud"), the global network,
   and a map of the product families.
2. DNS and onboarding (35 min) - adding a zone, DNS records, proxied vs DNS-only, nameservers.
3. CDN and caching (45 min) - cache behavior, cache rules, TTLs, purging, tiered cache, optimization.
4. TLS and security essentials (55 min) - SSL/TLS modes, WAF, rate limiting, DDoS protection, bots,
   the Rules engine.
5. Platform tour (35 min) - Workers, Pages, R2/KV/D1, and Zero Trust at an awareness level (what each
   is for).

**Advanced workshop (2 h) - pick one hero, this is an open decision:**
- **Option A - Developer:** build and deploy a Worker (optionally with KV or R2). Appeals to a
  developer audience.
- **Option B - Zero Trust:** put Cloudflare Access in front of an internal app via a Tunnel. Aligns
  with the fastest-growing, highest-value enterprise use case (SASE / Zero Trust).

Deliverable: the deployed Worker or the working Access + Tunnel setup, plus the repo/config.

**Out of scope (defer, becomes follow-up days):** the full developer platform (Workers/Pages/D1/R2/
Queues) and the full Zero Trust/SASE stack (Gateway, WARP, DLP, CASB).

**Lab environment:** Cloudflare's free tier is generous and lab-friendly. Option B also needs a small
internal app and the `cloudflared` tunnel client.

---

## Course 4 - AKS (Azure Kubernetes Service)

- **Domain:** `aks-skoleni.cz`.
- **Duration:** **1 day, with Kubernetes as a hard prerequisite** (recommended). Without that
  prerequisite the course needs 2 days (day 1 Kubernetes foundation, day 2 AKS), which duplicates the
  standalone Kubernetes course. Confirm with the SME (open decision).
- **Positioning:** running Kubernetes on Azure - the Azure-specific layer on top of vendor-neutral
  Kubernetes. Deliberately does not re-teach core Kubernetes.
- **Audience:** developers and ops who know Kubernetes basics and are moving to, or running on, Azure.
- **Prerequisites:** working knowledge of Kubernetes (pods, deployments, services, `kubectl`) - ideally
  the SME's Kubernetes course. An Azure account with rights to create an AKS cluster.
- **Certification hook:** KCNA/CKA on the Kubernetes side; overlaps with parts of AZ-104/AZ-305 on the
  Azure side.

**Learning objectives - after this course an attendee can:**
- Provision and access an AKS cluster (Portal, CLI, IaC) and explain what Azure manages.
- Integrate ACR, Entra ID, Azure RBAC, networking, storage, and Key Vault with AKS.
- Wire up monitoring with Azure Monitor / Managed Prometheus and Grafana.
- Deploy an application to AKS end to end.

**Fundamentals outline (~4 h, assumes Kubernetes basics):**
1. AKS and managed Kubernetes (30 min) - what AKS manages vs what you manage, the control plane, node
   pools (system vs user), provisioning options.
2. Provisioning and access (40 min) - create via Portal/CLI/IaC, kubeconfig, Entra ID integration and
   Azure RBAC for Kubernetes.
3. Images and registry (25 min) - ACR, pushing and pulling images, pull integration.
4. Networking and ingress (45 min) - kubenet vs Azure CNI, services, ingress (AGIC or nginx), TLS.
5. Storage and secrets (35 min) - Azure Disk/Files CSI drivers, Key Vault CSI secrets.
6. Observability and scaling (45 min) - Azure Monitor / Container Insights, Managed Prometheus and
   Grafana (ties into the Prometheus course), HPA, cluster autoscaler, KEDA, cluster upgrades.

**Advanced workshop (2 h):** deploy an app end to end - push an image to ACR, deploy it, expose it via
ingress with TLS, pull a secret from Key Vault, and view metrics in Container Insights or Managed
Prometheus. Deliverable: the running app plus manifests/IaC in a repo.

**Out of scope (defer):** private clusters and advanced CNI (Cilium), Fleet/multi-cluster, GitOps
(the SME's ArgoCD course), and security hardening (Azure Policy, Defender for Containers).

**Lab environment:** AKS clusters cost money and take a few minutes to provision. Pre-provision or
script cluster creation, and provide a teardown script. Reuse the Azure funding-model decision from the
Azure intro course.

---

## Cross-course learning path

Publish this so attendees self-select and so courses cross-sell:

```
Azure: cloud introduction ─┐
                           ├─▶ AKS (needs Kubernetes)
Docker ▶ Kubernetes ───────┘

Prometheus (+Grafana) ─▶ Observability / OpenTelemetry (future)

Cloudflare (intro) ─▶ Cloudflare developer platform (future)
                   └▶ Cloudflare Zero Trust / SASE (future)
```

- AKS depends on Kubernetes. Do not let AKS re-teach Kubernetes - it cannibalizes that course.
- The Prometheus course feeds the AKS observability module and a future Observability/OTel course.
- Cloudflare naturally splits into two advanced follow-ups after the intro.

## Open decisions (need SME answers before writing)

| # | Decision | Why it matters | Recommendation |
|---|---|---|---|
| 1 | Materials language: Czech or English | Affects all written deliverables | Decide up front; keep technical terms in English regardless |
| 2 | AKS: Kubernetes as a hard prerequisite (1 day) vs standalone (2 days) | Changes scope and duration | Make Kubernetes a prerequisite; keep AKS at 1 day |
| 3 | Cloudflare workshop hero: Workers (A) vs Zero Trust (B) | Determines the 2-hour lab and target buyer | Choose by audience; Zero Trust for enterprise value, Workers for developers |
| 4 | Lab funding model for Azure/AKS | Real cost; blocks the labs | Provide time-boxed sandbox subscriptions with teardown scripts |
| 5 | Azure intro positioned as AZ-900 exam prep | Sales lever for corporate buyers | Yes, position as AZ-900 aligned |
| 6 | Public scheduled vs in-house corporate delivery | Affects marketing copy and pricing | Confirm the primary channel per course |
| 7 | Exact tool versions to standardize on | Screenshots and commands age fast | Pin versions in each course appendix |
| 8 | Azure intro landing domain | Not currently an owned `*-skoleni` domain | Confirm domain or reuse an existing brand domain |

## References

- [skoleni-trainings-prioritization.md](./skoleni-trainings-prioritization.md) - ranking, scoring, and
  the reasoning behind picking these topics.
- Data sources for demand and depth decisions are listed in the prioritization document.
