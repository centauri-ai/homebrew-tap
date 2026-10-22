class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.3/coslash_v0.3.3_darwin_arm64.tar.gz"
    sha256 "5ff7233acc210af8ef76604c985445d25a5540ce40f9ebd2877770c819c3a432"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.3/coslash_v0.3.3_darwin_amd64.tar.gz"
    sha256 "c44dbb85c6cd52c1f71982858c4a9c96add3da17965bc274c812ae0b61eb8b63"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
