# SpecDev Homebrew tap

Casks for SpecDev tools.

## Solido

```sh
brew install --cask specdevtech/tap/solido
```

Or tap once, then install by name:

```sh
brew tap specdevtech/tap
brew install --cask solido
```

Installs **Solido.app** to /Applications. The build is ad-hoc signed (not
notarized); the cask strips the quarantine flag so it launches without a
Gatekeeper prompt.
