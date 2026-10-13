#!/usr/bin/env bash
# Installs Warm Web Studio + the upstream skills it builds on into Hermes Agent.
set -euo pipefail
HERMES_SKILLS="${HERMES_HOME:-$HOME/.hermes}/skills"
CAT="$HERMES_SKILLS/creative"
HERE="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
mkdir -p "$CAT"

echo "==> Installing warm-web-studio"
rm -rf "$CAT/warm-web-studio"
cp -R "$HERE/skills/warm-web-studio" "$CAT/warm-web-studio"

echo "==> Fetching upstream skills (best effort)"
pull () {  # repo  subpath-glob-root
  local repo="$1" name; name="$(basename "$repo")"
  if git clone --depth 1 "https://github.com/$repo" "$TMP/$name" >/dev/null 2>&1; then
    find "$TMP/$name" -name SKILL.md -not -path '*/node_modules/*' | while read -r f; do
      d="$(dirname "$f")"; s="$(basename "$d")"
      case "$s" in
        gsap-*|frontend-design|web-artifacts-builder|canvas-design|gsap-web|accessible-animation|60fps-animation|page-transition-animation|svg-animation|lottie-animation|scroll-experience|3d-web-experience)
          rm -rf "$CAT/$s"; cp -R "$d" "$CAT/$s"; echo "   + $s";;
      esac
    done
  else
    echo "   ! could not clone $repo (skipping)"
  fi
}
pull greensock/gsap-skills
pull iart-ai/web-animation-skills
pull anthropics/skills
pull davila7/claude-code-templates   # contains scroll-experience / 3d-web-experience

echo "Done. Verify:  hermes skills list   |   hermes chat --toolsets skills -q 'Show me warm-web-studio'"
