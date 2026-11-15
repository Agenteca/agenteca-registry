# agenteca-registry

Official starter catalog of Agenteca, and its example package.

> Status: 0.1.0. This repository is online and usable as a registry. The `ahub` command is not on npm yet: build it from [agenteca-cli](https://github.com/agenteca/agenteca-cli).

## Using it as a registry

```bash
ahub registry add agenteca/agenteca-registry
```

```bash
ahub search
```

```bash
ahub add hello-agent@agenteca-registry --tool claude
```

From a local copy: `ahub registry add ./agenteca-registry`.

## No format of our own

The catalog is the `marketplace:` block of [`apm.yml`](apm.yml), defined by the OpenAPM specification (§4.7). This repository is therefore readable by `ahub` and by `apm`.

Three fields per package are not in the specification and are specific to Agenteca. Other tools ignore them:

| Field | Purpose |
|---|---|
| `tools` | Compatible tools (`claude`, `codex`, `copilot`, `cursor`): used by the search filter |
| `nativePlugin` | The repository also has the layout of a native plugin of its tool |
| `category` | Grouping for display |

Catalog entries are written in English; agents and skills ask the model to answer in the user's language.

## Native marketplaces

The files below are **generated** from `apm.yml` by `scripts/export.sh`. Do not edit them by hand.

| File | Read by |
|---|---|
| `.claude-plugin/marketplace.json` | Claude Code (`/plugin marketplace add agenteca/agenteca-registry`) |
| `.agents/plugins/marketplace.json` | Codex |
| `.github/plugin/marketplace.json` | GitHub Copilot CLI |

They only list the **native plugins** of each tool. The `hello-agent` package is not in them: it is an OpenAPM package, which these tools cannot install on their own. It is installed with `ahub` or `apm`.

No Cursor export: its format only documents local sources.

`claude plugin validate` accepts the Claude Code file with a warning: the name `agenteca-claude-code` "looks like an Anthropic plugin". It is the name of the repository; to be settled before a submission to an official directory.

## Example package

[`examples/hello-agent`](examples/hello-agent) contains one primitive of each type: skill, agent, command, instruction, hook, MCP server.

```bash
scripts/check-example.sh
```

This script installs the example for the four tools in a throwaway folder, checks the 24 expected files, removes it, and checks that nothing is left.

Versions of the example package: git tags `hello-agent--v<version>` (OpenAPM convention for a package in a subfolder).

## Proposing a package

Open a pull request that adds an entry to `apm.yml`. The package must:

- be a public git repository, with a declared license (SPDX identifier);
- pass `ahub scan` with no critical finding;
- describe its hooks and MCP servers clearly: they are commands run on the user's machine;
- have its catalog entry (description, tags) written in English.

Being in this catalog is not a security audit: `ahub` always shows the content before installing, read it.

## License

Apache-2.0.
