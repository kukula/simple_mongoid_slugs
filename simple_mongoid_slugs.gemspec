$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_mongoid_slugs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_mongoid_slugs"
  s.version     = SimpleMongoidSlugs::VERSION
  s.authors     = ["Anatoliy Kukul"]
  s.email       = ["anatolkukula@gmail.com"]
  s.homepage    = "https://github.com/anatoliku/simple_mongoid_slugs"
  s.summary     = "Simple slugs functionality for Mongoid documents"
  s.description = "Simple methods to add slug field for your model and populate it"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "mongoid", "~> 3.0.1"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "mongoid-rspec"
end
