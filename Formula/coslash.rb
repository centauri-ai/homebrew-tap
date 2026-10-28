class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.0/coslash_v0.4.0_darwin_arm64.tar.gz"
    sha256 "4ff23094038032873d8181c9742b67b420930de73caa60facda287b9f62e1d02"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.0/coslash_v0.4.0_darwin_amd64.tar.gz"
    sha256 "ce3200fec8945813601f1030df58796e18ec461b84155b0d5a5a3bffcc2ef0f2"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
