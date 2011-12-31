$LOAD_PATH << "./"
$LOAD_PATH << "./lib"

require "minitest/spec"
require "minitest/autorun"

require "arf/application"

Webmachine::Adapters::Mock = MiniTest::Mock.new

Webmachine.configure do |config|
  config.adapter = :Mock
end
