Pod::Spec.new do |s|
s.name         = "YFCommonTools"
s.version      = "0.0.7"
s.summary      = "Tools for OC"
s.description  = <<-DESC
Tools for OC private.
DESC
s.homepage     = "https://github.com/BigShow1949/YFCommonTools.git"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "BigShow1949" => "1029883589@qq.com" }
s.source       = { :git => "https://github.com/BigShow1949/YFCommonTools.git", :tag => "#{s.version}" }
s.ios.deployment_target = '8.0'
s.source_files = 'YFCommonTools/**/*.{h,m}'
s.public_header_files = 'YFCommonTools/**/*.{h}'
s.frameworks   = "CoreGraphics", "QuartzCore", "UIKit", "CoreLocation", "Foundation"
s.requires_arc = true


s.subspec 'Categories' do |category|
    category.source_files = 'YFCommonTools/Categories/**/*.{h,m}'
    category.public_header_files = 'YFCommonTools/Categories/**/*.{h}'
end

end
