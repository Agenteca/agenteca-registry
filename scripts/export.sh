#!/bin/sh
# Regenerates the native marketplaces from the `marketplace:` block of apm.yml.
# Run it again after any change to the catalog.
set -eu
AHUB="${1:-ahub}"
cd "$(dirname "$0")/.."
for format in claude codex copilot; do
  $AHUB registry export . --format "$format" --out .
done
