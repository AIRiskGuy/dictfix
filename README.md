# dictfix

CLI tool for managing macOS dictation (speech-to-text) corrections, powered by [espanso](https://espanso.org).

## Problem

macOS dictation frequently transcribes words incorrectly — especially with accents, technical vocabulary, or brand names. Built-in Text Replacements don't work reliably in Terminal or VS Code because the correction event fires too late. dictfix solves this by managing an [espanso](https://espanso.org) correction list that replaces misheard words the instant they appear, in any app.

## Usage

```bash
dictfix add <wrong> <correct>       # Add or update a correction
dictfix remove <wrong>              # Remove a correction (alias: rm)
dictfix list                        # List all corrections (alias: ls)
dictfix search <term>               # Search corrections (alias: find)
dictfix import <csv_file>           # Bulk import from CSV (wrong,correct per line)
dictfix export [csv_file]           # Export to CSV (stdout if no file given)
dictfix test <text>                 # Preview corrections applied to text
dictfix help                        # Show full help (alias: -h, --help)
dictfix --version                   # Show version
```

### Shorthand

Add this alias to your shell profile for faster access:

```bash
alias dfx='dictfix'
```

Then use `dfx` anywhere you would use `dictfix`:

```bash
dfx add "Contant" "content"
dfx ls
dfx rm "Contant"
```

## Examples

### Single-word corrections

```bash
dfx add "Contant" "content"         # Accent-related misrecognition
dfx add "Contants" "contents"
dfx add "gonna" "going to"          # Informal speech cleanup
dfx add "wanna" "want to"
dfx add "gotta" "got to"
dfx add "kinda" "kind of"
dfx add "shoulda" "should have"
dfx add "coulda" "could have"
dfx add "woulda" "would have"
```

### Multi-word / phrase corrections

```bash
dfx add "get hub" "GitHub"          # Brand name misrecognition
dfx add "get her" "GitHub"
dfx add "java script" "JavaScript"
dfx add "type script" "TypeScript"
dfx add "post gress" "Postgres"
dfx add "docking her" "Docker"
```

### Bulk import from CSV

Create a CSV file with `wrong,correct` per line:

```csv
Contant,content
get hub,GitHub
gonna,going to
```

Then import:

```bash
dfx import ~/my-corrections.csv
```

### Preview corrections

```bash
dfx test "I wanna push this to get hub"
# Original:  I wanna push this to get hub
# Corrected: I want to push this to GitHub
```

## Installation

### Prerequisites

```bash
brew install espanso
```

Grant macOS permissions when prompted:
- **System Settings > Privacy & Security > Accessibility** — enable Espanso
- **System Settings > Privacy & Security > Input Monitoring** — enable Espanso

### Install dictfix

```bash
git clone https://github.com/crankd/dictfix.git
cd dictfix
./install.sh
```

This symlinks the `dictfix` script to `~/bin/dictfix`. Ensure `~/bin` is in your `PATH`.

## Dependencies

| Dependency | Purpose | Install |
|-----------|---------|---------|
| [espanso](https://espanso.org) | Open-source text expander that performs the actual corrections system-wide | `brew install espanso` |
| Python 3 | Runtime for the dictfix CLI (stdlib only, no pip packages) | Pre-installed on macOS |

## Data Storage

Corrections are stored locally at:

```
~/.config/espanso/match/dictation-fixes.yml
```

This file contains your personal correction data and is excluded from version control via `.gitignore`. It never leaves your machine.

## Privacy and Security

**Assessment date: 2026-03-26**

dictfix itself is a local Python script with no network activity. Its dependency, espanso, has been evaluated for privacy and security:

| Factor | Assessment |
|--------|-----------|
| Runs locally | Yes — fully local, no cloud component |
| Data sent externally | No (only network activity is optional package downloads from GitHub) |
| Telemetry / analytics | None — zero telemetry code in the codebase |
| Open source | Yes — GPL-3.0, written in Rust, ~13.5k GitHub stars |
| Keystroke logging | Intercepts but does not log; only last 3 characters held in memory |
| Known CVEs | Zero (NIST NVD) |
| Formal security audit | None published |
| macOS permissions | Accessibility + Input Monitoring (standard for text expanders) |

**Summary**: All correction data stays on your machine. Espanso is open-source, has no telemetry, does not log keystrokes, and has no known vulnerabilities. The primary trust decision is granting Accessibility and Input Monitoring permissions, which is inherent to any text expander. The source code is fully auditable at [github.com/espanso/espanso](https://github.com/espanso/espanso).

## License

[MIT](LICENSE)
