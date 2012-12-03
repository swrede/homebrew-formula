require 'formula'


class BiorobCmakeUtils < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cmake-utils.cmake'
  url 'https://ponyo.epfl.ch/git/biorob-cmake-utils.git', :using => :git, :revision => "b0fe50812b5fc0b1796d5d091c13a468626f4419"
  version '0.3.3'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "ls /usr/local/share/BiorobCMakeUtils-0.3/BiorobCMakeUtilsConfig.cmake"
  end
end
