$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../', 'api'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require_relative './boot'

Dir[File.join(File.dirname(__FILE__), '../api/**/*.rb')].sort.each do |file|
  require file
end
