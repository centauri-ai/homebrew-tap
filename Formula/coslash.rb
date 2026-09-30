class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.1.0/coslash_v0.1.0_darwin_arm64.tar.gz"
    sha256 "886834a878492fbf3e32edf7e85a641b864b65624e98464464d0f0093cd10fea"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.1.0/coslash_v0.1.0_darwin_amd64.tar.gz"
    sha256 "fbbec20016809b157f1713c8377faa6c80c251a7ab9eb432b5bcc3801f300fbc"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
