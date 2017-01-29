# frozen_string_literal: true
Gem::Specification.new do |spec|
  spec.name          = 'serving_seconds'
  spec.version       = '0.0.1'
  spec.authors       = ['Travis Herrick']
  spec.email         = ['tthetoad@gmail.com']
  spec.summary       = 'Serves up seconds in human-readable forms'
  spec.description   = '
    A light-weight library to convert seconds to human-readable forms
  '.strip
  spec.homepage      = 'http://www.bitbucket.org/ToadJamb/gems_serving_seconds'
  spec.license       = 'LGPLV3'

  spec.files         = Dir['lib/**/*.rb', 'license/*']

  spec.extra_rdoc_files << 'readme.md'

  spec.add_development_dependency 'rake_tasks'
  spec.add_development_dependency 'gems'
  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'travis-yaml'
  spec.add_development_dependency 'wwtd'
end
