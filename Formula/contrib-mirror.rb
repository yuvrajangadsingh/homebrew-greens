class ContribMirror < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/private-work-contributions-mirror"
  url "https://github.com/yuvrajangadsingh/private-work-contributions-mirror/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "efc364dd15d934167c8fa63844ff39338a91c81e3d1dbf49718a2e0adde53052"
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
      Get started:
        contrib-mirror

      Setup runs automatically on first use.
      To reconfigure later: contrib-mirror --setup
    EOS
  end

  test do
    assert_match "contrib-mirror", shell_output("#{bin}/contrib-mirror --version")
  end
end
