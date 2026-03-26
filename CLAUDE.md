# dictfix — CLAUDE.md

## Project Overview
CLI tool for managing macOS dictation/speech-to-text corrections via espanso.

## Architecture
- Single Python script (`dictfix`), no external dependencies beyond Python 3 stdlib
- Corrections stored in `~/.config/espanso/match/dictation-fixes.yml`
- Published (symlinked) to `~/bin/dictfix`
- Shell alias: `dfx` -> `dictfix`

## Development
- Source: `/Users/dave/apps/crankd/dictfix/dictfix`
- Install: `ln -sf /Users/dave/apps/crankd/dictfix/dictfix ~/bin/dictfix`
- Repo: https://github.com/crankd/dictfix

## Key Rules
- No external Python dependencies — stdlib only
- Personal correction data (.yml, .csv) must NEVER be committed (see .gitignore)
- Auto-restart espanso after any mutation (add/remove/import)
- Support both `dictfix` and `dfx` alias
