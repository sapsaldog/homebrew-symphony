class SymphonyClaude < Formula
  desc "A JSON-RPC 2.0 Claude Code App Server conforming to the OpenAI Symphony Codex protocol spec"
  homepage "https://github.com/sapsaldog/claude-app-server"
  url "https://github.com/sapsaldog/claude-app-server/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b2829a7651bb4c5861b2eddbcceac4e6a4bbb9f9a624ea17a636119b9f7bedf4"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "symphony-claude", shell_output("#{bin}/symphony-claude --help")
  end
end
