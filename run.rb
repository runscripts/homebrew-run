require "formula"

class Run < Formula
  homepage "http://runscripts.org"
  url "https://github.com/runscripts/run/archive/0.3.5.tar.gz"
  sha1 "a64c06a29d448d5263cc957f358807ca1a4f2401"
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
