Pod::Spec.new do |s|
s.name         = "YFCommonTools"
s.version      = "0.0.3"
s.summary      = "Tools for OC"
s.description  = <<-DESC
Tools for OC private.
DESC
s.homepage     = "https://github.com/BigShow1949/YFCommonTools.git"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "BigShow1949" => "1029883589@qq.com" }
s.source       = { :git => "https://github.com/BigShow1949/YFCommonTools.git", :tag => "#{s.version}" }
s.ios.deployment_target = '8.0'
s.source_files = "**/*.{h,m}"
s.frameworks   = "CoreGraphics", "QuartzCore", "UIKit"
s.requires_arc = true
end
