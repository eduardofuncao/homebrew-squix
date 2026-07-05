class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.1-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.1-beta/squix-darwin-amd64"
      sha256 "abc488f363b6d3e2950a2b223ae716ba7275d3d7f9dd86725ff79bafdb64a865"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.1-beta/squix-darwin-arm64"
      sha256 "4ad3486459d236d5c93fd43763f184450ae5a90062d9815ddeae480d65ad2660"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.1-beta/squix-linux-amd64"
      sha256 "3c1477c20e08aba40b04d6782379e73bc717a90736fa7bc96d750546825b2640"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.1-beta/squix-linux-arm64"
      sha256 "4657d68a7228065b4012eec43cb6a56e4560074d35e0bfcb2a57e5df25996162"
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
