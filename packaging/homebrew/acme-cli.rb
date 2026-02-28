class AcmeCli < Formula
  desc "AI-agent-first internal CLI"
  homepage "https://github.com/franzsaggl-spec/acme-cli"
  url "https://github.com/franzsaggl-spec/acme-cli/releases/download/v0.1.0/acme-cli-macos-universal.tar.gz"
  sha256 "REPLACE_WITH_REAL_SHA256"
  license "MIT"

  def install
    bin.install "acme"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/acme version")
  end
end
