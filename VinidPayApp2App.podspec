Pod::Spec.new do |s|
  s.name             = 'VinidPayApp2App'
  s.version          = '0.0.3'
  s.summary          = 'Vinid pay sdk to connect with OneU App'
  s.homepage         = 'https://github.com/97longphan/VinidPayApp2App'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '97longphan' => '97longphan@gmail.com' }
  s.source           = { :git => 'https://github.com/97longphan/VinidPayApp2App.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files  = "Sources/**/*"
end