#!/bin/sh
# Installs the example package for the four tools in a throwaway project, checks
# the expected files, then removes it and checks that nothing is left.
# Usage: scripts/check-example.sh [ahub command]   (default: ahub)
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
  if [ ! -f "$f" ]; then echo "MISSING: $f"; fail=1; fi
done
count=$(find . -type f | wc -l)
echo "Installed: $count files for Claude Code, Codex, Copilot and Cursor."

$AHUB remove hello-agent --yes >/dev/null
left=$(find . -type f ! -name apm.yml ! -name apm.lock.yaml | wc -l)
if [ "$left" -ne 0 ]; then echo "LEFT after removal:"; find . -type f ! -name apm.yml ! -name apm.lock.yaml; fail=1; fi
echo "Removed: $left file(s) left besides the manifest and the lockfile."
exit $fail
