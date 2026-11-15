cask "jimcast" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "REPLACE",
         intel: "REPLACE"

  url "https://github.com/irmansyah/jimcast-releases/releases/download/v#{version}/Jimcast_#{version}_#{arch}.dmg"
  name "Jimcast"
  desc "Keyboard-driven command bar for terminal-native developers"
  homepage "https://github.com/irmansyah/jimcast-releases"

  depends_on macos: ">= :monterey"

  app "Jimcast.app"
  # Sidecar is `jimcast`; the main binary is `jimcast-core` (see tauri.release.conf.json).
  binary "#{appdir}/Jimcast.app/Contents/MacOS/jimcast"

  uninstall quit: "com.jimcast.core"

  zap trash: [
    "~/Library/Application Support/com.jimcast.core",
    "~/Library/Caches/com.jimcast.core",
    "~/Library/Preferences/com.jimcast.core.plist",
    "~/Library/WebKit/com.jimcast.core",
  ]
end
