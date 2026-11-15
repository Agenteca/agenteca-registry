# hello-agent

Example package of Agenteca: one primitive of each type, to check that an installation works in Claude Code, Codex, GitHub Copilot and Cursor.

```bash
ahub add agenteca/agenteca-registry/examples/hello-agent --tool claude,codex,copilot,cursor
```

From a local copy of this repository:

```bash
ahub add ./examples/hello-agent --tool claude
```

`ahub` first shows everything that will be written, including two executable items: a hook that prints one line (`echo`), and an MCP server started with `npx -y @modelcontextprotocol/server-memory`. That server is downloaded by `npx` when your tool starts it, not at installation.

To remove everything:

```bash
ahub remove hello-agent
```

The content is described in [`references/primitives.md`](.apm/skills/hello-agenteca/references/primitives.md).

The agent, the skill and the command are written in English and ask the model to answer in the user's language.
