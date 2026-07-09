# DevOps training prioritization (`*-skoleni.cz` portfolio)

_Generated 2026-07-07. Purpose: rank the owned `*-skoleni.cz` training domains by potential
interest and commercial training value, to decide which trainings to build/launch first._

## TL;DR

- **22** `*-skoleni.cz` zones are managed in Terraform → **21** distinct rankable training topics
  (`go` + `golang` are one topic). Source of truth is `workspaces/dns/zones.tf`, **not**
  `domains.txt` (which is stale — see "Data-source note").
- **Top 4 to build first: Kubernetes, Terraform, DevOps (umbrella academy), Docker.** These combine
  the highest search interest, the strongest Czech/EU job-market demand, and high willingness-to-pay
  for corporate training.
- **Best "rising bets": ArgoCD (GitOps), OpenTelemetry, Kubeflow/MLOps, Cloudflare** — lower current
  volume but steep adoption curves; cheap to hold and position early. Cloudflare is also a topic the
  owner can teach with first-hand authority (this whole infra runs on it).
- **Highest search but weak standalone product: Git** — sell it as a bundled intro module, not a
  premium standalone course.
- **Portfolio gaps worth closing:** `ansible-skoleni.cz`, `grafana-skoleni.cz` — top-demanded in
  Czech DevOps postings but **not owned**. (Docker **is** owned — `docker-skoleni.cz` exists.)

## Important data caveat (read this first)

The goal asked to rank using **Ahrefs**. The Ahrefs MCP connected to this account is on a plan that
**does not grant keyword/search-volume access**. Every volume-bearing endpoint returned
`Insufficient plan`:

| Ahrefs endpoint | Result |
|---|---|
| `keywords-explorer-overview` (paid + free "ahrefs" test) | ❌ Insufficient plan |
| `keywords-explorer-volume-by-country` | ❌ Insufficient plan |
| `serp-overview` | ❌ Insufficient plan |
| `management-projects` / `gsc-*` | ❌ Insufficient plan |
| `public-domain-rating-free` | ✅ Only working endpoint |

So **there are no real Ahrefs search-volume numbers in this report.** The one usable Ahrefs signal
(Domain Rating) confirms the domains are cold:

| Domain | Ahrefs DR |
|---|---|
| `kubernetes-skoleni.cz` | 0 |
| `terraform-skoleni.cz` | 0 |
| `devops-skoleni.cz` | 0 |
| _(all other `*-skoleni.cz`)_ | 0 (parked) |
| `mares.cz` (personal brand) | **17** |

**Implication:** all `*-skoleni` domains start from zero organic authority. `mares.cz` already has DR
17 — landing pages/funnels should hang off (or link from) `mares.cz` rather than starting each
topic domain from scratch.

The interest ranking below is therefore built from **published demand signals** (Stack Overflow 2025,
CNCF 2025, JetBrains 2025, DevOps job-market reports, Czech job-board scans) plus expert judgment on
training viability — **not** Ahrefs volumes. If keyword-level precision is needed, upgrade the Ahrefs
API plan (or export Keywords Explorer manually) and re-run.

## Data-source note (`domains.txt` is stale)

The owned domains were initially read from `workspaces/dns/domains.txt`, but that file is **out of
sync with the actual Terraform zones** in `workspaces/dns/zones.tf` (the real source of truth — every
one of these is a live `cloudflare_zone` with parking + no-mail modules). Reconcile:

| Domain | In `zones.tf`? | In `domains.txt`? | Action |
|---|:-:|:-:|---|
| `cloudflare-skoleni.cz` | ✅ (`zones.tf:657`) | ❌ | add to `domains.txt` |
| `docker-skoleni.cz` | ✅ | ❌ | add to `domains.txt` |
| `mares-skoleni.cz` | ❌ (no zone) | ✅ | either create the zone or drop the line |

Both missing domains are included in the ranking below. `mares-skoleni.cz` is excluded as a
personal/brand domain regardless. **Recommend syncing `domains.txt` to `zones.tf`.**

## Scoring methodology

Each topic scored 1–5 on four factors, then weighted into a composite (max 5.0):

| Factor | Weight | What it measures |
|---|---|---|
| **Interest / search** | 30% | Overall topic awareness & search demand (proxy from surveys) |
| **Job demand (CZ/EU)** | 25% | Frequency in Czech/EU DevOps job postings |
| **Training viability (WTP)** | 25% | Complexity + presence of corporate buyers willing to pay |
| **Growth trend** | 20% | Trajectory of adoption / future-proofing |

Willingness-to-pay is deliberately weighted: a topic can have huge search yet weak paid-training
demand (e.g. Git) — the domains exist to **sell trainings**, not just to rank.

## Ranked list (build order)

| # | Training | Domain(s) | Interest | Job (CZ) | WTP | Trend | **Score** | Tier |
|---|---|---|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | **Kubernetes** | kubernetes-skoleni | 5 | 5 | 5 | 4 | **4.80** | 1 |
| 2 | **Terraform** | terraform-skoleni | 5 | 5 | 5 | 4 | **4.80** | 1 |
| 3 | **DevOps (academy)** | devops-skoleni | 5 | 5 | 5 | 3.5 | **4.70** | 1 |
| 4 | **Docker** | docker-skoleni | 5 | 5 | 4.5 | 4 | **4.68** | 1 |
| 5 | **GitHub Actions** | github-actions-skoleni | 4.5 | 4 | 4 | 4 | **4.15** | 2 |
| 6 | **GitLab CI** | gitlab-ci-skoleni | 4 | 4.5 | 4 | 4 | **4.13** | 2 |
| 7 | **ArgoCD (GitOps)** | argocd-skoleni | 4 | 3.5 | 4 | 5 | **4.08** | 2 |
| 8 | **Prometheus (+Grafana)** | prometheus-skoleni | 4 | 4 | 4 | 3.5 | **3.90** | 2 |
| 9 | **Kafka** | kafka-skoleni | 4 | 4 | 4 | 3.5 | **3.90** | 2 |
| 10 | **OpenTelemetry** | opentelemetry-skoleni | 3 | 3.5 | 4 | 5 | **3.78** | 3 |
| 11 | **AKS (Azure K8s)** | aks-skoleni | 3.5 | 4 | 4 | 3.5 | **3.75** | 3 |
| 12 | **Cloudflare** | cloudflare-skoleni | 3.5 | 3 | 4 | 4.5 | **3.70** | 3 |
| 13 | **Kubeflow / MLOps** | kubeflow-skoleni | 3 | 3 | 4 | 5 | **3.65** | 3 |
| 14 | **GitLab (platform)** | gitlab-skoleni | 4 | 3.5 | 3.5 | 3.5 | **3.65** | 3 |
| 15 | **EKS (AWS K8s)** | eks-skoleni | 3.5 | 3.5 | 4 | 3.5 | **3.63** | 3 |
| 16 | **Git** | git-skoleni | 5 | 4 | 2 | 3 | **3.60** | 3 |
| 17 | **Go / Golang** | go-skoleni, golang-skoleni | 4 | 3.5 | 3 | 3.5 | **3.53** | 4 |
| 18 | **Rust** | rust-skoleni | 4 | 3 | 3 | 4 | **3.50** | 4 |
| 19 | **GKE (GCP K8s)** | gke-skoleni | 3 | 3 | 4 | 3.5 | **3.35** | 4 |
| 20 | **RKE2** | rke2-skoleni | 2.5 | 3 | 4 | 3.5 | **3.20** | 4 |
| 21 | **K3s** | k3s-skoleni | 3 | 2.5 | 3 | 4 | **3.08** | 4 |

_Excluded: `mares-skoleni.cz` — listed in `domains.txt` but has no Terraform zone; treated as a
personal/brand domain, not a topic._

## Tier rationale

### Tier 1 — flagships (build/refresh now)
- **Kubernetes** — the #1 skill in every DevOps/SRE posting; 82% of container users run it in
  production (CNCF 2025). Complex enough to command premium multi-day corporate courses. Anchor product.
- **Terraform** — dominant IaC, appears in "nearly every DevOps job posting". High WTP, multi-cloud.
  (Watch the OpenTofu fork — position the course as "Terraform/OpenTofu" to stay durable.)
- **DevOps (academy)** — the broadest search term and the easiest corporate sell (general upskilling,
  bootcamps, onboarding tracks). Use it as the **umbrella funnel** that bundles the specific courses
  below. Supported by owned brand domains `devops-akademie.cz`, `devopsakademie.cz`, `devopsvkapse.cz`.
- **Docker** — near-universal (71% usage, the single biggest 2025 adoption jump per Stack Overflow),
  in essentially every Czech DevOps posting. The natural **on-ramp course before Kubernetes** — pairs
  into a "Docker → Kubernetes" learning path. WTP slightly below K8s only because it's often
  self-taught, but it sells extremely well as the entry product.

### Tier 2 — strong demand, high commercial value
- **GitHub Actions** (33% CI adoption, leader) and **GitLab CI** (19% but +34% YoY, dominant in CZ
  enterprise/government/banking self-hosted). Offer both; in the Czech market GitLab CI over-indexes.
- **ArgoCD** — majority GitOps tool (~60% of K8s clusters, NPS 79, rising). Natural upsell after the
  Kubernetes course.
- **Prometheus (+Grafana)** — de-facto monitoring; "observability" is a named trending skill. Bundle
  Grafana (see gaps).
- **Kafka** — strong enterprise/event-streaming demand (Czech banks/telco/retail); high WTP, complex.
  Buyer is more backend/data-platform than pure DevOps.

### Tier 3 — solid niche / cloud-specific / rising bets
- **OpenTelemetry** — 2nd-highest-velocity CNCF project; lower current search but a strategic early
  position in observability.
- **AKS** — Azure is heavily represented in Czech enterprise (Microsoft-heavy market); AKS shows up
  by name in CZ postings. Best of the three managed-K8s courses **for the CZ market**.
- **Cloudflare** — rising fast across Workers/edge, R2, and especially Zero Trust/SASE (Cloudflare
  One migrations from Zscaler/Palo Alto). Lower current search than core DevOps tools and a thin
  Czech competitor field, but **high strategic fit**: the owner runs this entire infrastructure on
  Cloudflare, so it's a course they can teach with genuine first-hand authority and differentiate on.
- **Kubeflow / MLOps** — small today, but MLOps is the highest-growth DevOps specialization and
  Kubeflow 1.11 (Dec 2025) repositioned around GenAI/LLM training. Premium, future-facing niche.
- **GitLab (platform)** — overlaps GitLab CI; combine into one "GitLab end-to-end" offer rather than
  two courses.
- **EKS** — AWS is common; slightly behind AKS for the CZ buyer base.
- **Git** — highest raw search of any topic, but low willingness to pay for a standalone premium
  course (learned on the job). **Sell as a bundled intro/onboarding module or a cheap self-serve
  course**, not a flagship.

### Tier 4 — specialized / lower-volume / opportunistic
- **Go / Golang** — healthy language demand, but a developer-training buyer, different from the DevOps
  corporate buyer; merge the two owned domains.
- **Rust** — high buzz and salaries, but a small learner pool makes cohorts hard to fill; premium
  price, low frequency.
- **GKE** — GCP under-indexes in CZ vs Azure/AWS.
- **RKE2** — enterprise/government hardened (CIS/FIPS); niche but real WTP in regulated CZ orgs.
- **K3s** — edge/IoT niche; differentiated but low volume. Good as a module inside the Kubernetes track.

## Portfolio gaps & quick wins

**Owned but adjacent (not `*-skoleni`, support the offering):** `devops-akademie.cz`,
`devopsakademie.cz`, `devopsvkapse.cz` (DevOps umbrella brand), `gopheri.cz` (Go community),
`ziglang.cz` (Zig), `openstack.cz` (OpenStack).

**Gaps — high CZ demand, domain NOT owned (consider registering):**

| Missing topic | Why it matters |
|---|---|
| **Ansible** | Named repeatedly in Czech DevOps postings alongside Terraform. |
| **Grafana** | Pairs 1:1 with the Prometheus course; sell as one observability bundle. |

_(Docker was previously flagged as a gap — it is in fact owned as `docker-skoleni.cz`.)_

## Recommended sequencing

1. **Now:** the **Docker → Kubernetes** path + Terraform + a DevOps umbrella landing page — all
   funneling from `mares.cz` (DR 17) to reuse existing authority.
2. **Next:** CI/CD pair (GitHub Actions + GitLab CI) and the observability bundle (Prometheus+Grafana),
   plus ArgoCD as the Kubernetes upsell.
3. **Then:** Kafka, AKS (CZ-Azure), and the rising bets (OpenTelemetry, Kubeflow/MLOps, Cloudflare) as
   differentiators — Cloudflare leaning on the owner's first-hand expertise.
4. **Opportunistic / bundle-only:** Git (intro module), Go/Rust (dev audience), EKS/GKE, K3s/RKE2
   (modules inside the K8s track).
5. **Housekeeping / gaps:** sync `domains.txt` to `zones.tf` (add `cloudflare-skoleni`,
   `docker-skoleni`; reconcile `mares-skoleni`); register `ansible-skoleni.cz`, `grafana-skoleni.cz`.
6. **Unblock real data:** upgrade the Ahrefs plan (or manual Keywords Explorer export) for
   `<topic> školení` / `<topic> kurz` CZ volumes, then re-run this ranking with hard numbers.

## Sources

- [Stack Overflow Developer Survey 2025 — Technology](https://survey.stackoverflow.co/2025/technology)
- [CNCF: Kubernetes at 82% production use (2025 annual survey)](https://www.cncf.io/announcements/2026/01/20/kubernetes-established-as-the-de-facto-operating-system-for-ai-as-production-use-hits-82-in-2025-cncf-annual-cloud-native-survey/)
- [CNCF End User Survey — Argo CD majority GitOps tool](https://www.cncf.io/announcements/2025/07/24/cncf-end-user-survey-finds-argo-cd-as-majority-adopted-gitops-solution-for-kubernetes/)
- [JetBrains-based CI/CD adoption (GitHub Actions 33% / Jenkins 28% / GitLab CI 19%)](https://eitt.academy/knowledge-base/jenkins-vs-github-actions-vs-gitlab-ci-cicd-2026/)
- [DevOps job market H1 2026 (skills, salaries)](https://devopsprojectshq.com/role/devops-market-h1-2026/)
- [Top DevOps & SRE tools creating jobs in 2026](https://cloudsoftsol.com/docker/top-devops-sre-tools-creating-jobs-in-2026/)
- [DevOps jobs in Czech Republic (Glassdoor)](https://www.glassdoor.com/Job/czech-republic-devops-jobs-SRCH_IL.0,14_IN77_KO15,21.htm)
- [Go vs Rust hiring & Kafka demand 2026](https://tech-insider.org/rust-vs-go-2026-2/)
- [K3s / RKE2 lightweight Kubernetes & Kubeflow MLOps overview](https://www.suse.com/c/rancher_blog/when-to-use-k3s-and-rke2/)
