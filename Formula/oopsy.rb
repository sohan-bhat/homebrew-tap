class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.5.0/oopsy_0.5.0_darwin_arm64.tar.gz"
      sha256 "ef7cac7a7f9bde9d2974b2c17dde29446f9fa4abe683f20d93cf9d49527a69d8"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.5.0/oopsy_0.5.0_darwin_amd64.tar.gz"
      sha256 "1d4454672f8a01480811f5cf76ef144c38a05a77e8bf8f8609e80f980622bb4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.5.0/oopsy_0.5.0_linux_arm64.tar.gz"
      sha256 "85b4eddecf7cd47a7aaf2a82a68188b61f4cb3da7e09ce7e085a0e958a25e390"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.5.0/oopsy_0.5.0_linux_amd64.tar.gz"
      sha256 "ebe094d457fd165f9ae35da7c30a227b83f4019bd84b1f2ccfbaf1d2d840ba07"
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
