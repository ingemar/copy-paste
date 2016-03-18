# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'copy-paste/version'

Gem::Specification.new do |spec|
  spec.name          = "copy-paste"
  spec.version       = CopyPaste::VERSION
  spec.authors       = ["Ingemar"]
  spec.email         = ["ingemar@xox.se"]

  spec.summary       = %q{Copy from irb or pry}
  spec.description   = %q{Move stuff from irb or pry to your pasteboard (the Clipboard)}
  spec.homepage      = "https://github.com/ingemar/copy-paste"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "color_puts", "~> 0.0"
  spec.add_development_dependency "bundler", "~> 1.11"
end
