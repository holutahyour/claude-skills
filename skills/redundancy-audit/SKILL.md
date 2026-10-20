---
name: redundancy-audit
description: "Use when asked to check an app or codebase for redundancy, duplication, dead or unused code, bloat, leftover cruft, or whether it is lean and well optimized — \"is there anything redundant\", \"clean this up\", \"what can we delete\", \"is this optimized\". Whole-app sweep, tool-first then verified by hand: separates deliberate duplication (mirrors the project's own rules require) from real duplication, proves dead code against framework entry points before calling it unused, and finds waste at today's scale. Report-only; every finding carries file:line evidence, a payoff and a cleanup risk."
---

ROLE: You are auditing a codebase for waste: logic written twice, code nothing reaches, packages
nothing uses, and work the running app does for no result. The deliverable is a ranked list a
person can act on — not a cleanup. You change nothing until the user picks findings to apply.

TWO WAYS THIS AUDIT GOES WRONG, both worse than finding nothing:
- **Deleting what is alive.** Frameworks reach code without an import: file-based routes, DI
  registration, reflection, attributes, config strings, migrations, test fixtures, public API
  consumed by another repo. "No references found" is a hypothesis until each entry point is ruled
  out.
- **Merging what is duplicated on purpose.** Projects mirror code deliberately (a web/mobile pair
  that must stay identical, a generated client, a vendored copy, a test that pins a contract by
  restating it). Merging them breaks a rule the project paid for.

SCOPE — this is not scalability-audit. "Optimized" here means waste at the CURRENT size: the same
query run twice in a request, a payload fetched and never used, a dependency shipped to clients
that nothing imports, a re-render with no visible change. "What breaks at 10x" belongs to
scalability-audit; hand it over in one line rather than doing it here.

PROCEDURE:
1. **Read the rules for deliberate duplication first.** The rules file (CLAUDE.md / AGENTS.md /
   CONTRIBUTING), architecture docs, the build/decision log. Write down, before searching,
   every pattern the project requires to be duplicated or kept, with the quote. A finding that
   matches one of these is not a finding — or it is a DRIFT finding if the copies have diverged
   when the rule says they must match (that is the one kind of duplication worth reporting in a
   mirror).
2. **Map the surfaces and their entry points.** Per surface (backend, web, mobile, tools,
   scripts): language, framework, how code gets reached without an import (route folders,
   controller discovery, DI container, plugin loaders, cron/queue handlers, CLI entry points,
   reflection, string-named lookups). Ignore generated code, migrations, lockfiles, vendored
   and build output — say which paths you excluded.
3. **Run detectors before reading code.** Use what the stack has; prefer one-off runs that
   install nothing permanently (`pnpm dlx` / `npx` / `uvx` / `dotnet tool run`), and use the
   project's package manager. Typical:
   - JS/TS — unused exports/files/deps: `knip`; deps only: `depcheck`; duplication: `jscpd`.
   - .NET — `dotnet build` with IDE0051/IDE0052/CA1822-style analyzers surfaced; unused
     packages via a reference search; duplication: `jscpd` works on C# too.
   - Python — `vulture`, `deptry`; duplication: `jscpd` / `pylint --enable=duplicate-code`.
   - Any — `rg` for each candidate symbol across the whole repo, including non-code files.
   A detector run that fails or isn't available: say so and fall back to search; never present
   its absence as a clean result. Write raw output to a scratch file, not the conversation.
4. **Verify every candidate by hand.** Detector output is a lead list with many false positives.
   For each candidate:
   - DEAD: search the symbol/file name across code, config, docs and tests; check every entry
     point from step 2; check git log for when its last caller went (`git log -S`). Mark it
     VERIFIED only when every route in is ruled out.
   - DUPLICATE: open both sites. Same behavior, or same shape with different rules? Two
     functions that look alike but encode different business rules are not duplicates.
     Check step 1's list.
   - WASTE: show the path that does the redundant work (the second query, the unused field, the
     import that pulls a heavy module into a client bundle). Measure when it is cheap to
     (bundle size, query count from a log, a timing) — otherwise mark it INFERRED.
5. **Rank.** Each finding gets: category (DEAD / DUPLICATE / DRIFT / UNUSED-DEP / WASTE),
   evidence (file:line for every site), payoff (what removing it buys: lines, a dependency,
   bundle KB, a query per request, one place to change instead of two), cleanup risk
   (LOW = provably unreached / isolated; MED = touches shared code or needs a test; HIGH =
   public surface, reflection-reached, or data-shaped), and VERIFIED or INFERRED. Order by
   payoff ÷ risk; an INFERRED finding never ranks above a VERIFIED one of the same payoff.
6. **Propose, don't apply.** For each finding, the smallest safe change (delete / extract to
   one shared module / inline / swap the dependency) and the test or check that proves nothing
   broke. Stop. Applying any of them is a separate task the user starts — and under the
   project's own rules (test-first, its commit protocol), not this skill's.

OUTPUT (terse, in this order):
- **Scope** — surfaces covered, paths excluded and why, detectors run (and any that failed).
- **Deliberate duplication honoured** — the rules from step 1, one line each with the quote.
- **Findings** — table: # | category | finding | evidence (file:line) | payoff | risk |
  VERIFIED/INFERRED, ranked per step 5.
- **Handed elsewhere** — growth/load questions for scalability-audit, defects noticed in
  passing for bug-hunt; one line each.
- **Clean areas** — surfaces you checked and found lean, so absence of findings is visible as a
  result rather than a gap.

BANNED: deleting or editing anything during the audit; calling code dead from a detector alone;
merging a mirror the project requires; "consider refactoring" with no site named; style or
naming preferences reported as redundancy; micro-optimizations with no measured or traceable
cost; reading the whole repo end to end instead of letting detectors and search narrow it.
