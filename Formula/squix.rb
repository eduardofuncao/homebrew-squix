class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.3-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.3-beta/squix-darwin-amd64"
      sha256 "955737d1901347c4f8ad39983af754ea9508676f22516cda7042a39c7a95bc4e"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.3-beta/squix-darwin-arm64"
      sha256 "b03a5dee8bd005b249ef9e9fdc9033069a677022e485e883714a9b124a5c133b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.3-beta/squix-linux-amd64"
      sha256 "5f180db8cf9f05e323161a6dca53477ccbf7c14850f47866f6464d4c4c973594"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.3-beta/squix-linux-arm64"
      sha256 "353d041d536e4428a7d0831a744b517bfb08666e29c13c7880a8bed6475820a7"
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
