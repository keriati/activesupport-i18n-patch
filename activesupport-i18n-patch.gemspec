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
  s.summary     = %q{Monkey patch rails to trigger I18n setup before any eager loading}
  s.description = %q{Currently rails will load all model classes if config.cache_classes is set to true.
    It does so by calling eager_load hooks. At this point, the I18n railtie after_initialize hook 
    (which sets up the i18n load path) hasn't been run which means that, any translations done at the class
    level of a record are missing. (This was causing failing cukes in our case)

    The fix is to move the I18n.load_path setup to before any eager loading is done
  }

  s.rubyforge_project = "activesupport-i18n-patch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
