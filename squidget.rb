class Squidget < Formula
  desc "Blazing-fast TUI music downloader written in pure C"
  homepage "https://github.com/Lollollolmymy/SquidGet"
  url "https://github.com/Lollollolmymy/SquidGet/releases/download/v1.0.0/squidget-MacOs"
  sha256 "224ef7552f4d37d00f840a0862a1e7f5af6eaf68be8044804e57f869efc6f747"
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
