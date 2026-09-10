class Blueprint < Formula
  desc "Agent harness CLI with independently versioned assets"
  homepage "https://github.com/krerapus/agent-harness-blueprint"
  version "1.4.0"
  license "MIT"

  # Artifacts are produced by agent-harness-blueprint GitHub Releases (source of truth).
  # URLs/sha256 are rewritten by scripts/bump-homebrew-formula.sh after each CLI release.
  on_macos do
    on_arm do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_darwin_arm64.tar.gz"
      sha256 "e3aff3fc28a4e8f9a1266e50c9feb03de547454ba91c236bed37f6fdda339305"
    end
    on_intel do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_darwin_amd64.tar.gz"
      sha256 "e3aff3fc28a4e8f9a1266e50c9feb03de547454ba91c236bed37f6fdda339305"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_linux_arm64.tar.gz"
      sha256 "e3aff3fc28a4e8f9a1266e50c9feb03de547454ba91c236bed37f6fdda339305"
    end
    on_intel do
      url "https://github.com/krerapus/agent-harness-blueprint/releases/download/v1.4.0/blueprint_1.4.0_linux_amd64.tar.gz"
      sha256 "e3aff3fc28a4e8f9a1266e50c9feb03de547454ba91c236bed37f6fdda339305"
    end
  end

  def install
    # Bash CLI resolves ROOT from the script path and sources lib/ + builtin/ as siblings.
    # Install the full release tree under libexec; expose a bin wrapper.
    libexec.install "blueprint"
    libexec.install "VERSION"
    libexec.install "lib"
    libexec.install "builtin"
    libexec.install "LICENSE" if File.exist?("LICENSE")
    libexec.install "README.md" if File.exist?("README.md")
    libexec.install "contributor" if Dir.exist?("contributor")

    chmod 0755, libexec/"blueprint"
    bin.write_exec_script libexec/"blueprint"
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
    assert_predicate libexec/"lib/blueprint/assets.sh", :exist?
    assert_predicate libexec/"builtin/templates/entrypoints/HARNESS.md", :exist?
    system bin/"blueprint", "assets", "doctor", "--offline"
  end
end
