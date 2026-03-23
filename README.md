# ACE-Step Skills

Reusable AI-agent skills for working with [ACE-Step](https://github.com/ace-step/ACE-Step-1.5): music generation, installation/troubleshooting, songwriting, lyrics transcription, thumbnail generation, and simple MV rendering.

## Repo Layout

```text
ace-step-skills/
├── skills/                # Source skill folders
├── dist/                  # Packaged .skill artifacts
├── docs/                  # Top-level repo docs / translations
├── scripts/               # Repo helpers (for example release automation)
├── INVENTORY.md           # Skill + script inventory
├── RELEASE_CHECKLIST.md   # Human release checklist
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
| `acestep-thumbnail` | Generate cover art / thumbnails for songs and MVs via Gemini | `scripts/acestep-thumbnail.sh`, `scripts/config.example.json` |

Full inventory: [INVENTORY.md](INVENTORY.md)

## Packaged Artifacts

The following packaged skill artifacts are built in `dist/`:

- `dist/acestep.skill`
- `dist/acestep-docs.skill`
- `dist/acestep-lyrics-transcription.skill`
- `dist/acestep-simplemv.skill`
- `dist/acestep-songwriting.skill`
- `dist/acestep-thumbnail.skill`

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

## Companion Skills for the Full Music Pipeline

This repo focuses on **ACE-Step-specific production and execution skills**. For the full music creation pipeline, pair it with these companion skills:

- `music-producer` — creates ACE-Step-ready music prompt packages, including caption direction, lyrics direction, BPM, structure, and generation strategy
- `lyricist` — writes stronger, more singable lyrics with better imagery, hooks, POV, and section structure
- `creative-critic` — critiques prompt packages before generation to reduce generic output and improve creative quality

### Recommended End-to-End Workflow

1. `music-producer` — shape the brief and generation plan
2. `lyricist` — write or refine the lyrics
3. `creative-critic` — critique the package before generation
4. `acestep` — generate the music
5. `acestep-lyrics-transcription` — create timed lyrics / LRC
6. `acestep-thumbnail` — generate cover art or MV background art
7. `acestep-simplemv` — render the final music video

## Releasing

Manual checklist:
- [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md)

One-command helper from an authenticated shell:

```bash
./scripts/release.sh v0.1.1
```

## Notes

- `config.example.json` files are examples; local `config.json` remains ignored.
- `acestep-simplemv` includes a small Remotion app under `scripts/`.
- `acestep-docs` and `acestep-songwriting` are documentation-only skills with no bundled executables.
- `git` is the preferred sync/push transport on this host; `gh` is best used for GitHub-specific actions like releases.
