require_relative 'lib/national_parks/version'

Gem::Specification.new do |spec|
  spec.name          = "national_parks"
  spec.version       = NationalParks::VERSION
  spec.authors       = ["ADAM HORN"]
  spec.email         = ["hornadam8@gmail.com"]

  spec.summary       = %q{NPS datagem}
  spec.description   = %q{A datagem of national parks}
  spec.homepage      = "https://www.nationalparks.org/explore-parks/all-parks"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.dfnosdf.com"
  spec.metadata["changelog_uri"] = "https://wwww.fjsjijijf.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency 'require_all'
  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency 'pry'
end
