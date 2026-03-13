class Greens < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/greens"
  url "https://github.com/yuvrajangadsingh/greens/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "74c9d34dc1eefece892f261da183358967a17ac8b4d28c73a50e8380a21f5ff7"
  license "MIT"

  depends_on "git"

  def install
    bin.install "sync.sh" => "greens"
    libexec.install "setup.sh"
    # Patch setup path in sync.sh to point to libexec
    inreplace bin/"greens", "$SCRIPT_DIR/setup.sh", "#{libexec}/setup.sh"
  end

  def caveats
    <<~EOS
      Get started:
        greens

      Setup runs automatically on first use.
      To reconfigure later: greens --setup
    EOS
  end

  test do
    assert_match "greens", shell_output("#{bin}/greens --version")
  end
end
