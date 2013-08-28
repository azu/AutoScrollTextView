#
# Be sure to run `pod spec lint AutoScrollTextView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "AutoScrollTextView"
  s.version      = "0.0.1"
  s.summary      = "Automatic scrolling UITextView subclass."
  s.homepage     = "https://github.com/azu/AutoScrollTextView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.ios.deployment_target = '5.0'
  s.author       = { "azu" => "info@efcl.info" }
  s.source       = { :git => "https://github.com/azu/AutoScrollTextView.git", :commit => "00c96d0a9da7b4eef29cee828fe43d90071db07a" }
  s.source_files = 'AutoScrollTextViewLib/**/*.{h,m}'
end
