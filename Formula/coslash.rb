class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.2.0/coslash_v0.2.0_darwin_arm64.tar.gz"
    sha256 "20cab0f636a8bded5edbd68659b3fd13b017b631a0984fb62f0c19daaa1f24c5"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.2.0/coslash_v0.2.0_darwin_amd64.tar.gz"
    sha256 "3ab156b41359dde70d594b322250515ec4bd94770c76999953608c6113189fc7"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
