require "formula"

class Run < Formula
  homepage "http://runscripts.org"
  url "https://github.com/runscripts/run/archive/0.2.0.tar.gz"
  sha1 "6c3a2cc25bc20330f66651edd16956f6324dc7dd"
  head "https://github.com/runscripts/run.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "get", "github.com/runscripts/run"
    system "go", "build", "-o", "run"
    bin.install "run"
    etc.install "run.conf"
    (HOMEBREW_PREFIX+"run").mkpath
  end

  test do
    system "#{bin}/run", "--help"
  end
end
