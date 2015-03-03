require "formula"

class Run < Formula
  homepage "http://runscripts.org"
  url "https://github.com/runscripts/run/archive/0.3.6.tar.gz"
  sha1 "77e25d25b55a6eced3d1efa3a7c22693720c0c81"
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
