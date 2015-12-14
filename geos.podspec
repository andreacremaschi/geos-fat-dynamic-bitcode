Pod::Spec.new do |s|
  s.name	= "geos"
  s.version	= "3.5.0"
  s.summary	= "GEOS (Geometry Engine - Open Source) is a C++ port of the Java Topology Suite (JTS)."
  s.homepage	= "http://trac.osgeo.org/geos/"
  s.license	= { :type => "GNU LGPL 2.1",
		    :file => "COPYING" }
  s.author	= { "Yury Bychkov" => "me@yury.ca",
		    "Martin Davis" => "mbdavis@refractions.net" }
  s.source	= { :git => "https://github.com/andreacremaschi/geos-fat-dynamic-bitcode.git", :tag => '3.5.0' }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  s.subspec "Core" do |sp|
    sp.prepare_command = <<-CMD
      make
    CMD
    sp.source_files = "include/geos_c.h"
    sp.vendored_libraries = "lib/libgeos_c.dylib", "lib/libgeos.dylib"
    sp.public_header_files = "include/geos_c.h"
  end

  s.subspec "Prebuilt" do |sp|
    # TODO: download the prebuilt distribution package
    # sp.prepare_command = <<-CMD
    #   make
    # CMD
    sp.source_files = "include/geos_c.h"
    sp.vendored_libraries = "lib/libgeos_c.dylib", "lib/libgeos.dylib"
    sp.public_header_files = "include/geos_c.h"
  end

  s.default_subspec = "Core"

end

