#!/usr/bin/env bash
# Install dictfix CLI
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/bin/dictfix"

# Ensure ~/bin exists
mkdir -p "$HOME/bin"

# Symlink the script
ln -sf "$SCRIPT_DIR/dictfix" "$TARGET"
chmod +x "$SCRIPT_DIR/dictfix"

echo "Installed: $TARGET -> $SCRIPT_DIR/dictfix"
echo "Ensure ~/bin is in your PATH."
