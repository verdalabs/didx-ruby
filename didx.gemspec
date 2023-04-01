# frozen_string_literal: true

require_relative "lib/didx/version"

Gem::Specification.new do |spec|
  spec.name = "didx"
  spec.version = DIDX::VERSION
  spec.authors = ["Thomas Carr"]
  spec.email = ["9591402+htcarr3@users.noreply.github.com"]
  spec.summary = "Ruby SDK for Decentralized Identifiers (DIDs)"
  spec.description = "Resolve, create & manage Decentralized Identifiers (DIDs)"
  spec.homepage = "https://ssi.land"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/verdafy/didx-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/verdafy/didx-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "base58", "~> 0.2.3"
  spec.add_dependency "ed25519", "~> 1.3"
  spec.add_dependency "x25519", "~> 1.0", ">= 1.0.10"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
