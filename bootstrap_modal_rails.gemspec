# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap_modal_rails/version'

Gem::Specification.new do |gem|
  gem.name          = "bootstrap_modal_rails"
  gem.version       = BootstrapModalRails::VERSION
  gem.authors       = ["Chris McKnight", "Jordan Schroter"]
  gem.email         = ["cmcknight@immense.net", "jschr"]
  gem.description   = %q{Gem to include bootstrap-modal extension in Rails}
  gem.summary       = %q{Extends the default Bootstrap Modal class. Responsive, stackable, ajax and more.}
  gem.homepage      = "http://jschr.github.com/bootstrap-modal/"

  gem.files = Dir["{lib,vendor}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "railties", "~> 3.1"
end
