Pod::Spec.new do |s|
 
  s.name         = "CHAlertView"
  s.version      = "0.0.1"
  s.summary      = "Alertview for ios "
  s.author       = { "guojintao" => "841301847@qq.com" }
  s.license      = "MIT"
  s.description  = "一个可以自定义的AlertView"
  s.homepage     = "https://github.com/ChaussonORG/CHAlertView.git"
    
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ChaussonORG/CHAlertView.git", :tag => "0.0.1" }
    
  s.source_files  = "CHAlertView/CHAlertView/*.{h,m}"
    
end
