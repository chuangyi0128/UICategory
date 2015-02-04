#
# Be sure to run `pod lib lint UICategory.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UICategory"
  s.version          = "1.0.0"
  s.summary          = "UICategory"
  s.description      = "UIImage+Crop
                        UIViewController+TopmostViewController"
  s.homepage         = "https://github.com/chuangyi0128/UICategory"
  s.license          = 'MIT'
  s.author           = { "SongLi" => "chuangyi0128@gmail.com" }
  s.source           = { :git => "https://github.com/chuangyi0128/UICategory.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'UICategory'
end
