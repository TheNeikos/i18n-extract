
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "i18n_extract/version"

Gem::Specification.new do |spec|
  spec.name          = "i18n_extract"
  spec.version       = I18nExtract::VERSION
  spec.authors       = ["Marcel Müller"]
  spec.email         = ["neikos@neikos.email"]

  spec.summary       = "Extract hardcoded strings from your ERB views."
  spec.homepage      = "https://github.com/TheNeikos/i18n_extract"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
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

  spec.add_dependency "better_html", "~> 1.0"
  spec.add_dependency "parser", "~> 2.5"
  spec.add_dependency "colorize", "~> 0.8"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5"
end
