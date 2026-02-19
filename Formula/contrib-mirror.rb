class ContribMirror < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/private-work-contributions-mirror"
  url "https://github.com/yuvrajangadsingh/private-work-contributions-mirror/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "5b80a6c964a8fe6b80a03017bba8a3d45e75806834170d80e1ad13c3bdaf11a7"
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
