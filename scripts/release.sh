#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

VERSION="${1:-}"
if [[ -z "$VERSION" ]]; then
  echo "Usage: ./scripts/release.sh vX.Y.Z [--latest]"
  exit 1
fi

if [[ ! "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Version must look like v0.1.0"
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI is required"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "gh is not authenticated in this shell. Run: gh auth login"
  exit 1
fi

mkdir -p dist

PACKAGE_SCRIPT="$HOME/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py"
if [[ ! -f "$PACKAGE_SCRIPT" ]]; then
  echo "Packaging script not found: $PACKAGE_SCRIPT"
  exit 1
fi

SKILLS=(
  acestep
  acestep-docs
  acestep-lyrics-transcription
  acestep-simplemv
  acestep-songwriting
  acestep-thumbnail
)

for skill in "${SKILLS[@]}"; do
  python3 "$PACKAGE_SCRIPT" "./skills/$skill" ./dist
  [[ -f "./dist/$skill.skill" ]] || { echo "Missing artifact: ./dist/$skill.skill"; exit 1; }
done

TITLE="ACE-Step Skills $VERSION"
NOTES_FILE="$(mktemp)"
cat > "$NOTES_FILE" <<EOF
Release $VERSION of the ACE-Step skills bundle.

Includes:
$(for skill in "${SKILLS[@]}"; do echo "- $skill"; done)

Artifacts:
$(for skill in "${SKILLS[@]}"; do echo "- dist/$skill.skill"; done)
EOF

ASSETS=()
for skill in "${SKILLS[@]}"; do
  ASSETS+=("dist/$skill.skill")
done

EXTRA_FLAGS=()
if [[ "${2:-}" == "--latest" ]]; then
  EXTRA_FLAGS+=("--latest")
fi

if gh release view "$VERSION" --repo dax8it/ace-step-skills >/dev/null 2>&1; then
  echo "Release $VERSION already exists. Uploading/replacing assets..."
  gh release upload "$VERSION" "${ASSETS[@]}" --repo dax8it/ace-step-skills --clobber
else
  gh release create "$VERSION" \
    "${ASSETS[@]}" \
    --repo dax8it/ace-step-skills \
    --title "$TITLE" \
    --notes-file "$NOTES_FILE" \
    "${EXTRA_FLAGS[@]}"
fi

rm -f "$NOTES_FILE"

echo "Done: https://github.com/dax8it/ace-step-skills/releases/tag/$VERSION"
