require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.license      = package['license']
  s.description  = <<-DESC
                  react-native-device-brightness
                   DESC
  s.homepage     = package['homepage']
  s.authors      = package['author']
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/Calvin-Huang/react-native-device-brightness.git", :tag => "#{s.version}" }

  s.source_files = "**/*.{h,m}"

  s.dependency "React"
end
