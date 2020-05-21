$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../app/api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../app/models'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../app/services'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

Dir[File.join(File.dirname(__FILE__), '../app/**/*.rb')].sort.each do |file|
  require file
end
