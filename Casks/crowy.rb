cask "crowy" do
  version "0.1.0-alpha.1"
  sha256  "36fc3e2ef99e5e7187f66898ef1e4e20711c4431ea6db3542a4fb18b13cd29ee"

  url "https://github.com/alexandretrichot/crowy/releases/download/v0.1.0-alpha.1/Crowy-0.1.0-alpha.1.zip"
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
