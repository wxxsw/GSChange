Pod::Spec.new do |s|
  s.name         = 'GSChange'
  s.version      = '0.2.3'
  s.summary      = 'Automatically synchronize changes, such as likes, follow, etc.'
  s.homepage     = 'https://github.com/wxxsw/GSChange'

  s.license      = 'MIT'
  s.author       = { 'Gesen' => 'i@gesen.me' }
  s.source       = { :git => 'https://github.com/wxxsw/GSChange.git', :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'GSChange/Classes/**/*'

  s.swift_version = '4.2'
  s.swift_versions = ['4.2', '5.0']

  s.dependency 'RxCocoa'
end
