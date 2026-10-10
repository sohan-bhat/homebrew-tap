class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.0/oopsy_0.8.0_darwin_arm64.tar.gz"
      sha256 "a656b9b31644a3817e4be55930df0f265cca69f39e76014e1b57cab5f5e1abab"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.0/oopsy_0.8.0_darwin_amd64.tar.gz"
      sha256 "6bd88193267ac9fcf87ab2db50e5be4c8a5c95f790ca50ccd68da1e66dfecfe4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.0/oopsy_0.8.0_linux_arm64.tar.gz"
      sha256 "227a25037ed70958a71bb2661760fbcd1cc262c6749581c4edb1e0bf7aa8d0e4"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.0/oopsy_0.8.0_linux_amd64.tar.gz"
      sha256 "d8fc4366f944e8fad135869e61962b6e63c938f3dd3db1a5ced941fbd3bb1505"
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
