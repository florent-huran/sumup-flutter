#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'sumup_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Sumup Payment terminal handling in flutter'
  s.description      = <<-DESC
Sumup Payment terminal handling in flutter
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'SumUpSDK'
  s.ios.deployment_target = '8.0'
  s.swift_version = '4.1'
  s.static_framework = true
end

