require "formula"

class Run < Formula
  homepage "http://runscripts.org"
  url "https://github.com/runscripts/run.git", :tag => "0.2.0"

  depends_on "go" => :build

  def install
    system "echo", "it works"
    ENV["GOPATH"] = buildpath
    system "go", "build", "-o", "run"
    bin.install "run"
    #etc.install "run.conf"
  end

  test do
    system "#{bin}/run", "--help"
  end
end
