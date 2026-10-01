class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.1.1/coslash_v0.1.1_darwin_arm64.tar.gz"
    sha256 "f12f783c01778ff46420ce6e7971fa0cf70ac870055a7b859ead620df5dfe22b"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.1.1/coslash_v0.1.1_darwin_amd64.tar.gz"
    sha256 "f3706f9ad12fc9eaf84f1727980da716568c5a7e53474c2bfa0dede25b7646f8"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
