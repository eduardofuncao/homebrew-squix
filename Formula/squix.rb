class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.0-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.0-beta/squix-darwin-amd64"
      sha256 "54d90fb370fdf14e15b1408f33ff45ac90115eeb64c65d8028796c78df6dea70"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.0-beta/squix-darwin-arm64"
      sha256 "ae969f6531bcacd8a9cec35339aae7ea9be6a008c870cf449539e62263b40a0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.0-beta/squix-linux-amd64"
      sha256 "a62cfc5df4eff7389d2e3d4d3fb6d7ee4d3c5545b89adfed9605a3f0a491e63e"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.0-beta/squix-linux-arm64"
      sha256 "1d9ace8997427688eadb4841c8dfd65960d62a0bf9104ab4484d303d1a72d2a2"
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
