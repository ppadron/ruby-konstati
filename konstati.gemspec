$:.push File.expand_path("../lib", __FILE__)

require 'konstati'

Gem::Specification.new do |s|
  s.name               = "konstati"
  s.version            = Konstati::VERSION
  s.platform           = Gem::Platform::RUBY
  s.authors            = ["Pedro Padron"]
  s.email              = "ppadron@w3p.com.br"
  s.homepage           = "http://konstati.co/"
  s.summary            = %q{Ruby client to the Konstati API}
  s.description        = %q{Ruby client to the Konstati API}
  s.licenses           = ["BSD"]
  s.files              = [
    "lib/konstati.rb",
    "lib/konstati/account.rb",
    "lib/konstati/tests.rb",
    "examples/account_info.rb",
    "examples/create_spamassassin_test.rb",
    "README.markdown",
    "LICENSE"
  ]
  s.rubyforge_project  = "konstati"
  s.extra_rdoc_files   = [
    "README.markdown",
    "LICENSE",
    "examples/account_info.rb",
    "examples/create_spamassassin_test.rb"
  ]
  s.add_dependency "json"
  s.add_dependency "restclient"
end
