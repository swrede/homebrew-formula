require 'formula'

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cpp'
  url 'https://ponyo.epfl.ch/git/biorob-cpp.git' , :using => :git, :revision => "b04c8d2d61d86008201e3b3e6cbf4d0c1d940e8d"
  version '0.2.8'

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
