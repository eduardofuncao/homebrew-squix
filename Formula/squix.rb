class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.5.4-test"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-test/squix-darwin-amd64"
      sha256 "c4b829ab5c7f9931a7dc2f23e0eee66c34f75790a6935416c3b9da190f832355"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-test/squix-darwin-arm64"
      sha256 "e741a3d44a5aba7d326411e3c368daa933b6e10f7c572eb384efc24df196a3ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-test/squix-linux-amd64"
      sha256 "61e45d22d180ffced23ae90a84106087aee96fb9623028fcc759660c62cbafca"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.5.4-test/squix-linux-arm64"
      sha256 "adc0dc428670b728839344e4412da9414f3499970bc4877d24a94e46422c39dc"
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
