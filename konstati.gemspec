$:.push File.expand_path("../lib", __FILE__)

require 'konstati'

Gem::Specification.new do |s|
  s.name        = "konstati"
  s.version     = Konstati::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pedro Padron"]
  s.email       = "ppadron@w3p.com.br"
  s.homepage    = "http://konstati.co/"
  s.summary     = %q{Ruby client to the Konstati API}
  s.description = %q{Ruby client to the Konstati API}
  s.files       = Dir["*.rb"].to_a

  s.add_dependency "activeresource"
end
