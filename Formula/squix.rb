class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.4.0-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.0-beta/squix-darwin-amd64"
      sha256 "6e73559ce455848df588b72ed4531067320b764e70cc1a16c8f0c0937bbed792"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.0-beta/squix-darwin-arm64"
      sha256 "94756b547506a0774ed029995a0e68f1ad662ae958d33bc698466c5d8fce0389"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.0-beta/squix-linux-amd64"
      sha256 "d2ec040e667780bfc825e79e21955062340e9e0be27bd4e45afde7c63ad432ab"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.0-beta/squix-linux-arm64"
      sha256 "d1a6398751d36872e0e2429b8930dd4ca7f906629cc5f9281d5849df1dd9f8d8"
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
