# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'dbc-ruby/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Kevin Buchanan"]
  gem.email         = ["kevaustinbuch@gmail.com"]
  gem.description   = %q{REST API client for http://api.devbootcamp.com}
  gem.summary       = %q{REST API client for http://api.devbootcamp.com}
  gem.homepage      = "https://github.com/socrates-api/dbc-ruby"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "dbc-ruby"
  gem.require_paths = ["lib"]
  gem.version       = DBC::VERSION

  gem.add_dependency 'rest-client'
  gem.add_development_dependency 'rspec', '~> 2.7'

  gem.require_paths = ['lib']
end
