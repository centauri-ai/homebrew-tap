class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.4/coslash_v0.4.4_darwin_arm64.tar.gz"
    sha256 "0735828acb4c930bdf90d2c4450e27838cb5380a074440ebe201da882c3aac27"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.4/coslash_v0.4.4_darwin_amd64.tar.gz"
    sha256 "7008c65d03921797cb1b90e6ea028c20b90a16ef2d34830b41f53b469371606a"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
