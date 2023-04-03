ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

require 'yaml'
YAML::ENGINE.yamler = 'syck' if defined?(YAML::ENGINE)
YAML.load_file(File.expand_path('../database.yml', __FILE__), aliases: true)
