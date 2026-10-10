class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.0/oopsy_0.4.0_darwin_arm64.tar.gz"
      sha256 "c71db1fcaf0e5c71b6c471f9f991bb3c5f58d1bb80488cb4bc695ae4154c69eb"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.0/oopsy_0.4.0_darwin_amd64.tar.gz"
      sha256 "be037ffcee7bd4ef7286251f14b7f30212eea4fcb2c2f500b398de6d1c18a8cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.0/oopsy_0.4.0_linux_arm64.tar.gz"
      sha256 "3d641cd68f0b26a5314b89d1ec8a115550aa487dd7601e31471dd6e8624a3110"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.4.0/oopsy_0.4.0_linux_amd64.tar.gz"
      sha256 "670efaedd1cbf3147f2787e19d98f63ef0740ff46215351c7f0b196155bed141"
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
