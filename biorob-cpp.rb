require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/redmine/projects/biorob-cpp'
  url 'https://ponyo.epfl.ch/git/biorob-cpp.git' , :using => :git, :revision => "cb62c171ec1d71acd36b62ca77f27d371fb5f22e"
  version '0.2.0'

  depends_on 'cmake' => :build
  depends_on 'biorob-cmake-utils' => :build
  


  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test biorob`.
    system "make check"
  end
end
