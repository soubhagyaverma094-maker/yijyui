# Warm Web Studio

One Hermes Agent skill that makes your agent build stunning, warm-themed business
websites with 3D, scroll animation and current UI trends. It bundles its own
playbooks and installs the best existing community skills alongside it.

## Install
```bash
git clone https://github.com/YOUR_USERNAME/warm-web-studio
cd warm-web-studio && ./scripts/install.sh
```
Or, only the main skill, straight from GitHub:
```bash
hermes skills install https://raw.githubusercontent.com/YOUR_USERNAME/warm-web-studio/main/skills/warm-web-studio/SKILL.md
```
Manual: copy `skills/warm-web-studio` into `~/.hermes/skills/creative/`.

## Use
> Use the warm-web-studio skill. Build a website for [business], [city]. Audience: [x]. Goal: [calls/bookings/sales]. Palette: saffron & espresso. Signature moment: pinned 3D scroll.

## Layout
- `skills/warm-web-studio/SKILL.md` workflow and rules
- `references/` niche research procedure, design system, 3D + motion playbook, copy, quality gate
- `templates/starter.html` working Three.js + GSAP + Lenis starter
- `scripts/install.sh` installs this skill + upstream skills

## Upstream credits
greensock/gsap-skills, iart-ai/web-animation-skills, anthropics/skills, davila7 skill collection. Each keeps its own license.
