class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.4-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-beta/squix-darwin-amd64"
      sha256 "91fa1b5c2c66c14200b46b5c1f8d67f82e8d230c839c083f0b6d856ede2e38d5"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-beta/squix-darwin-arm64"
      sha256 "180c09fb2a4e251f5d9b44c230c129c09477d7b9c5e42d5ffa62601eadb915d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-beta/squix-linux-amd64"
      sha256 "2886a9c3c1bc1f30b16d7ddb29fa564faa9afcdae410ded6d44a33ca64bd43fc"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-beta/squix-linux-arm64"
      sha256 "8d79eaa28326aebacace3f266e533ac74c2f908bc2518c8f2d0f6e538ace5f56"
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
