class ContribMirror < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/private-work-contributions-mirror"
  url "https://github.com/yuvrajangadsingh/private-work-contributions-mirror/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "eacb17c6189eb11dce8ca609ddbae888ff658258d987f7ac5317060323be89f6"
  license "MIT"

  depends_on "git"

  def install
    bin.install "sync.sh" => "contrib-mirror"
    libexec.install "setup.sh"
    # Patch setup path in sync.sh to point to libexec
    inreplace bin/"contrib-mirror", "$SCRIPT_DIR/setup.sh", "#{libexec}/setup.sh"
  end

  def caveats
    <<~EOS
      Run the setup wizard to configure:
        contrib-mirror --setup
    EOS
  end

  test do
    assert_match "contrib-mirror", shell_output("#{bin}/contrib-mirror --version")
  end
end
