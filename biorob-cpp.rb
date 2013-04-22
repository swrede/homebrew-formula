require 'formula'

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/gitlab/core/projects/biorob-cpp'
  url 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git, :revision => "f9adc904ab27f276278f5953339609de64b8440b"
  version '0.3.1'

  depends_on 'cmake' => :build
  depends_on 'biorob-cmake-utils' => :build
  


  def install
    system "cmake", ".", *std_cmake_args
    system "make install" 
  end

  def test
    system "make check"
  end
end
