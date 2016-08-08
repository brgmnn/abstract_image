# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abstract_image/version'

Gem::Specification.new do |s|
  s.name        = 'abstract_image'
  s.version     = AbstractImage::VERSION
  s.authors     = ['Daniel Bergmann']
  s.email       = ['']
  s.date        = DateTime.now.strftime '%Y-%m-%d'
  s.summary     = 'Generate abstract images'
  s.description = ''
  s.files       = Dir['lib/*.rb']
  s.homepage    = 'https://github.com/brgmnn/abstract_image'
  s.license     = 'MIT'

  s.add_dependency 'builder', '~> 3.2'
  s.add_dependency 'statistics2', '~> 0.54'
end
