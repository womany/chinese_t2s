# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chinese_t2s/version'

Gem::Specification.new do |spec|
  spec.name          = "chinese_t2s"
  spec.version       = ChineseT2s::VERSION
  spec.authors       = ["wildjcrt"]
  spec.email         = ["wildjcrt@womany.net"]
  spec.summary       = %q{Translate traditional Chinese to Simplified Chinese.}
  spec.description   = %q{Translate traditional Chinese to Simplified Chinese.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
