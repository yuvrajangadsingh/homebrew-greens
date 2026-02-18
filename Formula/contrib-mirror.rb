class ContribMirror < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/private-work-contributions-mirror"
  url "https://github.com/yuvrajangadsingh/private-work-contributions-mirror/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "733edf0054326feaa7ea42613729d2078d2cb4e0de5c29197f30b36df1e946b3"
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
