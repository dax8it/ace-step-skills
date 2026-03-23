# ACE-Step Skills Inventory

This file inventories every skill in this repo plus bundled scripts/resources relevant to execution and packaging.

## Skills

### acestep

- Path: `skills/acestep`
- Description: Use ACE-Step API to generate music, edit songs, and remix music. Supports text-to-music, lyrics generation, audio continuation, and audio repainting. Use this skill when users mention generating music, creating songs, music production, remix, or audio continuation.
- Bundled scripts/resources:
  - `skills/acestep/scripts/acestep.sh`
  - `skills/acestep/scripts/config.example.json`
- Packaged artifact: `dist/acestep.skill`

### acestep-docs

- Path: `skills/acestep-docs`
- Description: ACE-Step documentation and troubleshooting. Use when users ask about installing ACE-Step, GPU configuration, model download, Gradio UI usage, API integration, or troubleshooting issues like VRAM problems, CUDA errors, or model loading failures.
- Bundled scripts/resources: none
- Packaged artifact: `dist/acestep-docs.skill`

### acestep-lyrics-transcription

- Path: `skills/acestep-lyrics-transcription`
- Description: Transcribe audio to timestamped lyrics using OpenAI Whisper or ElevenLabs Scribe API. Outputs LRC, SRT, or JSON with word-level timestamps. Use when users want to transcribe songs, generate LRC files, or extract lyrics with timestamps from audio.
- Bundled scripts/resources:
  - `skills/acestep-lyrics-transcription/scripts/acestep-lyrics-transcription.sh`
  - `skills/acestep-lyrics-transcription/scripts/config.example.json`
- Packaged artifact: `dist/acestep-lyrics-transcription.skill`

### acestep-simplemv

- Path: `skills/acestep-simplemv`
- Description: Render music videos from audio files and lyrics using Remotion. Accepts audio + LRC/JSON lyrics + title to produce MP4 videos with waveform visualization and synced lyrics display. Use when users mention MV generation, music video rendering, creating video from audio/lyrics, or visualizing songs.
- Bundled scripts/resources:
  - `skills/acestep-simplemv/scripts/package-lock.json`
  - `skills/acestep-simplemv/scripts/package.json`
  - `skills/acestep-simplemv/scripts/remotion.config.ts`
  - `skills/acestep-simplemv/scripts/render-mv.sh`
  - `skills/acestep-simplemv/scripts/render.mjs`
  - `skills/acestep-simplemv/scripts/render.sh`
  - `skills/acestep-simplemv/scripts/src/AudioVisualization.tsx`
  - `skills/acestep-simplemv/scripts/src/Root.tsx`
  - `skills/acestep-simplemv/scripts/src/index.ts`
  - `skills/acestep-simplemv/scripts/src/parseLrc.ts`
  - `skills/acestep-simplemv/scripts/src/types.ts`
  - `skills/acestep-simplemv/scripts/tsconfig.json`
- Packaged artifact: `dist/acestep-simplemv.skill`

### acestep-songwriting

- Path: `skills/acestep-songwriting`
- Description: Music songwriting guide for ACE-Step. Provides professional knowledge on writing captions, lyrics, choosing BPM/key/duration, and structuring songs. Use this skill when users want to create, write, or plan a song before generating it with ACE-Step.
- Bundled scripts/resources: none
- Packaged artifact: `dist/acestep-songwriting.skill`
