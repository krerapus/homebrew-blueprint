# Contributing

Thanks for helping improve **homebrew-blueprint**. This repository is the Homebrew tap for Blueprint (`Formula/blueprint.rb` only). CLI builds and release assets live in [`agent-harness-blueprint`](https://github.com/krerapus/agent-harness-blueprint).

## Development setup

Requirements: Git, Ruby (for `ruby -c`), and optionally Homebrew to verify installs.

```bash
git clone https://github.com/krerapus/homebrew-blueprint.git
cd homebrew-blueprint
ruby -c Formula/blueprint.rb
```

For formula bumps, also clone [`agent-harness-blueprint`](https://github.com/krerapus/agent-harness-blueprint) as a sibling so you can run `scripts/bump-homebrew-formula.sh`.

## How this repo works

This tap stores distribution metadata. After a CLI GitHub Release, URLs and checksums in `Formula/blueprint.rb` are updated (automatically via PR, or manually). Users install with `brew tap` / `brew install blueprint`.

See the Mermaid diagrams in [README.md](README.md#how-it-works).

## Branch naming

| Type | Pattern | Example |
|------|---------|---------|
| Feature | `feature/<short-slug>` | `feature/caveats-assets` |
| Bug fix | `fix/<short-slug>` or `hotfix/<short-slug>` | `fix/linux-amd64-url` |
| Docs | `docs/<short-slug>` | `docs/contributing` |
| Chore | `chore/<short-slug>` | `chore/formula-1.4.1` |

Use lowercase kebab-case slugs. Version-bump PRs may use `chore/formula-X.Y.Z`.

## Commit convention

Prefer conventional commits: `type(scope): description` with types `feat|fix|refactor|test|docs|chore`.

Examples:

- `chore(formula): bump to 1.4.1`
- `fix(formula): correct darwin_amd64 sha256`
- `docs: clarify tap vs CLI source of truth`

Keep commits focused. Do not commit CLI source trees, release tarballs, or secrets.

## Pull request process

1. Prefer accepting the automated formula-bump PR from the CLI release workflow when it is correct.
2. For manual changes: run `ruby -c Formula/blueprint.rb` and ensure no placeholder `sha256` (64 zeros).
3. Confirm each platform `url` points at `…/releases/download/vX.Y.Z/blueprint_X.Y.Z_<os>_<arch>.tar.gz`.
4. Open a PR describing the CLI version and how checksums were obtained.
5. CI ([`.github/workflows/formula-audit.yml`](.github/workflows/formula-audit.yml)) must pass.

## How to update source

1. Publish (or confirm) CLI release `vX.Y.Z` with archives + `checksums.txt` on `agent-harness-blueprint`.
2. Auto: wait for the `bump-formula` job PR, review URLs/sha256, merge.
3. Manual:

   ```bash
   # From agent-harness-blueprint
   ./scripts/bump-homebrew-formula.sh X.Y.Z dist ../homebrew-blueprint/Formula/blueprint.rb
   ruby -c ../homebrew-blueprint/Formula/blueprint.rb
   grep sha256 ../homebrew-blueprint/Formula/blueprint.rb
   ```

4. After merge, verify:

   ```bash
   brew update
   brew uninstall blueprint || true
   brew trust --formula krerapus/blueprint/blueprint   # once, if not already trusted
   brew install krerapus/blueprint/blueprint
   blueprint --version
   blueprint assets install core
   blueprint assets list
   blueprint assets doctor --offline
   ```

## Testing / review expectations

- Real SHA256 only — never invent or leave placeholders
- Full libexec layout preserved in the Formula (`blueprint`, `VERSION`, `lib`, `builtin`, …)
- Tap remains Formula-only — no vendored CLI or asset packs
- Docs updated when install caveats or tap commands change

Questions welcome via GitHub Issues on this repo or the CLI repo.
