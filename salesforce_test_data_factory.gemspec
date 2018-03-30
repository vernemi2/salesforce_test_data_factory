
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "salesforce_test_data_factory/version"

Gem::Specification.new do |spec|
  spec.name          = "salesforce_test_data_factory"
  spec.version       = SalesforceTestDataFactory::VERSION
  spec.authors       = ["Michal Verner"]
  spec.email         = ["michal.verner.mv@gmail.com"]

  spec.summary       = %q{Salesforce test data apex classes generator.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "restforce", "~> 2.5.3"
  spec.add_dependency "dotenv"
  spec.add_dependency "activesupport", "~> 5.0.0"
  spec.add_dependency "mustache", "~> 1.0"
end
