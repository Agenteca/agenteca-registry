# Ce que le paquet hello-agent installe

| Primitive | Nom | Rôle |
|---|---|---|
| Skill | `hello-agenteca` | Confirme que le paquet est installé |
| Agent | `greeter` | Un agent qui accueille et explique Agenteca |
| Commande | `hello` | Raccourci qui lance la vérification |
| Instruction | `tone` | Demande un ton sobre dans les fichiers Markdown |
| Hook | `session` | Affiche une ligne à la fin d'une réponse |
| Serveur MCP | `hello-memory` | Serveur de référence « memory » du projet MCP |

Selon l'outil, certaines primitives n'existent pas (par exemple les instructions par fichier dans Codex) :
`ahub` le signale par un avertissement à l'installation.
