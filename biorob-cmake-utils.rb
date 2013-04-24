require 'formula'


class BiorobCmakeUtils < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cmake-utils.cmake'
  head 'https://ponyo.epfl.ch/git/biorob-cmake-utils.git', :using => :git
  url 'https://ponyo.epfl.ch/git/biorob-cmake-utils.git', :using => :git, :revision => "df730c643a6f91715685dbc7e2a2d465fc40888a"
  version '0.3.5'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "ls /usr/local/share/BiorobCMakeUtils-0.3/BiorobCMakeUtilsConfig.cmake"
  end
end
