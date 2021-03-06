# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cdc_notices/version'

Gem::Specification.new do |spec|
  spec.name          = "cdc_notices"
  spec.version       = CdcNotices::VERSION
  spec.authors       = ["tahbristol"]
  spec.email         = ["tahbristol@gmail.com"]

  spec.summary       = "Displays currrent infectious disease travel notices from the Centers for Disease Control."#%q{TODO: Write a short summary, because Rubygems requires one.}
#  spec.description   = %q{TODO: Write a longer description or delete this line.}
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "rubysl-open-uri"
  spec.add_development_dependency "launchy"

#  spec.add_development_dependency "openssl", "~> 2.0.3"
end
