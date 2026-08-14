class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.2/coslash_v0.0.2_darwin_arm64.tar.gz"
    sha256 "5dba31adc5c7740d25a4f7d451ec8a93f89a8f1cac8b29efc0b910cee0282a7c"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.0.2/coslash_v0.0.2_darwin_amd64.tar.gz"
    sha256 "bbcfc34856827a6354df1e958ad234ed878046577601fcd768eddfa23382a2cf"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
