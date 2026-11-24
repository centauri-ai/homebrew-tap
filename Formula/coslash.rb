class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.5.1/coslash_v0.5.1_darwin_arm64.tar.gz"
    sha256 "61a8ef69eba3a36f8efbacf9f310d13c61366016431e2025739ba965f045571c"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.5.1/coslash_v0.5.1_darwin_amd64.tar.gz"
    sha256 "5d006661d49f14a1e61dee009146ea2debb4420829a0048b0b132f787da2f6d1"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
