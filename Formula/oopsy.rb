class Oopsy < Formula
  desc "Undo destructive commands, for people and AI coding agents"
  homepage "https://sohan-bhat.github.io/oopsy/"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.2/oopsy_0.8.2_darwin_arm64.tar.gz"
      sha256 "32099334f1875cb0ada962f78815f9355dd0331b7d6eef3bf9b298c3d63de290"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.2/oopsy_0.8.2_darwin_amd64.tar.gz"
      sha256 "e86a5fc5b6396d2bba01bdd24a3f3d212c46218d4198d853a2cb831cc11eef50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.2/oopsy_0.8.2_linux_arm64.tar.gz"
      sha256 "4e2a1217663c3c6afa32f021ccb75e42486ab08884c553f29bc21c834422419e"
    end
    on_intel do
      url "https://github.com/sohan-bhat/oopsy/releases/download/v0.8.2/oopsy_0.8.2_linux_amd64.tar.gz"
      sha256 "d3b3ced9572d45e423d1380a707aec47c63054d0e0d040b6ae464576e6e8dfbf"
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
