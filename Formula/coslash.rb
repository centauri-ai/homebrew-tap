class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.1/coslash_v0.0.1_darwin_arm64.tar.gz"
    sha256 "fc78465a1a370ce543ee54dce125b69c91c30d035d8c3e4fb1fe448cebf6f428"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.1/coslash_v0.0.1_darwin_amd64.tar.gz"
    sha256 "de4bc71369d44049ed8ca8bdc78a020635f627f0f43d5edee45800b596867410"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
