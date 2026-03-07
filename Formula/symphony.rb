class Symphony < Formula
  desc "Multi-backend AI coding agent orchestrator (Linear/GitHub + Codex/Claude)"
  homepage "https://github.com/sapsaldog/symphony"
  url "https://github.com/sapsaldog/symphony/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e5f8286aaf67942f1db2b12c57ebbc5037bb8ec13e1eaaff6728b8c996900050"
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
