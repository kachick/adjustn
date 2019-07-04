# coding: us-ascii

require File.expand_path('../lib/adjustn/version', __FILE__)

Gem::Specification.new do |gem|
  # specific

  gem.name          = 'adjustn'
  gem.description   = %q{A tiny text tool for adjusting new line characters}
  gem.summary       = gem.description.dup
  gem.license       = 'MIT'
  gem.version       = AdjustN::VERSION.dup

  gem.add_development_dependency 'test-declare', '~> 0.0.3'
  gem.add_development_dependency 'yard', '>= 0.9.20', '< 2'
  gem.add_development_dependency 'rake', '>= 10', '< 20'
  gem.add_development_dependency 'bundler', '>= 2', '< 3'

  if RUBY_ENGINE == 'rbx'
    gem.add_dependency 'rubysl', '~> 2.0'
    gem.add_dependency 'rubysl-test-unit', '~> 2.0'
  end

  # common

  gem.homepage      = "http://kachick.github.com/#{gem.name}"
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end

