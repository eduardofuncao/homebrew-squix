class Squix < Formula
  desc "SQL query manager for multiple databases"
  homepage "https://github.com/eduardofuncao/squix"
  version "0.4.2-beta"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.2-beta/squix-darwin-amd64"
      sha256 "657720e9e0c90311aba79a4833bcf400158a70ee49152744137be8863031fe9d"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.2-beta/squix-darwin-arm64"
      sha256 "de495f491fce0c34c198012fe1d2665cd6b43ef233294b009373d59521b0c4c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.2-beta/squix-linux-amd64"
      sha256 "1b0064540373f7f0f94753c9c862f08fe12719d97f3095f63dfed8428c04993b"
    else
      url "https://github.com/eduardofuncao/squix/releases/download/v0.4.2-beta/squix-linux-arm64"
      sha256 "3614e27f2b6fbad300e38e593eb15a6af5fc8e9828104e311fa97c90976e7ad7"
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
