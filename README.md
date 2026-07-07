# clawkwork/homebrew-tap

Homebrew tap for [clawk](https://github.com/clawkwork/clawk) — disposable
Linux VMs for coding agents.

```sh
brew install clawkwork/tap/clawk
```

Requires macOS 14+ on Apple silicon. The formula downloads the release
binary and ad-hoc-codesigns it locally with the Virtualization.framework
entitlements clawk needs — no Apple Developer ID required.

`Formula/clawk.rb` is updated automatically by clawk's release workflow on
each tagged release; edits here are normally overwritten.
