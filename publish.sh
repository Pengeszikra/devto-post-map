#!/usr/bin/env bash
# Publish a downloaded post-map bundle to GitHub Pages.
# Usage (run inside your devto-post-map clone):
#   ./publish.sh                 # uses the newest .zip in ~/Downloads
#   ./publish.sh path/to/repo.zip
#   ./publish.sh path/to/folder  # an already unzipped folder
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

SRC="${1:-}"
if [[ -z "$SRC" ]]; then
  SRC="$(ls -t "$HOME"/Downloads/*.zip 2>/dev/null | head -n1 || true)"
  [[ -n "$SRC" ]] || { echo "No .zip found in ~/Downloads. Pass a path: ./publish.sh <zip|folder>"; exit 1; }
fi
[[ -e "$SRC" ]] || { echo "Not found: $SRC"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

if [[ -d "$SRC" ]]; then
  cp -R "$SRC"/. "$TMP"/
else
  unzip -q "$SRC" -d "$TMP"
fi

# Find the folder that contains index.html (zip may wrap it in repo/)
ROOT="$(dirname "$(find "$TMP" -name index.html -not -path '*/__MACOSX/*' | head -n1)")"
[[ -f "$ROOT/index.html" ]] || { echo "No index.html in $SRC"; exit 1; }

echo "Source: $SRC"
for f in index.html mindmap.svg README.md publish.sh; do
  [[ -f "$ROOT/$f" ]] && cp "$ROOT/$f" "./$f" && echo "  ✓ $f"
done
chmod +x publish.sh

git add index.html mindmap.svg README.md publish.sh
if git diff --cached --quiet; then
  echo "Nothing changed — already up to date."
  exit 0
fi

MSG="${PUBLISH_MSG:-Update post map $(date +%Y-%m-%d\ %H:%M)}"
git commit -q -m "$MSG"
git push -q
echo "Pushed: $MSG"
echo "Live in ~1 min: https://pengeszikra.github.io/devto-post-map/"
