# dictfix — CLAUDE.md

## Project Overview

CLI tool for managing macOS dictation/speech-to-text corrections via espanso.

## Architecture

- Single Python script (`dictfix`), no external dependencies beyond Python 3 stdlib
- Corrections stored in `~/.config/espanso/match/dictation-fixes.yml`
- Published (symlinked) to `~/bin/dictfix` via `./install.sh`
- Shell alias: `dfx` -> `dictfix`

## Development

- Source: `./dictfix` (project root)
- Install: `./install.sh` (symlinks to `~/bin/dictfix`)
- Repo: <https://github.com/AIRiskGuy/dictfix>

## Key Rules

- No external Python dependencies — stdlib only
- Personal correction data (.yml, .csv) must NEVER be committed (see .gitignore)
- Auto-restart espanso after any mutation (add/remove/import)
- Support both `dictfix` and `dfx` alias
- No hardcoded user-specific paths in committed files
