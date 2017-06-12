Pod::Spec.new do |s|
  s.name         = "DZRPageMenu"
  s.version      = "1.0.2"
  s.summary      = "A simple paging menu controller."
  s.homepage     = "https://github.com/luo6luo/DZRPageMenu"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "dundun" => "767126162@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/luo6luo/DZRPageMenu.git", :tag => "#{s.version}" }
  s.source_files  = 'DZRPageMenu/**/*.{h,m}'
end
