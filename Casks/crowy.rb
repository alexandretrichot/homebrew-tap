cask "crowy" do
  version "0.1.0-alpha.4"
  sha256  "8d86efdccb358a6528558729bc014bf414446bbffe122ddf487bb35a7a8a7efe"

  url "https://github.com/alexandretrichot/crowy/releases/download/v0.1.0-alpha.4/Crowy-0.1.0-alpha.4.zip"
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
