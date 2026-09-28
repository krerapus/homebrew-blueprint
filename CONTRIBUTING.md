# Contributing

This repository is the Homebrew tap for Blueprint — **`Formula/blueprint.rb` only**.

CLI builds and release assets: [`agent-harness-blueprint`](https://github.com/krerapus/agent-harness-blueprint).  
Canonical Formula / bump docs: [docs/homebrew.md](https://github.com/krerapus/agent-harness-blueprint/blob/master/docs/homebrew.md).

## What you may change

- `Formula/blueprint.rb` (version, urls, sha256, caveats, test)
- Tap CI under `.github/workflows/`
- This README / CONTRIBUTING / CHANGELOG

## What not to change manually (usually)

- Do not vendor CLI source, `lib/`, or asset packs
- Prefer accepting the automated Formula-bump PR from **CLI Release** when it is correct
- Never invent SHA256 values or leave `0000…0000` placeholders in a published Formula

## Setup

```bash
git clone https://github.com/krerapus/homebrew-blueprint.git
cd homebrew-blueprint
ruby -c Formula/blueprint.rb
```

## Commit convention

Prefer conventional commits: `type(scope): description` (`feat|fix|docs|chore`).

Examples: `chore(formula): bump to 1.5.0`, `fix(formula): correct darwin_amd64 sha256`.

## Pull requests

1. `ruby -c Formula/blueprint.rb`
2. Confirm each platform `url` → `…/releases/download/vX.Y.Z/blueprint_X.Y.Z_<os>_<arch>.tar.gz`
3. Real sha256 only (match CLI `checksums.txt`)
4. CI (`.github/workflows/formula-audit.yml`) must pass

Manual bump from a CLI checkout:

```bash
./scripts/bump-homebrew-formula.sh X.Y.Z dist ../homebrew-blueprint/Formula/blueprint.rb
```
