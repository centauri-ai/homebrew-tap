class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.1/coslash_v0.3.1_darwin_arm64.tar.gz"
    sha256 "3505e9588caf6d4ce614682d20fc1387b1c92fcada5ace46a60d902e897ef02f"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.1/coslash_v0.3.1_darwin_amd64.tar.gz"
    sha256 "45a528eba53bccdcd5b8b5fd883eca717bf7e6bee776608e78805724f005b936"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
