Gem::Specification.new do |s|
  s.name        = 'Credit Card processing program'
  s.version     = '0.1.0'
  s.summary     = "Basic credit card processing functions"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.author      = "Muntasir Muneer"
  s.email       = 'muntasir.muneer@gmail.com'
  s.files       = Dir["{bin,lib,spec}/**/*"] +%w(README)
  s.test_files  = Dir["spec/**/*"] +%w(README)
  s.executables = [ 'cc_process' ]

  s.required_ruby_version = '>=2.1'
  s.add_dependency 'luhn'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end 