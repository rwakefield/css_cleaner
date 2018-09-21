lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |s|
  s.name = 'css_cleaner'
  s.version = '0.0.0'
  s.date = '2018-09-19'
  s.summary = 'CSS Cleaner'
  s.description = 'Input CSS ouput SCSS'
  s.authors = ['Russell Wakefield']
  s.email = 'russellwakefield4d@gmail.com'
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.homepage = 'https://github.com/rwakefield/css_cleaner'
  s.license = 'MIT'
  s.add_development_dependency 'minitest', ['>= 0']
  s.require_path = 'lib'
  s.executables = ['bundle']
end
