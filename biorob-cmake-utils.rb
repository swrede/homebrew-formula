require 'formula'


class BiorobCmakeUtils < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cmake-utils.cmake'
  url 'https://ponyo.epfl.ch/git/biorob-cmake-utils.git', :using => :git, :revision => "a027d03ad1b308ad8d84121b7dcb2a5b0f5fadfb"
  version '0.3.4'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "ls /usr/local/share/BiorobCMakeUtils-0.3/BiorobCMakeUtilsConfig.cmake"
  end
end
