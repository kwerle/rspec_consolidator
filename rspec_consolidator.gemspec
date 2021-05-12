# frozen_string_literal: true

require_relative "lib/rspec_consolidator/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec_consolidator"
  spec.version       = RspecConsolidator::VERSION
  spec.authors       = ["Kurt Werle"]
  spec.email         = ["kurt@CircleW.org"]

  spec.summary       = "Consolidate and render rspec json output"
  spec.description   = "Consolidate and render rspec json output to facilitate running rspec across machines/nodes/containers."
  spec.homepage      = "http://www.github.com/kwerle/rspec_consolidator"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "guard-rspec", "~> 4.7.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop", "~> 1.14"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
