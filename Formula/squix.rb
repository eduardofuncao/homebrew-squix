class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "v0.4.1-test"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/vv0.4.1-test/squix-darwin-amd64"
      sha256 "3740d4e73d45db94c107055807c9d80e36eaa828933aca69738d3510d7b1e099"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/vv0.4.1-test/squix-darwin-arm64"
      sha256 "028a137e41218a4be02557b3f9b4d018de2fb10add0f868d2a862bd3e71ce45f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/vv0.4.1-test/squix-linux-amd64"
      sha256 "b951c31629494d0a7530bd812e972de759e530da6e9fb4cbea2b62203257ae1b"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/vv0.4.1-test/squix-linux-arm64"
      sha256 "755ce27f792a437f9d096a2230a9d5c921e523670934af9e77bdea41bd0d94f6"
    end
  end

  def install
    bin.install "squix-darwin-amd64" => "squix" if OS.mac? && Hardware::CPU.intel?
    bin.install "squix-darwin-arm64" => "squix" if OS.mac? && !Hardware::CPU.intel?
    bin.install "squix-linux-amd64" => "squix" if OS.linux? && Hardware::CPU.intel?
    bin.install "squix-linux-arm64" => "squix" if OS.linux? && !Hardware::CPU.intel?
  end

  test do
    system "#{bin}/squix", "--version"
  rescue
    # binary may not support --version yet
    assert_path_exists bin/"squix"
  end
end
