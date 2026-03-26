# dictfix

CLI tool for managing macOS dictation (speech-to-text) corrections, powered by [espanso](https://espanso.org).

## Problem

macOS dictation frequently transcribes words incorrectly — especially with regional accents, technical vocabulary, or brand names. Built-in Text Replacements don't work reliably in Terminal or VS Code because the correction event fires too late. `dictfix`, a CLI tool, solves this by managing an [espanso](https://espanso.org) correction list that replaces misunderstood words and phrases the instant they appear, in any app on the system.

## Usage

```bash
dictfix add <wrong> <correct>       # Add or update a correction
dictfix remove <wrong>              # Remove a correction (alias: rm)
dictfix list                        # List all corrections (alias: ls)
dictfix search <term>               # Search corrections (alias: find)
dictfix import <csv_file>           # Bulk import from CSV (wrong,correct per line)
dictfix export [csv_file]           # Export to CSV (stdout if no file given)
dictfix test <text>                 # Preview corrections applied to text
dictfix doctor                      # Check system settings for optimal dictation accuracy
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
dfx add "wanna" "want to"
dfx ls
dfx rm "wanna"
```

## Examples

### Single-word corrections

```bash
# Accent-related misrecognition
dfx add "contant" "content" # word misrecognition
dfx add "tronno" "Toronto" # voiced alveolar flap
dfx add "chrono" "Toronto" # voiced alveolar flap
dfx add "warshington" "washington" # City name misrecognition
dfx add "wadder" "water" # word misrecognition

# Informal speech cleanup
dfx add "gonna" "going to"
dfx add "wanna" "want to"
dfx add "gotta" "got to"
dfx add "kinda" "kind of"
dfx add "shoulda" "should have"
dfx add "coulda" "could have"
dfx add "woulda" "would have"

# Brand name misrecognition
dfx add "cloud" "claude"
dfx add "get hub" "GitHub"
dfx add "get her" "GitHub"
dfx add "java script" "JavaScript"
dfx add "type script" "TypeScript"
dfx add "post gress" "Postgres"
dfx add "dock her" "Docker"
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

## Improving Dictation Accuracy

Run `dictfix doctor` to check your system settings:

```bash
dfx doctor
```

This checks macOS version, processor type, dictation status, microphone input volume, espanso status, permissions, and correction count. It flags issues and provides fix instructions.

### Tips Beyond dictfix

dictfix corrects errors *after* they happen. To reduce errors at the source:

- **Microphone**: Ensure input volume is 70%+ in System Settings > Sound > Input. Use a headset in noisy or echoey environments.
- **"Correct that"**: Say "Correct that" immediately after a misrecognized word to see alternatives. Select the correct option by number.
- **Enhanced Dictation**: On Apple Silicon Macs, on-device processing provides better accuracy. Toggle dictation off and back on in System Settings > Keyboard > Dictation to reset the service.
- **Language settings**: Verify dictation language matches the language you are speaking in System Settings > Keyboard > Dictation > Language.
- **Keep macOS updated**: Apple regularly improves the speech recognition model. Specific phonetic bugs (e.g., words with 'R') are often fixed in point releases.

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
