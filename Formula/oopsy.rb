class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.6.0/oopsy_0.6.0_darwin_arm64.tar.gz"
      sha256 "f86bbde33a68ec9f1f9eeac093d87759ff4c7abe14b475bb1a248e5afe284156"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.6.0/oopsy_0.6.0_darwin_amd64.tar.gz"
      sha256 "176387eee79b0efd6e9200838becb177ecc11608d877c813e0fed373bdf37e56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.6.0/oopsy_0.6.0_linux_arm64.tar.gz"
      sha256 "ceb5aaa363f11c8dab8c61c629ac6eee8d017776fa001b850373c2064d304e49"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.6.0/oopsy_0.6.0_linux_amd64.tar.gz"
      sha256 "589ee7a854e405a60f01a55dc2887f40665c6ad4f52f8d2aafa8a20b5004c090"
    end
  end

  def install
    bin.install "oops", "oops-db"
  end

  def caveats
    <<~EOS
      Run this once to turn on the shell and AI agent hooks:
        oops init
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oops --version")
    assert_match "Read only", shell_output("#{bin}/oops explain ls -la")
  end
end
