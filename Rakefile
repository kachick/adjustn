gem 'hoe', '~> 3.0.6'
require 'hoe'
require 'fileutils'

Hoe.plugin :newgem

$hoe = Hoe.spec 'adjustn' do
  developer 'Kenichi Kamiya', 'kachick1+ruby@gmail.com'
  self.rubyforge_name       = name
  require_ruby_version '>= 1.9.3'
  dependency 'yard', '>= 0.8.2.1', :development
  dependency 'declare', '~> 0.0.3', :development
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each {|t|load t}
