require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-device-brightness"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.license      = package['license']
  s.homepage     = package['homepage']
  s.authors      = package['author']
  s.platform     = :ios, "9.0"
  s.source       = { :path => "RNDeviceBrightness/" }
  s.source_files = "**/*.{h,m}"
  
  s.dependency "React"
end