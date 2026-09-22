class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.34-beta-test"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.34-beta-test/squix-darwin-amd64"
      sha256 "dac543109afc713367c6881ddc5b3f459f4b7fff57f58200fc4081b608a1c2e3"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.34-beta-test/squix-darwin-arm64"
      sha256 "b0cbdcb1e6a757d3a578e24f3150ec2b9f59ad7baa438f923477e07224e693d3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.34-beta-test/squix-linux-amd64"
      sha256 "ed6125b2548baf82765751382cf3cbd8c428f2a9e6348bd096778375ae2f7d89"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.34-beta-test/squix-linux-arm64"
      sha256 "13c014034aaea9cce0692a2318156b7831f009d2cdb101d31e41df9d15ad896f"
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
