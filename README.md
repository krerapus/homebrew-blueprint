# homebrew-blueprint

Homebrew tap for the Blueprint CLI.

**This repository is not the source of truth for CLI builds.**  
Binaries/archives are produced by [`krerapus/agent-harness-blueprint`](https://github.com/krerapus/agent-harness-blueprint) GitHub Releases. This tap only stores `Formula/blueprint.rb`.

## Install

```bash
brew tap krerapus/blueprint https://github.com/krerapus/homebrew-blueprint
brew install blueprint
blueprint --version
blueprint assets install core
```

Upgrade:

```bash
brew update
brew upgrade blueprint
```

## Layout

```text
homebrew-blueprint/
├── Formula/
│   └── blueprint.rb
└── .github/workflows/
    └── formula-audit.yml
```

## Formula updates

After each CLI tag `vX.Y.Z`, the CLI release workflow opens a PR here that rewrites:

- `version`
- `url` → `.../releases/download/vX.Y.Z/blueprint_X.Y.Z_<os>_<arch>.tar.gz`
- `sha256` from release `checksums.txt`

Manual bump (from a CLI checkout that has `dist/`):

```bash
./scripts/bump-homebrew-formula.sh X.Y.Z dist ../homebrew-blueprint/Formula/blueprint.rb
```

See CLI docs: [`docs/homebrew.md`](https://github.com/krerapus/agent-harness-blueprint/blob/master/docs/homebrew.md).
