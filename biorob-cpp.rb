require 'formula'

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/gitlab/core/projects/biorob-cpp'
  head 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git
  url 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git, :branch => 'maverick-support'
  version '0.3.2~rc1'

  option :universal

  depends_on 'cmake' => :build
  depends_on 'biorob-cmake-utils' => :build
  
  def install
    ENV.universal_binary if build.universal?
    
    args = std_cmake_args
    if MacOS.version == "10.9"
      args << "-DCMAKE_OSX_DEPLOYMENT_TARGET=10.8"
      args << "-DCMAKE_BUIDL_TYPE=Release"
    end

    system "cmake", ".", *args
    system "make install" 
  end

  def test
    system "make check"
  end
end
