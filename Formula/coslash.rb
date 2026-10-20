class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.2/coslash_v0.3.2_darwin_arm64.tar.gz"
    sha256 "e9eff1c9843a831112fc955ab83d60cd40572f0b0e95fe447795226b2becd112"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.2/coslash_v0.3.2_darwin_amd64.tar.gz"
    sha256 "331d979bbb69497c00986073bd97fb673a8ad35b50e3f660246829c2ae473d91"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
