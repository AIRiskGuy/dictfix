# Release Notes — dictfix v1.2.0

**Release date:** 2026-03-26

## What's New

### `dictfix doctor` command

New diagnostic command that checks your macOS system settings for optimal dictation accuracy:

```bash
dfx doctor
```

Checks performed:
- macOS version (13+ required for on-device dictation)
- Apple Silicon detection (enables on-device ML processing)
- Dictation enabled status
- System locale / language configuration
- Microphone input volume (flags if below 70%)
- espanso running status
- Corrections file and count
- Accessibility and Input Monitoring permissions for espanso

Each check reports `[OK]`, `[!!]` (issue with fix instructions), or `[..]` (informational). Includes tips for reducing dictation errors at the OS level.

### Improved documentation

- "Improving Dictation Accuracy" section added to README with OS-level tips
- Removed user-specific paths from CLAUDE.md for public repo compatibility

## Upgrade

```bash
cd /path/to/dictfix
git pull
```

The symlink picks up changes automatically.

## Full Changelog

See [CHANGELOG.md](CHANGELOG.md) for the complete list of changes.
