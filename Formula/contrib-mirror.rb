class ContribMirror < Formula
  desc "Renamed to 'greens' — install that instead"
  homepage "https://github.com/yuvrajangadsingh/private-work-contributions-mirror"
  url "https://github.com/yuvrajangadsingh/private-work-contributions-mirror/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "1a3da77f426fbbd1a148ad23b402c0d668064c937537d3f605918fa27f7320df"
  license "MIT"

  depends_on "git"

  def install
    bin.install "sync.sh" => "greens"
    libexec.install "setup.sh"
    inreplace bin/"greens", "$SCRIPT_DIR/setup.sh", "#{libexec}/setup.sh"
  end

  def caveats
    <<~EOS
      contrib-mirror has been renamed to 'greens'!

      Switch over:
        brew uninstall contrib-mirror
        brew install greens

      Or just run: greens
    EOS
  end

  test do
    assert_match "greens", shell_output("#{bin}/greens --version")
  end
end
