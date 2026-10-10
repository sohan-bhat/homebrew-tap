class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.1/oopsy_0.2.1_darwin_arm64.tar.gz"
      sha256 "bf6dec41b90e0c22fab9ede96b4d41dbf72a71ea8ac2790c571090b24d072d4d"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.1/oopsy_0.2.1_darwin_amd64.tar.gz"
      sha256 "da030b19c84fb5800cf37a8425afa70253833a36a2d1181211b881b65a981681"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.1/oopsy_0.2.1_linux_arm64.tar.gz"
      sha256 "d39d8e3c537595ef35c0139cbce7eb1a569f0e811611ce2bf439161c2f36c5ec"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.2.1/oopsy_0.2.1_linux_amd64.tar.gz"
      sha256 "54f33c8829ad03975924f478fe82c858f7dc0cd789981e30dc60fc195d4479f4"
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
