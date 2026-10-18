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

## Plugins

Skills that ship with hooks are packaged as plugins, because copying a folder cannot install a
hook. This repo is a plugin marketplace; in Claude Code run:

```
/plugin marketplace add holutahyour/claude-skills
/plugin install challenge-idea@holutahyour-skills
```

- `challenge-idea` — stress-tests an idea, plan, skill choice or agent recommendation before it
  is adopted: steelmans it, finds weak points against the real context (each one cited), returns
  an improved version and a verdict (ADOPT / ADOPT REVISED / REPLACE / REJECT). Its hooks give
  Claude a standing rule at session start and remind it after every skill or agent call and inside every subagent —
  reminders only, nothing is blocked; small ideas get a one-line light pass.
  Needs `sh` on PATH (macOS/Linux, or Git for Windows). Skill only, without the hooks:
  `cp -r plugins/challenge-idea/skills/challenge-idea ~/.claude/skills/`

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
