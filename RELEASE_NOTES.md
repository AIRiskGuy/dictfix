# Release Notes — dictfix v1.3.0

**Release date:** 2026-03-26

## What's New

### Interactive installer

`./install.sh` now guides you through the complete setup with interactive prompts:

```
────────────────────────────────────────
  dictfix installer
────────────────────────────────────────

Step 1: Dependencies
  [OK] Homebrew found
  [OK] Python 3 found
  Install espanso (required dependency)? [Y/n]

Step 2: Install dictfix CLI
  [OK] Installed: ~/bin/dictfix -> ./dictfix

Step 3: Service registration
  Register espanso as a login service (auto-start on reboot)? [Y/n]
  [OK] Service registered
  Start espanso now? [Y/n]
```

### Auto-start on reboot

The installer now prompts to register espanso as a macOS login service. Once registered, espanso starts automatically after reboot — no manual intervention needed. dictfix itself is a CLI tool and does not need a service.

### Troubleshooting guide

New README section covering:
- Checking if espanso is installed and running
- Verifying auto-start registration
- Fixing corrections that aren't being applied
- Recovering after macOS updates revoke permissions
- Handling antivirus false positives
- Resolving the `dfx` alias not loading
- How to report bugs

## Upgrade

```bash
cd /path/to/dictfix
git pull
```

To re-run the installer (safe to run multiple times):

```bash
./install.sh
```

## Full Changelog

See [CHANGELOG.md](CHANGELOG.md) for the complete list of changes.
