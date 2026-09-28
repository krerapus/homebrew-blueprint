# homebrew-blueprint

Homebrew tap for the Blueprint CLI (`Formula/blueprint.rb` only).

**Not** the source of truth for CLI builds. Archives come from [`agent-harness-blueprint`](https://github.com/krerapus/agent-harness-blueprint) GitHub Releases. Packs come from [`assets-blueprint`](https://github.com/krerapus/assets-blueprint) via `blueprint assets …`.

Canonical release docs:

- [release.md](https://github.com/krerapus/agent-harness-blueprint/blob/master/docs/release.md) — architecture / channels
- [release-workflow.md](https://github.com/krerapus/agent-harness-blueprint/blob/master/docs/release-workflow.md) — production runbook
- [homebrew.md](https://github.com/krerapus/agent-harness-blueprint/blob/master/docs/homebrew.md) — Formula bump, secrets, troubleshooting

```text
CLI Release (agent-harness-blueprint)
    → Formula PR on this tap (urls + sha256)
    → brew install / upgrade blueprint
```

## Install

Tap name: `krerapus/blueprint` (GitHub repo: `homebrew-blueprint`).

Tap name is `krerapus/blueprint` (GitHub repo `homebrew-blueprint`). Homebrew resolves the short tap to `https://github.com/krerapus/homebrew-blueprint`.

```bash
brew tap krerapus/blueprint
brew trust --formula krerapus/blueprint/blueprint   # Homebrew 6+/7, once
brew install krerapus/blueprint/blueprint
blueprint --version

# Packs are not bottled in the Formula — install after first setup
blueprint assets install core
blueprint assets list
```

Upgrade: `brew update && brew upgrade krerapus/blueprint/blueprint`

The Formula installs the full release tree under `libexec` and exposes `bin/blueprint`.

## Scope

| In this repo | Not in this repo |
|--------------|------------------|
| `Formula/blueprint.rb` | CLI source, packs, harness docs, agent memory |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Prefer the automated Formula-bump PR from CLI Release.

## License

MIT — see [LICENSE](LICENSE).
