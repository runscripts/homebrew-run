require "formula"

class Run < Formula
  homepage "http://runscripts.org"
  url "https://github.com/runscripts/run/archive/0.3.4.tar.gz"
  sha1 "bb2367f952d1c75569912830254842c37fa4f617"
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
