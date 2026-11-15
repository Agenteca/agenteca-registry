# What the hello-agent package installs

| Primitive | Name | Purpose |
|---|---|---|
| Skill | `hello-agenteca` | Confirms that the package is installed |
| Agent | `greeter` | An agent that welcomes the user and explains Agenteca |
| Command | `hello` | Shortcut that runs the check |
| Instruction | `tone` | Asks for a plain tone in Markdown files |
| Hook | `session` | Prints one line at the end of an answer |
| MCP server | `hello-memory` | The MCP project's reference "memory" server |

Depending on the tool, some primitives do not exist (for example per-file instructions in Codex):
`ahub` reports it with a warning at installation.
