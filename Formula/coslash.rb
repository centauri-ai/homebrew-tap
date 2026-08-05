class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.0/coslash_v0.0.0_darwin_arm64.tar.gz"
    sha256 "1a8de2b01bc321ac10f19c3a362c37ab145f0da31b0c8d5348b29123b0e6908b"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.0/coslash_v0.0.0_darwin_amd64.tar.gz"
    sha256 "cae11ff4ff3a78e07f49219de7cbbb8e335ed81be95655ebc4c40afea272123f"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
