# ACE-Step Skills Release Checklist

Use this checklist for future releases of this repo.

## 1) Sync and inspect

```bash
cd /Users/Shared/GITHUB/ace-step-skills
git fetch origin
git pull --rebase origin main
git status
```

## 2) Confirm skill inventory is current

Verify every skill under `skills/*/SKILL.md` is represented in:
- `README.md`
- `INVENTORY.md`

Current expected skills:
- `acestep`
- `acestep-docs`
- `acestep-lyrics-transcription`
- `acestep-simplemv`
- `acestep-songwriting`
- `acestep-thumbnail`

## 3) Rebuild packaged artifacts

```bash
mkdir -p dist
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep ./dist
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep-docs ./dist
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep-lyrics-transcription ./dist
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep-simplemv ./dist
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep-songwriting ./dist
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep-thumbnail ./dist
```

## 4) Verify packaged files exist

```bash
ls -1 dist/*.skill
```

Expected artifacts:
- `dist/acestep.skill`
- `dist/acestep-docs.skill`
- `dist/acestep-lyrics-transcription.skill`
- `dist/acestep-simplemv.skill`
- `dist/acestep-songwriting.skill`
- `dist/acestep-thumbnail.skill`

## 5) Commit and push

```bash
git add README.md INVENTORY.md RELEASE_CHECKLIST.md scripts/release.sh dist
git commit -m "Release prep <version>"
git push origin main
```

## 6) Create GitHub release

Prefer the helper script:

```bash
./scripts/release.sh v0.1.1
```

Or manually:

```bash
gh release create v0.1.1 \
  dist/acestep.skill \
  dist/acestep-docs.skill \
  dist/acestep-lyrics-transcription.skill \
  dist/acestep-simplemv.skill \
  dist/acestep-songwriting.skill \
  dist/acestep-thumbnail.skill \
  --repo dax8it/ace-step-skills \
  --title "ACE-Step Skills v0.1.1" \
  --notes "Release notes here"
```

## 7) Verify public links

- Repo: `https://github.com/dax8it/ace-step-skills`
- Releases: `https://github.com/dax8it/ace-step-skills/releases`
- Tag page pattern: `https://github.com/dax8it/ace-step-skills/releases/tag/vX.Y.Z`

## Notes

- `git` is the preferred transport for sync/push on this host.
- `gh` is for GitHub API features like releases.
- If `gh auth status` works in your shell but not in the agent exec environment, run the release helper from your authenticated shell.
