lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'butter_cms/version'

Gem::Specification.new do |s|
  s.name        = 'butter_cms_v2'
  s.date        = '2018-08-15'
  s.summary     = "Ruby wrapper for the ButterCMS API"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'dziamber@gmail.com'
  s.homepage    =
    'http://github.com/rubyhero/butter_cms'
  s.license     = 'MIT'
  s.version     = ButterCMS::Version
  s.add_development_dependency "rspec", '~> 3.7', '>= 3.7.0'
  s.files       = Dir['spec/helper.rb']
end
