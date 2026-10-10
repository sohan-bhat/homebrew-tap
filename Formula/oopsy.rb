class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.0/oopsy_0.2.0_darwin_arm64.tar.gz"
      sha256 "7bd4d6e23054da07f0604796070ea8f81583fcd560c84efc16447a836c0d38a7"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.0/oopsy_0.2.0_darwin_amd64.tar.gz"
      sha256 "3e44066c6016ad9544050b071e424da2392b0d4426019f1bde6780d95043793d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.0/oopsy_0.2.0_linux_arm64.tar.gz"
      sha256 "bedf9b4c76c782a340c254cfd1c6e091d21de989ba0058189ed133759e4b10a2"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.0/oopsy_0.2.0_linux_amd64.tar.gz"
      sha256 "498be7ebef2cee4c1f453387379f53316a434db54ef03655e8f31cba732ae908"
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
    assert_match "Not destructive", shell_output("#{bin}/oops explain ls -la")
  end
end
