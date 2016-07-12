Pod::Spec.new do |s|

  s.name             = 'FitTrack'
  s.version          = '0.1.0'
  s.summary          = 'Concept of a fitness app'
  s.screenshot       = 'https://d13yacurqjgara.cloudfront.net/users/226733/screenshots/2337201/open-uri20151106-3-2y7q4w'

  s.homepage         = 'https://github.com/Yalantis/FitTrack'
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "Yalantis"
  s.social_media_url = "https://twitter.com/yalantis"

  s.platform         = :ios, '9.0'
  s.ios.deployment_target = '9.0'

  s.source           = { :git => 'https://github.com/Yalantis/FitTrack.git', :tag => "0.1.0" }
  s.source_files = 'FitTrack/Classes/**/*'
  s.resource_bundles = {  'FitTrack' => [ 'FitTrack/Classes/**/*.xib']  }

  s.requires_arc     = true
  
end
