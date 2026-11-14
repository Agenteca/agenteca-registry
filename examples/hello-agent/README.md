# hello-agent

Paquet d'exemple d'Agenteca : une primitive de chaque type, pour vérifier qu'une installation fonctionne dans Claude Code, Codex, GitHub Copilot et Cursor.

```bash
ahub add agenteca/agenteca-registry/examples/hello-agent --tool claude,codex,copilot,cursor
```

Depuis une copie locale de ce dépôt :

```bash
ahub add ./examples/hello-agent --tool claude
```

`ahub` affiche d'abord tout ce qui sera écrit, dont deux éléments exécutables : un hook qui affiche une ligne (`echo`), et un serveur MCP lancé par `npx -y @modelcontextprotocol/server-memory`. Ce serveur est téléchargé par `npx` au moment où votre outil le démarre, pas à l'installation.

Pour tout retirer :

```bash
ahub remove hello-agent
```

Le contenu est décrit dans [`references/primitives.md`](.apm/skills/hello-agenteca/references/primitives.md).
