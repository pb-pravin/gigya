require 'bundler/setup'
Bundler.setup

require 'gigya'

spec_root = File.expand_path(File.dirname(__FILE__))

$: << spec_root

Dir[File.join(spec_root, "support/**/*.rb")].each { |f| require f }
