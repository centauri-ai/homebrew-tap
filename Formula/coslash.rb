class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.4/coslash_v0.0.4_darwin_arm64.tar.gz"
    sha256 "6e1d6a243e89b348e30c7bcbc115623f9dcd51b257878e1d0f3c20e05a278e9f"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.4/coslash_v0.0.4_darwin_amd64.tar.gz"
    sha256 "d5512252df433c472eb43b225cda844c95827f71928e681cb71302d3d17ce74f"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
