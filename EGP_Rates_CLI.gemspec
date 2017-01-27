# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'EGP_Rates_CLI'
  spec.version       = '1.0.1'
  spec.authors       = ['Ahmed Abdel-Razzak']
  spec.email         = ['abdelrazzak.ahmed@gmail.com']

  spec.summary       = 'Show EGP exchange rates in terminal'
  spec.homepage      = 'https://github.com/mad-raz/EGP-Rates-CLI'
  spec.license       = 'MIT'
  spec.required_ruby_version = '~>2.3.0'

  spec.files         = Dir['lib/**/*.rb'] + Dir['spec/**/*']
  spec.executables   = ['egp']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry-byebug'

  spec.add_dependency 'EGP_Rates', '>= 1.0.5'
  spec.add_dependency 'tty-prompt', '~>0.6'
  spec.add_dependency 'tty-command', '~> 0.1'
  spec.add_dependency 'tty-table', '~>0.5'
end
