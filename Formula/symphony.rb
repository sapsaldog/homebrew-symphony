class Symphony < Formula
  desc "Multi-backend AI coding agent orchestrator (Linear/GitHub + Codex/Claude)"
  homepage "https://github.com/sapsaldog/symphony"
  url "https://github.com/sapsaldog/symphony/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4ab28a9624e8e567400b7d9fe1a360c7c7d1c206f5bd20c41bfabbd14a945ca0"
  license "Apache-2.0"

  depends_on "erlang"
  depends_on "elixir"

  def install
    cd "elixir" do
      system "mix", "local.hex", "--force"
      system "mix", "local.rebar", "--force"
      system "mix", "deps.get"
      system "mix", "escript.build"
      bin.install "bin/symphony"
    end
  end

  test do
    assert_match "symphony", shell_output("#{bin}/symphony --help 2>&1", 1)
  end
end
