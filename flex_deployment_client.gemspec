# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flex_deployment_client/version'

Gem::Specification.new do |spec|
  spec.name          = "flex_deployment_client"
  spec.version       = FlexDeploymentClient::VERSION
  spec.authors       = ["Gary Taylor"]
  spec.email         = ["gary.taylor@flexcommerce.com"]

  spec.summary       = "A client for the flex deployment platform"
  spec.description   = "A client for the flex deployment platform"
  spec.homepage      = "http://www.example.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "json_api_client", "~> 1.5"
  spec.add_runtime_dependency "oj"
  spec.add_runtime_dependency "mime-types", ">= 2.99", "<= 3.1"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
