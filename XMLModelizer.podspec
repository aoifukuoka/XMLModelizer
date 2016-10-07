Pod::Spec.new do |s|
  s.name         = "XMLModelizer"
  s.version      = "0.0.1"
  s.summary      = "XMLModelizer is a simple XML Parser and Modelizer."
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/aoifukuoka/XMLModelizer"
  s.author       = { "Aoi Fukuoka" => "aoponaopon85746@gmail.com" }
  s.source       = { :git => "https://github.com/aoifukuoka/XMLModelizer.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.source_files = 'XMLModelizer/**/*.{h,m,swift}'
  s.dependency "KissXML", "5.1.2"
  s.description      = <<-DESC
  XMLModelizer is a XML Parser, also instance, that have each xml element, generator(modelizer). 
  Once you give model class and XML URL to XMLModelizer, you can get model instances that have XML elements which you need as properties(it needs only one line!!).
  DESC
end
