---
description: "Discovery/design/spike issue template for well-scoped, actionable work items"
name: issue-template
tools:
  - 'read/readFile'
  - 'edit'
  - 'todo'
handoffs:
  - label: "to-architect"
    agent: DeBaun-Architect
    prompt: >-
      Handoff to DeBaun Architect: summarize the discovery findings and proposed prototype and ask the architect to create an ADR or spike plan if appropriate.
---

# Issue Template — Discovery/Design/Spike

**Purpose**: Use this template for discovery, architecture, and spike work. It produces a well-scoped, actionable issue suitable to be the canonical work item from a discovery session.

---

## Title

Short, descriptive summary (start with context): e.g., "Add background worker for invoice processing (proof-of-concept)"

## Background

One-paragraph summary of the context and why this work matters.

## Problem Statement

Concise, concrete description of the problem to solve.

## Goals & Success Metrics

- Measurable outcomes and non-functional requirements (performance, reliability, security, cost).
- Example: "Process 95% of invoices in <200ms", "SLA: 99.9% availability", etc.

## Acceptance Criteria (pass/fail)

- [ ] Criterion 1 — clear and testable (e.g., "End-to-end processing within 200ms in a representative benchmark").
- [ ] Criterion 2 — security/compliance checks
- [ ] Criterion 3 — observability and runbooks created

## Proposed Solutions / Options (brief)

- Option A: Short description + pros/cons
- Option B: Short description + pros/cons

> If no preferred option yet, leave this section for the discovery session and fill after evaluation.

## Tasks (to be completed in this issue)

- [ ] Run initial discovery and update this issue with findings
- [ ] Create ADR and attach to this issue
- [ ] Prototype spike (link to spike branch or bench notes)
- [ ] Produce performance/cost estimates
- [ ] Create follow-up implementation tasks (if applicable) and link them here
- [ ] Update issue labels and priority
- [ ] Prepare rollout plan and rollback criteria
- [ ] Add observability (metrics/alerts) and runbook notes

## Labels (suggested)

- project:[project-name]
- type:design or type:spike
- priority:[high|medium|low]
- scope:[infra|backend|frontend|ops|security]

## Estimates

- Discovery/Spike: (hours/days)
- Follow-up implementation: (T-shirt or story points estimate if known)

## Dependencies

- Systems, teams, libraries, or vendor constraints that block progress

## Follow-up issues

- Create one follow-up issue per gap or workstream discovered. Link them here and add labels/priority.

## Reviewers / Approvers

- Suggested reviewers: (names or teams)
- Required approvers (if any): (security, compliance, product)

## Notes / References

- Relevant docs, RFCs, design notes, links to ADRs

---

**How to use**

- Paste into a new GitHub issue when starting discovery work. Use the checklist during the session and create linked follow-ups for implementation work. Ask the user to confirm labels and priority; if the user is unavailable, propose a sensible default and document the rationale.

**Example snippet**
> Title: "Spike: Evaluate OpenSearch vs Algolia for full-text search"

> Background: We need better search relevance and lower cost for our product search. Current DB-based LIKE queries are slow and don't support stemming.

> Problem Statement: Current search fails to return relevant results for 20% of queries, and API latency spikes under load.

> Goals: Improve relevance (reduce incorrect results by 75%), keep cost under $X/month.

> Acceptance Criteria:
>
> - [ ] Relevance improvement measured in benchmark dataset
> - [ ] Cost estimate and migration plan
> - [ ] ADR created and linked

---

*Template created by DeBaun Architect.*
