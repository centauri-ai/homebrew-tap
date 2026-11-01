class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.2/coslash_v0.4.2_darwin_arm64.tar.gz"
    sha256 "fad91f44d7f5bdc3ff1ffffbf6ca90930347927077f34f667e1efe34d625ad91"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.4.2/coslash_v0.4.2_darwin_amd64.tar.gz"
    sha256 "ecdc44b209fbb087e091ba9010bd5604e4e5095225b2fa9324eaf360088e2982"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
