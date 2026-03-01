class ContribMirror < Formula
  desc "Renamed to 'greens' — install that instead"
  homepage "https://github.com/yuvrajangadsingh/greens"
  url "https://github.com/yuvrajangadsingh/greens/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "ef144f90dfb12a597b47d21322db86794559be20328ec3a80f2fe0ea15b53f35"
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
