require 'json'
package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RCTSilentSwitch"
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = "react-native-silent-switch"
  s.license      = "MIT"
  s.author       = package['author']
  s.platform     = :ios, "9.0"
  s.source       = { :git => "react-native-silent-switch", :tag => "#{s.version}" }
  s.source_files = "*.{h,m}"
  s.requires_arc = true

  s.dependency 'React'
end
