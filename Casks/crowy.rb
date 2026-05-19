cask "crowy" do
  version "0.1.0-alpha.3"
  sha256  "51f125495345efaef001c4151efab5a1814f162962a0268245c3d87b35d6cd53"

  url "https://github.com/alexandretrichot/crowy/releases/download/v0.1.0-alpha.3/Crowy-0.1.0-alpha.3.zip"
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
