
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "info_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "info_parser"
  spec.version       = InfoParser::VERSION
  spec.authors       = ["Toby Joy"]
  spec.email         = ["tobyjoy92@gmail.com"]

  spec.summary       = "Fetch data from file and display"
  spec.description   = "This gem iterates through the data passed to it and displays its results "
  spec.homepage      = "localhost:3000"

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
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency 'json', '~> 2.1', '>= 2.1.0'
end
