# KDP Compliance Checklist (Stage B)

**Not independently re-verified live as of the last edit of this file** (the
web-research tools needed to fetch kdp.amazon.com were unavailable during
the session this was authored in). Treat every specific number below as
"last known, not current fact" — the skill's workflow requires attempting a
live fetch against the official KDP help pages before using any number from
here; use this file only as the fallback, and flag every value pulled from
it as unverified in the report.

## 1. Content policy

- No infringing content: verify the manuscript doesn't reuse copyrighted
  text/images without rights, and that any public-domain source material is
  genuinely public domain, not a recent translation/annotation someone else
  holds rights to.
- No prohibited content: illegal content, content that infringes rights,
  content that provides a poor customer experience (e.g. metadata promising
  content the book doesn't contain), excessive/undifferentiated content
  (near-duplicate of other listings).
- **AI-generated / AI-assisted content disclosure** — KDP requires authors
  to disclose in the publishing dashboard whether a title contains
  AI-generated text/images (created by an AI tool with minimal human
  authorship) versus AI-assisted content (human-authored, AI used to edit,
  refine, or research). Confirm the author knows this applies and has an
  answer ready for the dashboard questionnaire at publish time — this
  checklist item is a reminder to disclose, not a judgment on whether AI
  assistance is acceptable (KDP permits it; non-disclosure is the
  violation).
- Quality bar: content should be complete (not a fragment or teaser sold as
  a full book) and free of the kind of errors that would generate
  legitimate customer complaints.

## 2. Formatting

- **Trim size** fits the content type and page count (common paperback trims
  include 5x8, 5.5x8.5, 6x9, 8.5x11; children's illustrated books often use
  larger square or landscape trims). Confirm the chosen trim against KDP's
  current trim-size list at publish time.
- **Margins/gutter** scale with page count — higher page counts need a wider
  inside (gutter) margin so text isn't lost in the binding. Confirm current
  margin tables live; don't assume a flat margin regardless of page count.
- **Bleed** is required if any image or color block extends to the page
  edge; confirm bleed settings match KDP's current bleed requirements if the
  manuscript has full-bleed art.
- **Image resolution** — print interior images are generally expected at a
  minimum of 300 DPI at final trim size; lower-resolution art will look
  visibly soft in print. Verify current minimums live.
- **File format** — ebook: KPF (via Kindle Create) or EPUB are generally
  preferred over DOCX for reflowable formatting fidelity; print: PDF or
  DOCX. Confirm current accepted formats live.
- **Heading structure** — Heading 1 for chapter titles, Heading 2 for
  sub-sections only; avoid Heading 3/4 (consistent with `kdp-book-writer`'s
  drafting rule — this checklist should never contradict that skill).
- **Minimum page count** — paperback listings generally require a minimum
  page count (historically around 24 pages); confirm current minimum for
  the chosen trim/binding live.
- **Table of contents** — must actually navigate (linked TOC for ebook), not
  just be a styled list of text.

## 3. Metadata

- **Title/subtitle** — no promotional language ("free," "bestseller," "on
  sale," review-count claims), no unrelated keyword stuffing in the title
  field itself.
- **Description/blurb** — reasonable length limit (historically a few
  thousand characters); no HTML beyond a small allowed set; no contact
  info, URLs, or calls to action to buy elsewhere.
- **Keywords** — each of the (historically seven) keyword slots should be
  genuinely descriptive; don't repeat words already in the title/subtitle/
  author name, don't use another author's name, don't use subjective claims
  ("bestselling," "award-winning") unless independently true and
  substantiated.
- **Categories/BISAC** — chosen categories must genuinely match the content;
  don't select a high-traffic category the book doesn't belong in just for
  visibility.
- **Age range / grade range** — required and should be accurate for
  children's books; mismatched age metadata is a common source of bad
  reviews from parents whose kids received the wrong content.
- **Series metadata** — only set if the book is genuinely part of a series,
  with the correct reading-order number.

## 4. Quality / production red flags

- Broken or missing table of contents / navigation
- Typos or grammar errors dense enough to interfere with readability (an
  occasional typo is normal; a pattern of them is a rejection risk)
- Inconsistent fonts/styles bleeding in from copy-paste
- Blank or duplicated pages
- Cover: sufficient resolution (historically guidance is a minimum around
  1000px on the longest side, ideally much higher/print-resolution), no
  price or review-count text baked into the cover image, spine text present
  once the page count is high enough to have a visible spine.

## When re-running this stage

If a live fetch against kdp.amazon.com succeeds, replace the values above
with the fetched ones in the report and note the fetch date. If it fails,
use these values but write, next to each one used, "not re-verified live —
confirm on kdp.amazon.com before publishing."
