class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.7.0/oopsy_0.7.0_darwin_arm64.tar.gz"
      sha256 "306e28fea250f895e90596de9b494eb72132c2bc72d454c463aab480e17bf220"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.7.0/oopsy_0.7.0_darwin_amd64.tar.gz"
      sha256 "96097beb2c58f6b7b773e8936ba811e9678648f00aace25be2e3a66188ecd43b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.7.0/oopsy_0.7.0_linux_arm64.tar.gz"
      sha256 "5d0bf4b618116752d5148287cf1d3c27a40b84097b51a01049447e1b6e96b839"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.7.0/oopsy_0.7.0_linux_amd64.tar.gz"
      sha256 "95002c93c99a6e7676006beddb7c5d2ba6bd46a0a8f4b0839111a2a5e0995613"
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
