# ACE-Step Skills

Reusable AI-agent skills for working with [ACE-Step](https://github.com/ace-step/ACE-Step-1.5): music generation, installation/troubleshooting, songwriting, lyrics transcription, and simple MV rendering.

## Repo Layout

```text
ace-step-skills/
├── skills/                # Source skill folders
├── dist/                  # Packaged .skill artifacts
├── docs/                  # Top-level repo docs / translations
├── INVENTORY.md           # Skill + script inventory
└── README.md
```

## Skills in This Repo

| Skill | Purpose | Bundled scripts/resources |
|---|---|---|
| `acestep` | Generate/edit/remix music via ACE-Step API | `scripts/acestep.sh`, `scripts/config.example.json` |
| `acestep-docs` | ACE-Step installation, API, GPU, and troubleshooting docs | none |
| `acestep-lyrics-transcription` | Transcribe audio into timestamped lyrics (LRC/SRT/JSON) | `scripts/acestep-lyrics-transcription.sh`, `scripts/config.example.json` |
| `acestep-simplemv` | Render simple lyric music videos with Remotion | `scripts/render-mv.sh`, `scripts/render.sh`, `scripts/render.mjs`, Remotion project files |
| `acestep-songwriting` | Songwriting/planning guidance for ACE-Step prompts | none |

Full inventory: [INVENTORY.md](INVENTORY.md)

## Packaged Artifacts

The following packaged skill artifacts are built in `dist/`:

- `dist/acestep.skill`
- `dist/acestep-docs.skill`
- `dist/acestep-lyrics-transcription.skill`
- `dist/acestep-simplemv.skill`
- `dist/acestep-songwriting.skill`

## Install / Use

Copy one or more skill folders from `skills/` into your agent skill directory.

### Claude Code

Project-level:
```text
your-project/.claude/skills/
```

Global:
```text
~/.claude/skills/
```

### OpenAI Codex / similar agent layouts

Project-level:
```text
your-project/.agents/skills/
```

Global:
```text
~/.agents/skills/
```

## Packaging

This repo uses the OpenClaw `skill-creator` packaging script. Example:

```bash
python3 ~/.npm-global/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py ./skills/acestep ./dist
```

## Notes

- `config.example.json` files are examples; local `config.json` remains ignored.
- `acestep-simplemv` includes a small Remotion app under `scripts/`.
- `acestep-docs` and `acestep-songwriting` are documentation-only skills with no bundled executables.
