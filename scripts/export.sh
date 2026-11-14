#!/bin/sh
# Régénère les marketplaces natifs à partir du bloc `marketplace:` d'apm.yml.
# À relancer après toute modification du catalogue.
set -eu
AHUB="${1:-ahub}"
cd "$(dirname "$0")/.."
for format in claude codex copilot; do
  $AHUB registry export . --format "$format" --out .
done
