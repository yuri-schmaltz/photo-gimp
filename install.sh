#!/usr/bin/env bash
set -euo pipefail

# PhotoGIMP installer for Linux/macOS
# Usage: ./install.sh
# Copies .config/GIMP/3.0 and .local assets from repo to user profile,
# creating a timestamped backup of existing GIMP configs when present.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_CONFIG="$SCRIPT_DIR/.config/GIMP/3.0"
SRC_LOCAL="$SCRIPT_DIR/.local"

if [[ ! -d "$SRC_CONFIG" ]]; then
  echo "[ERROR] Source config not found at $SRC_CONFIG" >&2
  exit 1
fi

# Detect target config base
TARGET_CONFIG_BASE=""
if [[ -d "$HOME/.var/app/org.gimp.GIMP/config/GIMP" ]]; then
  TARGET_CONFIG_BASE="$HOME/.var/app/org.gimp.GIMP/config/GIMP"
elif [[ -d "$HOME/.config/GIMP" ]] || [[ ! -d "$HOME/Library/Application Support/GIMP" ]]; then
  TARGET_CONFIG_BASE="$HOME/.config/GIMP"
elif [[ -d "$HOME/Library/Application Support/GIMP" ]]; then
  TARGET_CONFIG_BASE="$HOME/Library/Application Support/GIMP"
else
  TARGET_CONFIG_BASE="$HOME/.config/GIMP"
fi

TARGET_CONFIG_DIR="$TARGET_CONFIG_BASE/3.0"
BACKUP_SUFFIX="backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$TARGET_CONFIG_BASE"

if [[ -d "$TARGET_CONFIG_DIR" ]]; then
  BACKUP_DIR="$TARGET_CONFIG_DIR.$BACKUP_SUFFIX"
  echo "[INFO] Existing config detected. Creating backup at: $BACKUP_DIR"
  cp -a "$TARGET_CONFIG_DIR" "$BACKUP_DIR"
fi

echo "[INFO] Copying config to $TARGET_CONFIG_DIR"
mkdir -p "$TARGET_CONFIG_BASE"
rsync -a --delete "$SRC_CONFIG/" "$TARGET_CONFIG_DIR/"

# Copy .local assets when present
if [[ -d "$SRC_LOCAL" ]]; then
  TARGET_LOCAL="$HOME/.local"
  echo "[INFO] Copying .local assets to $TARGET_LOCAL"
  mkdir -p "$TARGET_LOCAL"
  rsync -a "$SRC_LOCAL/" "$TARGET_LOCAL/"
fi

echo "[SUCCESS] PhotoGIMP installed. Restart GIMP to apply changes."
if [[ -n "${BACKUP_DIR:-}" ]]; then
  echo "[NOTE] Backup stored at: $BACKUP_DIR"
fi
