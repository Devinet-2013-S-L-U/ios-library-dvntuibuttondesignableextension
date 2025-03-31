Pod::Spec.new do |s|
  
  s.name             = 'DVNTUIButtonDesignableExtension'
  s.version          = '1.1.0'
  s.summary          = 'An amazing UIButton estension.'
  s.description      = 'A extension that let\'s you set the corner radius, the border with and the border color of a button trought Interface Builder.'
  s.homepage         = 'https://www.devinet.es'
  s.license          = { :type => 'Copyright (c) 2025 Devinet 2013, S.L.U.', :file => 'LICENSE' }
  s.author           = { 'Raúl Vidal Muiños' => 'contacto@devinet.es' }
  s.social_media_url = 'https://twitter.com/devinet_es'
  s.platform         = :ios, '9.3'
  s.ios.deployment_target = '9.3'
  s.swift_versions   = ['3.0', '4.0', '4.1', '4.2', '5.0',  '5.1',  '5.2',  '5.3',  '5.4',  '5.5',  '5.6',  '5.7',  '5.8',  '5.9',  '5.10']
  s.source           = { :git => 'https://github.com/Devinet-2013-S-L-U/ios-library-dvntuibuttondesignableextension.git', :tag => s.version.to_s }
  s.frameworks       = 'UIKit'
  s.source_files     = 'Sources/DVNTUIButtonDesignableExtension/Classes/**/*'
  s.exclude_files    = 'Sources/DVNTUIButtonDesignableExtension/**/*.plist'
  
end
