# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "hastings-fs"
  spec.version       = "0.1.1"
  spec.authors       = ["Bernardo Farah"]
  spec.email         = ["ber@bernardo.me"]

  spec.summary       = "File system interactions implemented in Hastings"
  spec.description   = "Integrates interactions with files and directories in"\
                       "Hastings and into a DSL"
  spec.homepage      = "http://github.com/berfarah/hastings-fs"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
