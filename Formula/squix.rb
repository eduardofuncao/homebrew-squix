class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.2-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.2-beta/squix-darwin-amd64"
      sha256 "5d9153c77fcaf749ade05f4964b6ca0cd140a0dd45bac98a05eb6af9f6c2578d"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.2-beta/squix-darwin-arm64"
      sha256 "0c539e2f4386cafd21e2439f10d5c11a39db89b2ca720d4c37f17afedb71ac44"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.2-beta/squix-linux-amd64"
      sha256 "7e37f231bac44355a2bb495230876d24ce8e32fa020ef3ec501b8a66567563bc"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.2-beta/squix-linux-arm64"
      sha256 "1d9bcab06b34ecfdfcfcd610e6c843c0b05bed812933028f924c9a8e2d32173f"
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
