Pod::Spec.new do |s|
  s.name             = 'flutter_hybrid_router'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
    A new flutter plugin project.
                       DESC
  s.homepage         = 'https://blog.devzeng.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'zengjing' => 'hhtczengjing@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'MGJRouter', '~> 0.10.0'
  s.ios.deployment_target = '8.0'
end

