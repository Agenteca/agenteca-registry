# agenteca-registry

Catalogue officiel de départ d'Agenteca, et son paquet d'exemple.

> État : 0.1.0. Ce dépôt est en ligne et utilisable comme registre. La commande `ahub` n'est pas encore sur npm : construisez-la depuis [agenteca-cli](https://github.com/agenteca/agenteca-cli).

## S'en servir comme registre

```bash
ahub registry add agenteca/agenteca-registry
```

```bash
ahub search
```

```bash
ahub add hello-agent@agenteca-registry --tool claude
```

Depuis une copie locale : `ahub registry add ./agenteca-registry`.

## Aucun format maison

Le catalogue est le bloc `marketplace:` de [`apm.yml`](apm.yml), défini par la spécification OpenAPM (§4.7). Ce dépôt est donc lisible par `ahub` et par `apm`.

Trois champs par paquet ne sont pas dans la spécification et sont propres à Agenteca. D'autres outils les ignorent :

| Champ | Rôle |
|---|---|
| `tools` | Outils compatibles (`claude`, `codex`, `copilot`, `cursor`) : sert au filtre de recherche |
| `nativePlugin` | Le dépôt a aussi la disposition d'un plugin natif de son outil |
| `category` | Regroupement d'affichage |

## Marketplaces natifs

Les fichiers ci-dessous sont **générés** depuis `apm.yml` par `scripts/export.sh`. Ne les modifiez pas à la main.

| Fichier | Lu par |
|---|---|
| `.claude-plugin/marketplace.json` | Claude Code (`/plugin marketplace add agenteca/agenteca-registry`) |
| `.agents/plugins/marketplace.json` | Codex |
| `.github/plugin/marketplace.json` | GitHub Copilot CLI |

Ils ne listent que les **plugins natifs** de chaque outil. Le paquet `hello-agent` n'y figure pas : c'est un paquet OpenAPM, que ces outils ne savent pas installer seuls. Il s'installe avec `ahub` ou `apm`.

Pas d'export Cursor : son format ne documente que des sources locales.

`claude plugin validate` accepte le fichier Claude Code avec un avertissement : le nom `agenteca-claude-code` « ressemble à un plugin d'Anthropic ». C'est le nom du dépôt ; à trancher avant une soumission à un annuaire officiel.

## Paquet d'exemple

[`examples/hello-agent`](examples/hello-agent) contient une primitive de chaque type : skill, agent, commande, instruction, hook, serveur MCP.

```bash
scripts/check-example.sh
```

Ce script installe l'exemple pour les quatre outils dans un dossier jetable, vérifie les 24 fichiers attendus, le retire, et vérifie que rien ne reste.

Versions du paquet d'exemple : étiquettes git `hello-agent--v<version>` (convention OpenAPM pour un paquet en sous-dossier).

## Proposer un paquet

Ouvrez une demande d'ajout avec une entrée dans `apm.yml`. Le paquet doit :

- être un dépôt git public, avec une licence déclarée (identifiant SPDX) ;
- passer `ahub scan` sans constat critique ;
- décrire clairement ses hooks et ses serveurs MCP : ce sont des commandes exécutées sur la machine de l'utilisateur.

Figurer dans ce catalogue ne vaut pas audit de sécurité : `ahub` montre toujours le contenu avant d'installer, lisez-le.

## Licence

Apache-2.0.
