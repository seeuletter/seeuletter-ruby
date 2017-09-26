# coding: utf-8
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "seeuletter/version"

Gem::Specification.new do |spec|
  spec.name          = "seeuletter"
  spec.version       = Seeuletter::VERSION
  spec.authors       = ["Seeuletter"]
  spec.email         = ["hello@seeuletter.com"]
  spec.description   = %q{Seeuletter API Ruby wrapper}
  spec.summary       = %q{Ruby wrapper for Seeuletter.com API - ActiveRecord-style syntax}
  spec.homepage      = "https://github.com/seeuletter/seeuletter-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">= 1.8", "< 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.4.2"
end
