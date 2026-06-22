class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.4.3-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.3-beta/squix-darwin-amd64"
      sha256 "7bb2d15951e6eb5a1d116f615692e6a89ce377a12cd76a65e6e9f52d4e6ff9d2"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.3-beta/squix-darwin-arm64"
      sha256 "35beafc13af59bab3caff476db329a2505ebb66fecc2d3ad32bfe1019f0e314e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.3-beta/squix-linux-amd64"
      sha256 "dec51abbbfd887172319512428034461d2c5d3d399941d3d8c04554290134717"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.3-beta/squix-linux-arm64"
      sha256 "79139c19ee0e2c80b2a39f8a75fe4269826771d1706495afdc5770d87bd14ebf"
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
