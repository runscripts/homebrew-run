require "formula"

class Runscripts < Formula
  homepage "http://runscripts.org"
  url "https://github.com/runscripts/run.git", :tag => "0.2.0"

  depends_on "go" => :build

  def install
    system "go", "build"
    bin.install "run"
    etc.install "run.conf"
  end

  test do
    system "#{bin}/run", "--help"
  end
end
