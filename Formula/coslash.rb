class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.3/coslash_v0.4.3_darwin_arm64.tar.gz"
    sha256 "dd9df62496af74e5f7e4f706b5466c4312e1fae64aef46d1f7aa681968c3726c"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.3/coslash_v0.4.3_darwin_amd64.tar.gz"
    sha256 "5c789ffbe5396a963f2aea2365419b0b2d5236f394bae9757372232cfa7616f4"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
