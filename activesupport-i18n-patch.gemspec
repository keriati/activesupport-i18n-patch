# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "activesupport-i18n-patch/version"

Gem::Specification.new do |s|
  s.name        = "activesupport-i18n-patch"
  s.version     = Activesupport::I18n::Patch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Saimon Moore"]
  s.email       = ["saimonmoore@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Monkey patch rails to trigger I18n setup via an after configuration hook}
  s.description = %q{Monkey patch rails to trigger I18n setup via an after configuration hook}

  s.rubyforge_project = "activesupport-i18n-patch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
