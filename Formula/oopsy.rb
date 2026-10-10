class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.1/oopsy_0.4.1_darwin_arm64.tar.gz"
      sha256 "83edc76a360f22d9a958d3463668ca08dd3b7ca4757234a3362de797b4485c00"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.1/oopsy_0.4.1_darwin_amd64.tar.gz"
      sha256 "33518df5374bb6cb2d97cbfda0fabf93576ab717f0b682a5241229553affc23c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.1/oopsy_0.4.1_linux_arm64.tar.gz"
      sha256 "faa2983e88154a7067a2b3ebae390fc3b5028bbba827d81d0aaecc7fcafdb727"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.1/oopsy_0.4.1_linux_amd64.tar.gz"
      sha256 "0dc724bfdf215df12c486b47463f250fe3aa91d6988a1541c91d8979c41730f3"
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
