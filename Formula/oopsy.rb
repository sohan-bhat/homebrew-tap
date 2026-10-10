class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.1.0/oopsy_0.1.0_darwin_arm64.tar.gz"
      sha256 "0664e3e35281c88b7680da386bbb2b4b38e5b5a334550ab6e10604bad744035a"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.1.0/oopsy_0.1.0_darwin_amd64.tar.gz"
      sha256 "8e756a3450199c20cf0be40422173d1fdccadb1928dfecec859c22080a1ea7ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.1.0/oopsy_0.1.0_linux_arm64.tar.gz"
      sha256 "a5c0b7b1a3a58ea75baba5342e3a0fc5229f598e897b118df2d7a44bbdc474eb"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.1.0/oopsy_0.1.0_linux_amd64.tar.gz"
      sha256 "801dfdcdefd18e39c8739635f068d179019f0c9a6884344e2892850dd259c57a"
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
