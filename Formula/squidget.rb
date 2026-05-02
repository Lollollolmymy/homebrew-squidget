class Squidget < Formula
  desc "Blazing-fast TUI music downloader written in pure C"
  homepage "https://github.com/Lollollolmymy/SquidGet"
  url "https://github.com/Lollollolmymy/SquidGet/releases/download/v1.0.0/squidget-MacOs"
  sha256 "2988c24b5767e070b2d2349e57225146be7fcc84a352d412b112ce8f835a0fdb"
  version "1.0.0"
  license "MIT"

  depends_on "curl"

  def install
    bin.install "squidget-MacOs" => "squidget"
  end

  test do
    system "#{bin}/squidget", "--help"
  end
end
