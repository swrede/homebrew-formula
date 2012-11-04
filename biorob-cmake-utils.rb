require 'formula'


class BiorobCmakeUtils < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cmake-utils.cmake'
  url 'https://ponyo.epfl.ch/git/biorob-cmake-utils.git', :using => :git, :commit => "1b6f2878f58d0450e54b405fd2569c1114f8d40b"
  version '0.3.2'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "ls /usr/local/share/BiorobCMakeUtils-0.3/BiorobCMakeUtilsConfig.cmake"
  end
end
