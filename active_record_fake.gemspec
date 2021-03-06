# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_record_fake/version"

Gem::Specification.new do |s|
  s.name        = "active_record_fake"
  s.version     = ActiveRecordFake::VERSION
  s.authors     = ["Colin Gemmell"]
  s.email       = ["pythonandchips@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Fake object for using when you do not want to use a real one with associations}
  s.description = %q{Fake object for using when you do not want to use a real one with associations}

  s.rubyforge_project = "active_record_fake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
