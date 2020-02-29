
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "surveymonkey_api/version"

Gem::Specification.new do |spec|
  spec.name          = "surveymonkey_api"
  spec.version       = SurveymonkeyApi::VERSION
  spec.authors       = ["Carlos"]
  spec.email         = ["chdezmar@gmail.com"]

  spec.summary       = %q{.}
  spec.description   = %q{.}
  spec.homepage      = "https://github.com/chdezmar/surveymonkey_api"
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

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry-byebug', "~> 3.1"
  spec.add_dependency 'httparty', '~> 0.13'
end
