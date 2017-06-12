Pod::Spec.new do |s|
  s.name         = "DZRPageMenuController"
  s.version      = "1.1.0"
  s.summary      = "A simple paging menu controller."
  s.homepage     = "https://github.com/luo6luo/DZRPageMenu"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "dundun" => "767126162@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/luo6luo/DZRPageMenuController.git", :tag => "#{s.version}" }
  s.source_files  = 'DZRPageMenuController/**/*.{h,m}'
end
