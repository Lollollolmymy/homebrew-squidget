class Squidget < Formula
  desc "Blazing-fast TUI music downloader written in pure C"
  homepage "https://github.com/Lollollolmymy/SquidGet"
  url "https://github.com/Lollollolmymy/SquidGet/releases/download/v1.0.0/squidget-MacOs"
  sha256 "2988c24b5767e070b2d2349e57225146be7fcc84a352d412b112ce8f835a0fdb"
  version "1.0.0"

  def install
    bin.install "squidget-MacOs" => "squidget"

    app_dir = prefix/"SquidGet.app"
    (app_dir/"Contents/MacOS").mkpath

    (app_dir/"Contents/Info.plist").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleName</key><string>SquidGet</string>
        <key>CFBundleDisplayName</key><string>SquidGet</string>
        <key>CFBundleExecutable</key><string>squidget-launcher</string>
        <key>CFBundleIdentifier</key><string>com.lollollolmymy.squidget</string>
        <key>CFBundleVersion</key><string>1.0.0</string>
        <key>CFBundleShortVersionString</key><string>1.0.0</string>
        <key>CFBundlePackageType</key><string>APPL</string>
      </dict>
      </plist>
    XML

    (app_dir/"Contents/MacOS/squidget-launcher").write <<~SH
      #!/bin/bash
      osascript -e 'tell application "Terminal"
        activate
        do script "squidget"
      end tell'
    SH
    chmod 0755, app_dir/"Contents/MacOS/squidget-launcher"
  end

  def post_install
    system "cp", "-r", "#{prefix}/SquidGet.app", "/Applications/"
  end

  test do
    system "#{bin}/squidget", "--help"
  end
end
