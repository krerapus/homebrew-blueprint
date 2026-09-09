# homebrew-blueprint

Homebrew tap for the Blueprint CLI.

## Install

```bash
brew tap krerapus/blueprint https://github.com/krerapus/homebrew-blueprint
brew install blueprint
```

Upgrade:

```bash
brew update
brew upgrade blueprint
```

After install, fetch asset packs:

```bash
blueprint assets install core
```

## Layout

```text
homebrew-blueprint/
└── Formula/
    └── blueprint.rb
```

Formula `url` / `sha256` values are updated by the CLI release workflow when tagging `agent-harness-blueprint` releases. Placeholder checksums must be replaced before the first public bottle.
