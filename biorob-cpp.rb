require 'formula'

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/gitlab/core/projects/biorob-cpp'
  url 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git, :revision => "3d8f1e75cd6f80d54af20ba5e316a9502356fe95"
  version '0.3.0'

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
