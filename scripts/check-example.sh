#!/bin/sh
# Installe le paquet d'exemple sur les quatre outils dans un projet jetable, vérifie
# les fichiers attendus, puis le retire et vérifie que rien ne reste.
# Usage : scripts/check-example.sh [commande ahub]   (défaut : ahub)
set -eu
AHUB="${1:-ahub}"
HERE="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
export AHUB_HOME="$WORK/home" AHUB_CACHE_DIR="$WORK/cache"
mkdir -p "$WORK/project" && cd "$WORK/project"

$AHUB add "$HERE/examples/hello-agent" --tool claude,codex,copilot,cursor --yes >/dev/null

fail=0
for f in \
  .claude/skills/hello-agenteca/SKILL.md .claude/agents/greeter.md .claude/commands/hello.md .claude/rules/tone.md .claude/settings.json .mcp.json \
  .agents/skills/hello-agenteca/SKILL.md .agents/skills/hello/SKILL.md .codex/agents/greeter.toml .codex/hooks.json .codex/config.toml \
  .github/agents/greeter.agent.md .github/prompts/hello.prompt.md .github/instructions/tone.instructions.md .github/hooks/hello-agent-session.json .github/mcp.json .vscode/mcp.json \
  .cursor/agents/greeter.md .cursor/commands/hello.md .cursor/rules/tone.mdc .cursor/hooks.json .cursor/mcp.json \
  apm.yml apm.lock.yaml
do
  if [ ! -f "$f" ]; then echo "MANQUANT : $f"; fail=1; fi
done
count=$(find . -type f | wc -l)
echo "Installé : $count fichiers pour Claude Code, Codex, Copilot et Cursor."

$AHUB remove hello-agent --yes >/dev/null
left=$(find . -type f ! -name apm.yml ! -name apm.lock.yaml | wc -l)
if [ "$left" -ne 0 ]; then echo "RESTE après retrait :"; find . -type f ! -name apm.yml ! -name apm.lock.yaml; fail=1; fi
echo "Retiré : il reste $left fichier hors manifeste et lockfile."
exit $fail
