require 'formula'

class Liboptimization3 < Formula
	version '3.0'
	homepage 'http://biorob.epfl.ch'
	head 'https://ponyo.epfl.ch/gitlab/optimization/liboptimization.git', :branch => 'api-3.0'

	option :universal

	depends_on 'pkg-config' => :build
	depends_on 'autoconf' => :build
	depends_on 'automake' => :build
	depends_on 'libtool' => :build
	depends_on 'protobuf'

	def install
		ENV.universal_binary if build.universal?

		system "./autogen.sh", "--prefix=#{prefix}", "--disable-maintainer-mode"
		system "make install" # if this fails, try separate make/make install steps
	end
end
