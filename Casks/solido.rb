# Homebrew cask for Solido — rendered + pushed to specdevtech/homebrew-tap by
# `pls deliver solido app`. 1.0.187 / 0ed26492054b780e5e93d67c5e68569db37c289b2607b91fa97d1848a8c93959 are substituted per release.
#   brew install --cask specdevtech/tap/solido   (then: brew install --cask solido)
cask "solido" do
  version "1.0.187"
  sha256 "0ed26492054b780e5e93d67c5e68569db37c289b2607b91fa97d1848a8c93959"

  url "https://app.solido.dev/cdn/solido/app/Solido-#{version}.dmg"
  name "Solido"
  desc "Desktop control plane for the SpecDev platform"
  homepage "https://app.solido.dev"

  app "Solido.app"

  # The build is ad-hoc signed, not notarized. Strip the quarantine flag after
  # install so it launches without a Gatekeeper prompt (parity with the curl
  # installer). Without this, brew's default quarantine would still gate it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Solido.app"]
  end

  zap trash: [
    "~/Library/Application Support/Solido",
    "~/Library/Caches/Solido",
    "~/Library/Saved Application State/com.solido.app.savedState",
  ]
end
