# Homebrew cask for Solido — rendered + pushed to specdevtech/homebrew-tap by
# `pls deliver solido app`. version + sha256 are filled in per release.
#   brew install --cask specdevtech/tap/solido   (then: brew install --cask solido)
cask "solido" do
  version "1.0.232"
  sha256 "1095086a92836d9384915c2b8612f969f22e64f38e70ba58caacbc6ee528723d"

  url "https://cdn.solido.dev/cdn/solido/app/Solido-#{version}.dmg"
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
