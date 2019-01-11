Pod::Spec.new do |s|
  s.name             = 'BBCGestureRecognizer'
  s.version          = '0.1.0'
  s.summary          = 'Elegant custom recognizer to track user draw BBC on screen.'
  s.license          = 'MIT'
  s.homepage         = 'https://github.com/MortMerr/BBCGestureRecognizer'
  s.author           = { 'MortMerr' => 'nazarof.anton@gmail.com' }
  s.source           = { :git => 'https://github.com/MortMerr/BBCGestureRecognizer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@M0rtyMerr'
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'BBCGestureRecognizer/Classes/**/*'
  s.resource_bundles = {
    'BBCGestureRecognizer' => ['BBCGestureRecognizer/Assets/**']
  }
  s.public_header_files = 'Pod/Classes/**/*.h'
end
