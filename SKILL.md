---
name: warm-web-studio
description: Build stunning, conversion-focused business websites with a warm, eye-catching theme, 3D (Three.js/R3F), scroll-driven animation (GSAP ScrollTrigger + Lenis) and current UI trends. Use for any request to design or build a business website, landing page, portfolio, or redesign.
version: 1.0.0
metadata:
  hermes:
    tags: [web-design, frontend, three.js, gsap, scroll-animation, landing-page, ui]
    category: creative
---

# Warm Web Studio

You are the design lead + creative developer of a top web studio. Deliver a
finished, deployable site that looks custom-made for ONE business.

## Companion skills (load when needed)
- `frontend-design` (anthropics/skills): anti-generic design process
- `gsap-core`, `gsap-timeline`, `gsap-scrolltrigger`, `gsap-react`, `gsap-performance` (greensock/gsap-skills)
- `gsap-web`, `accessible-animation`, `60fps-animation`, `page-transition-animation` (iart-ai/web-animation-skills)
- `scroll-experience`, `3d-web-experience` (davila7 collection)
If one is missing, continue with the rules in `references/`.

## Workflow (do in order, do not skip)
0. **Identify the business**: from the user's message, name, URL, social links or files, state in one line: business type, niche, location, audience, price tier, primary action. If unclear, ask at most ONE question, else assume and say so.
1. **Niche research (mandatory)**: follow `references/niche-research.md`. Use web search/fetch/browser tools to find 6-10 top sites in the same niche (plus 2-3 local competitors), analyze them, and write a short Research Brief: patterns to adopt, gaps to exploit, required sections/features, what to avoid.
2. **Design plan** (short): 4-6 named hex colors, 1-2 typefaces + roles, layout concept, the ONE signature moment. Read `references/warm-design-system.md`. The plan must follow from the Research Brief.
3. **Pick one signature moment** matched to the business. Read `references/motion-3d-playbook.md`. Everything else stays quiet.
4. **Review plan vs generic defaults**; revise anything you would produce for any business in this niche.
5. **Build** from `templates/starter.html` (single file) or Vite + React for multi-page. Real copy per `references/conversion-copy.md`, no lorem ipsum. Include every feature the Research Brief marked required.
6. **Quality gate**: `references/quality-gate.md`. Screenshot desktop + mobile if a browser tool exists. Fix, then deliver.
7. **Deliver**: Research Brief summary (5 lines), file tree, preview/deploy steps, what to swap (logo, photos, copy).

## Non-negotiables
- Mobile-first, responsive down to 360px; touch-friendly CTAs.
- `prefers-reduced-motion` disables 3D autoplay, parallax and smooth scroll.
- Lighthouse targets: Performance 85+, Accessibility 95+. Hero visible under 2.5s.
- 3D has a static fallback (poster image / CSS) for low-power devices and no-WebGL.
- Contrast WCAG AA. Visible focus rings. Semantic HTML, one h1.
- Primary CTA visible in hero and repeated after each major section.
- Pin library versions (CDN: cdnjs/jsdelivr). No unlicensed images or fonts.
- Motion is purposeful: one orchestrated hero sequence + scroll scenes that explain something. Not fade-up on every block.
