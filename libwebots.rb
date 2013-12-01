require 'formula'


class Libwebots < Formula
	version '0.3.0'
	homepage 'https://ponyo.epfl.ch/gitlab/webots/libwebots'
	url 'https://ponyo.epfl.ch/gitlab/webots/libwebots.git', :using => :git
	#, :commit => '9dbb7dc903ed9973faceb3dbce4f20a1eb2ab371'
	head 'https://ponyo.epfl.ch/gitlab/webots/libwebots.git', :using => :git

	option :universal

	depends_on 'cmake' => :build
	depends_on  'eigen'
	depends_on 'protobuf'

	def test_webots_presence
		possible_location = [ENV["WEBOTS_HOME_PATH"],ENV["WEBOTS_HOME"],"/Applications/Webots"]
		possible_location.each do |p|
			if p.nil?
				next
			end
			tests = [
			         File.exists?("#{p}/include/controller/c/webots/robot.h"),
			         File.exists?("#{p}/include/controller/cpp/webots/Robot.hpp"),
			         File.exists?("#{p}/lib/libController.dylib"),
			         File.exists?("#{p}/lib/libCppController.dylib")
			        ]
			tests.each do |t|
				unless t
					onoe "Webots installation seems misisng or incomplete."
					puts <<-EOS.undent
You need a working installation of Webots (http://www.cyberbotics.com).

Please notice that if you don't install it under the standard path
(/Applications) You *NEED* to specify either WEBOTS_HOME or
WEBOTS_HOME_PATH in your environment (and webots is also expecting
that!!!)

EOS
					exit 99
				end
			end
		end
	end

	def install
		test_webots_presence
		# required due to otherwise failing FindWebots.cmake in biorob-cmake-utils
		opoo "FIX-ME: Assuming Default Webots installation directory: /Applications/Webots"
		ENV.universal_binary if build.universal?

		system "cmake", ".","-DWEBOTS_ROOT_DIR=/Applications", *std_cmake_args
		system "make install"
	end

	def test
		prefix="/usr/local"
		files = ["lib/libwebots-communication.dylib","lib/libwebots-plugins.dylib","lib/libwebots-messages.dylib"]
		files.each do |f|
			unless File.exists?("#{prefix}/#{f}")
				return false
			end
		end
		return true
	end
end
