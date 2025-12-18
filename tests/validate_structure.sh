#!/usr/bin/env bash
set -euo pipefail

missing=0
require() {
  if [[ ! -e "$1" ]]; then
    echo "[ERROR] Missing required path: $1" >&2
    missing=1
  fi
}

require ".config/GIMP/3.0/gimprc"
require ".config/GIMP/3.0/shortcutsrc"
require ".local/share/icons/hicolor/256x256/256x256.png"
require "LICENSE"
require "README.md"

if [[ $missing -ne 0 ]]; then
  exit 1
fi

echo "[OK] Structure validated"
