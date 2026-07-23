---
name: ui-excellence
description: Use when designing or building any UI — screens, pages, components, dashboards, layouts, themes, styling, dark mode, animations, or 3D/depth effects. Targets a production-ready bar, not prototype-passable: never ship unmodified framework/library default theme tokens. Decisions before code - hierarchy ranking, a spacing/type/radius/elevation system, color as formula, typography discipline, physically-consistent depth and motion, the full state matrix (empty/loading/error), and a mandatory render-critique loop backed by real verification (computed contrast, a running instance) when a screenshot isn't available.
---

ROLE: You are designing and building UI. Decisions come before code; most bad UI is bad
hierarchy, not bad styling. The bar is PRODUCTION-READY, not prototype-passable — "it's just a
skeleton/scaffold/MVP" is never a reason to skip this skill or ship a lower bar; skeletons get
seen by real users too. Follow this order strictly:

0. NEVER SHIP UNMODIFIED DEFAULTS. A freshly scaffolded design system (shadcn, MUI, Bootstrap,
   Tailwind's own zero-chroma grays) is a placeholder, not a finished product — "the components
   render" is not "the design is done." Before calling any UI complete, grep the theme file for
   default tokens (pure `oklch(x 0 0)` / `#000`,`#fff`,`#XXX`-style grays, unmodified generator
   comments, default font stacks) and treat every hit as an open task, not a pass.

1. HIERARCHY FIRST. For each screen, answer in writing: what is the ONE thing the user came here
   to know or do? Rank every element on the screen by importance. The #1 element gets dominant
   size, contrast, and position. If you cannot rank the elements, stop — no palette will rescue
   a flat screen where twelve elements shout at equal volume.
2. SYSTEM BEFORE COMPONENTS. Define once, then never deviate: a spacing scale (multiples of
   4/8px — no ad-hoc 13px), a type scale of 5–6 sizes max, a radius scale, an elevation scale.
   Every screen is assembled only from this vocabulary. Consistency is perceived as quality even
   when users can't name why.
3. COLOR AS FORMULA. Neutrals get a slight hue tint (pure gray reads dead). ONE accent color,
   used only for accent work (primary actions, active states) — if the accent appears
   everywhere, it means nothing. Semantic colors (red/green/amber) are RESERVED for meaning
   (danger/success/warning; profit/loss in financial UIs) and never used decoratively. Check
   contrast ratios (WCAG AA minimum) — compute, don't eyeball. Dark themes are built, not
   inverted: no pure black, desaturated accents, elevation via lightness steps rather than
   shadows.
4. TYPOGRAPHY DOES 70% OF THE WORK. Max 2–3 weights, used deliberately. Hierarchy = size +
   weight + color moving together. Data/numeric UIs use tabular figures so columns don't wobble.
   Line length 45–75 characters for reading text.
5. DEPTH & MOTION WITH PHYSICS. One consistent light source. Shadows layered: tight key shadow
   + soft ambient, never one blurry blob. 3D/perspective/parallax reserved for the few elements
   that deserve emphasis. Animate only transform and opacity (never layout properties). Duration
   hierarchy: small elements fast (~120–200ms), large surfaces slower (~250–400ms), with easing —
   nothing linear.
6. THE STATE MATRIX. Before calling any component done, design every state: hover, focus-visible,
   active, disabled, loading, EMPTY, error, overflowing text, extreme data (0 items and 10,000
   items). The empty and loading states are where users judge whether software is finished. A
   happy-path-only screen is an unfinished screen.
7. CRITIQUE LOOP — MANDATORY. After building, render/preview the result and critique it as a
   hostile design reviewer: what looks off, what's misaligned, what's flat, what's inconsistent
   with the system from step 2? Fix and re-render. Do this at least twice. First-pass output is
   a draft by definition. Prefer an actual screenshot (browser automation tool, `run` skill,
   platform preview) over a mental walk-through — go looking for one before assuming none exists.
   If truly none is available, the fallback is verification, not a vibe check: compute real
   contrast ratios for every new color pair (don't eyeball WCAG), start the app and confirm the
   changed markup/classes actually reached the rendered output, and walk the state matrix and
   system rules in writing. A self-review that never touched a number or a running instance is
   not a critique pass — it's a rubber stamp.
8. PRODUCTION-READY BAR — before calling it done, all of these hold, not just the happy path:
   - No default/placeholder tokens survive (see step 0) — colors, fonts, radii, spacing all
     traced to a deliberate decision.
   - Responsive at mobile/tablet/desktop breakpoints, not just the viewport you happened to check.
   - Keyboard-navigable and focus-visible on every interactive element, not just mouse-hover.
   - Every state in step 6 is actually implemented in code, not just described.
   - Copy is real copy, not lorem ipsum or "TODO" placeholders, unless the user explicitly asked
     for a content-blocked-out layout.
   - Light AND dark mode both pass the color-formula rules in step 3, if the app has both.
