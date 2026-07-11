# claude-skills

Custom Claude Code skills, for installation across machines/projects.

## Install

Copy any skill folder into your skills directory:

```
cp -r skills/<skill-name> ~/.claude/skills/
```

Or copy the whole set:

```
cp -r skills/* ~/.claude/skills/
```

Claude Code picks up skills from `~/.claude/skills/<name>/SKILL.md` automatically.

## Skills

- `app-builder-workflow` — routing/orchestration dispatcher for the other skills below (formerly `master-workflow`)
- `arch-recon` — map and verify an unfamiliar codebase's architecture
- `book-review` — pre-publish review of a KDP manuscript
- `bug-hunt` — adversarial defect-finding pass
- `durability-check` — post-change verification before calling work done
- `fact-check` — verify claims against code/docs
- `fix-design` — root-cause-first bug fix design
- `kdp-book-writer` — draft a full book for KDP
- `product-recon` — PRD + data dictionary for new/early-stage projects
- `scalability-audit` — find what breaks first under load/growth
- `test-first` — write the test before the implementation
- `ui-excellence` — UI design and build discipline
- `vibe-build` — spec-driven implementation of an approved PRD
