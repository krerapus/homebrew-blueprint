class Blueprint < Formula
  desc "Agent harness CLI with independently versioned assets"
  homepage "https://github.com/krerapus/agent-harness-blueprint"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "blueprint"
    if Dir.exist?("builtin")
      (prefix/"share/blueprint/builtin").install Dir["builtin/*"]
    end
  end

  def caveats
    <<~EOS
      Blueprint ships a minimal builtin bootstrap only.
      Install asset packs after first install:

        blueprint assets install core
        blueprint assets list

      Config:  ~/.config/blueprint/
      Cache:   ~/.cache/blueprint/assets/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blueprint --version")
    system bin/"blueprint", "assets", "doctor", "--offline"
  end
end
