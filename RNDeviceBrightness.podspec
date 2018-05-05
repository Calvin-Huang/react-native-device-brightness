require "json"

package = JSON.parse(File.read(File.join(__dir__, "./package.json")))
version = package["version"]
giturl = package["repository"]["url"]

Pod::Spec.new do |s|
  s.name         = "RNDeviceBrightness"
  s.version      = version
  s.summary      = "react-native-device-brightness"
  s.description  = <<-DESC
                  Control device screen brightness from React-Native applications
                   DESC
  s.homepage     = giturl
  s.license      = "MIT"
  # s.license    = { :type => "MIT" }
  s.author       = { "Calvin Huang" => "calvin.peak@capslock.tw" }
  s.platform     = :ios, "10.2"
  s.source       = { :git => giturl + ".git", :tag => version }
  s.source_files  = "RNDeviceBrightness/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  
