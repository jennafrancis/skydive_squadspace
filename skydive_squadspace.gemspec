# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skydive_squadspace/version'

Gem::Specification.new do |spec|
  spec.name          = "skydive_squadspace"
  spec.version       = SkydiveSquadspace::VERSION
  spec.authors       = ["Jenna Francis"]
  spec.email         = ["jef399@nyu.edu"]

  spec.summary       = %q{Use SkydiveSquadspace as a platfrom to log jumps that you've made, check out new locations you may want to go, and see what others in the skydiving community are up to.}
  spec.homepage      = "https://github.com/jennafrancis/skydive_squadspace"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
