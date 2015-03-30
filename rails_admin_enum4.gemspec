$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_enum4/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_enum4"
  s.version     = RailsAdminEnum4::VERSION
  s.authors     = ["Nikolay Moskvin"]
  s.email       = ["moskvin@sibext.com"]
  s.homepage    = "https://github.com/sibext/rails_admin_enum4"
  s.summary     = "Enum from Rails 4 field for rails admin"
  s.description = "Makes enum field from ActiveRecord::Enum more easy use"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.1"
end
