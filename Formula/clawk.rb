class Clawk < Formula
  desc "Disposable Linux VMs for coding agents"
  homepage "https://github.com/clawkwork/clawk"
  version "0.2.0" # auto-updated by clawk's release workflow on each tag
  license "Apache-2.0"

  # Apple Virtualization.framework: Apple silicon, macOS 14+ only.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  url "https://github.com/clawkwork/clawk/releases/download/v0.2.0/clawk-v0.2.0-darwin-arm64.tar.gz"
  sha256 "694cdf6672808168ae3129d33b05926376a8bf98a44826126067c92e7ded5953"

  def install
    bin.install "clawk"
    # Virtualization.framework refuses to run from an unsigned binary.
    # Ad-hoc re-sign locally with the required entitlements (same as the
    # upstream `make install`); no Apple Developer ID needed.
    system "codesign", "--force", "--sign", "-",
           "--entitlements", buildpath/"clawk.entitlements", bin/"clawk"
  end

  def caveats
    <<~EOS
      clawk needs macOS 14+ on Apple silicon. First run probes for anything
      missing and offers to fix it. `clawk pr` additionally needs the `gh` CLI.
    EOS
  end

  test do
    assert_match "clawk", shell_output("#{bin}/clawk version")
  end
end
