#
# Be sure to run `pod lib lint CCIAbacusView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CCIAbacusView'
  s.version          = '0.1.0'
  s.summary          = 'CCIAbacusView is a simple costumisable View'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
CCIAbacusView is a simple costumisable View. It uses UIKit, for UIView and UIStackView, so that it conforms to autolayout.
                       DESC

  s.homepage         = 'https://github.com/ccosnean/CCIAbacusView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ccosnean' => 'cristian.cosneanu@endava.com' }
  s.source           = { :git => 'https://github.com/ccosnean/CCIAbacusView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CCIAbacusView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CCIAbacusView' => ['CCIAbacusView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
