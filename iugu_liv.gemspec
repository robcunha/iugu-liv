# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "iugu_liv/version"

Gem::Specification.new do |spec|
  spec.name          = "iugu_liv"
  spec.version       = IuguLiv::VERSION
  spec.authors       = ["RobertozsCunha"]
  spec.email         = ["robertocunha@poli.ufrj.br"]

  spec.summary       = %q{TODO: Gem que possibilita uma melhor integração com o meio de pagamento Iugu.}
  spec.description   = %q{TODO: Essa Gem foi desenvolvida pela equipe de desenvolvimento da LIVIMA e tem por objetivo ajudar na integração com o sistema de pagamentos online Iugu.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
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

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
