lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flex_deployment_client/version"

Gem::Specification.new do |spec|
  spec.name = "flex_deployment_client"
  spec.version = FlexDeploymentClient::VERSION
  spec.authors = ["SHIFT Developers"]
  spec.email = ["developers@shiftcommerce.com"]

  spec.summary = "A client for the flex deployment platform"
  spec.description = "A client for the flex deployment platform"
  spec.homepage = "http://github.com/shiftcommerce/flex_deployment_client"
  spec.license = "Unlicensed"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "json_api_client", "~> 1.20"
  spec.add_runtime_dependency "oj"
  spec.add_runtime_dependency "mime-types"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
