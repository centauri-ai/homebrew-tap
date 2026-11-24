class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.5.0/coslash_v0.5.0_darwin_arm64.tar.gz"
    sha256 "9ae0139d2a9a2e1ee742075a66638d4a22c90c57b866b7341caeaa748ce12982"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.5.0/coslash_v0.5.0_darwin_amd64.tar.gz"
    sha256 "a4c036a5327a8780e240df6bc7230cff21870d7d9407e215acc73652b83928e1"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
