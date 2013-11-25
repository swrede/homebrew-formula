require 'formula'


class BiorobCmakeUtils < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cmake-utils.cmake'
  head 'https://ponyo.epfl.ch/gitlab/core/biorob-cmake-utils.git', :using => :git
  url 'https://ponyo.epfl.ch/gitlab/core/biorob-cmake-utils.git', :using => :git, :tag => "v0.3.7"
  version '0.3.7'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "ls /usr/local/share/BiorobCMakeUtils-0.3/BiorobCMakeUtilsConfig.cmake"
  end
end
