cask "crowy" do
  version "0.1.0-alpha.2"
  sha256  "a1607e5353539d83dc0196a1f354a77f8a4a299244de9d04d19d086132e5898b"

  url "https://github.com/alexandretrichot/crowy/releases/download/v0.1.0-alpha.2/Crowy-0.1.0-alpha.2.zip"
  name "Crowy"
  desc "Clipboard manager for macOS"
  homepage "https://github.com/alexandretrichot/crowy"

  depends_on macos: ">= :tahoe"

  app "Crowy.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Crowy.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/fr.alexandretrichot.Crowy.plist",
    "~/Library/Application Support/fr.alexandretrichot.Crowy",
    "~/Library/Caches/fr.alexandretrichot.Crowy",
  ]
end
