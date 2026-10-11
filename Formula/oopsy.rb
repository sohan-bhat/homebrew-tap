class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.1/oopsy_0.8.1_darwin_arm64.tar.gz"
      sha256 "b4a2bfdada5ce5c04f95fa16c0f591e45da1bdebd30223bb054c27849f1806a8"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.1/oopsy_0.8.1_darwin_amd64.tar.gz"
      sha256 "6218e001a8280823a8562397cebb0323201022ebd5cd071900299cf7d0fc0e8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.1/oopsy_0.8.1_linux_arm64.tar.gz"
      sha256 "6d14fbeba33a0bd372903c70aecb65c848ff45aa03ad985d06e31754c884d537"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.1/oopsy_0.8.1_linux_amd64.tar.gz"
      sha256 "c36ccfcf2357cdd084ef43577f54202f45297d68e132e93c1f9ae40fa3383ac1"
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
