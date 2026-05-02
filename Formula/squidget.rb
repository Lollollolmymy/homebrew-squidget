class Squidget < Formula
  desc "Blazing-fast TUI music downloader written in pure C"
  homepage "https://github.com/Lollollolmymy/SquidGet"
  url "https://github.com/Lollollolmymy/SquidGet/releases/download/v1.0.0/squidget-MacOs"
  sha256 "d6969e0fac33ae2c039eb6241c20b47a33c31b8fcbeec0d7964ca63c18cd21e4"
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
