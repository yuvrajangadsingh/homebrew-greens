class ContribMirror < Formula
  desc "Renamed to 'greens' — install that instead"
  homepage "https://github.com/yuvrajangadsingh/private-work-contributions-mirror"
  url "https://github.com/yuvrajangadsingh/private-work-contributions-mirror/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "57fd922e70558e77aea5c0efd09b884ac329486665c94871eb8ef0cf9e9fbe10"
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
