require 'formula'

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/gitlab/core/projects/biorob-cpp'
  head 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git
  url 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git, :revision => "f9adc904ab27f276278f5953339609de64b8440b"
  version '0.3.1'

  option :universal

  depends_on 'cmake' => :build
  depends_on 'biorob-cmake-utils' => :build
  
  def install
    ENV.universal_binary if build.universal?

    system "cmake", ".", *std_cmake_args
    system "make install" 
  end

  def test
    system "make check"
  end
end
