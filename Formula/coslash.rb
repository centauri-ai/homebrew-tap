class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.1/coslash_v0.4.1_darwin_arm64.tar.gz"
    sha256 "fe8008108305a6cf34b769b7f65024fb55970cc0b04bcbbd567a2abcf152f7df"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.1/coslash_v0.4.1_darwin_amd64.tar.gz"
    sha256 "e8bf921cb9e3ed39ce3fd047bd86db53fa7cded88f06ee87b63fd4eeb4668195"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
