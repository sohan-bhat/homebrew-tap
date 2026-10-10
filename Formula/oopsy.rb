class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.3.0/oopsy_0.3.0_darwin_arm64.tar.gz"
      sha256 "64aa6974ddc9658e8a88b323523d5d22a141472f439d397861a35cfc3cd6dafb"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.3.0/oopsy_0.3.0_darwin_amd64.tar.gz"
      sha256 "022faa79fa81137de5d74934f7bd6a598934e67043539df423e6c75a5acc8a6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.3.0/oopsy_0.3.0_linux_arm64.tar.gz"
      sha256 "4377bbfe604b201b039067e59ddaad0123c7169786def7cea8343e62714d050e"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.3.0/oopsy_0.3.0_linux_amd64.tar.gz"
      sha256 "615d664db7777b0758ca10872131f850299ee931ae89197e8415c0a84c5024ae"
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
