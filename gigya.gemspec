lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gigya/version'

Gem::Specification.new do |gem|
  gem.name          = "gigya"
  gem.version       = Gigya::VERSION
  gem.authors       = ["Johalf Farina", "Otto Henrique"]
  gem.email         = ["johalffarina@gmail.com", "ottohenrique@gmail.com"]
  gem.summary       = %q{A lightweight library to social integration using Gigya's REST API service.}
  gem.description   = %q{Gigya's gem is a lightweight library to connect for multiple social networks using Gigya's REST API. It allows read/write access REST API, as well as support for OAuth.}
  gem.homepage      = "http://johalf.github.io/gigya"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "faraday"
  gem.add_runtime_dependency "faraday_middleware"
end
