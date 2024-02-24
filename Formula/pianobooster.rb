class Pianobooster < Formula
  desc "MIDI file player/game that displays musical notes and teaches you to play piano"
  homepage "https://www.pianobooster.org/"
  url "https://github.com/pianobooster/PianoBooster.git", tag: "v1.0.0"
  license :cannot_represent
  head "https://github.com/pianobooster/PianoBooster.git", branch: "develop"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "fluid-synth"
  depends_on "qt@5"

  def install
    system "cmake", "-S", ".", "-B", "build", "-DUSE_FTGL=OFF", *std_cmake_args
    system "cmake", "--build", "build", "-t", "pianobooster"
    system "cmake", "--install", "build"
    cp_r("build/build/pianobooster.app", prefix.to_s)
  end

  test do
    system "true"
  end
end
