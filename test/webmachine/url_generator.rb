require "./test/test_helper"

describe Webmachine::URLGenerator do
  before do
    @dispatcher = MiniTest::Mock.new
    @generator = Webmachine::URLGenerator.new @dispatcher
  end
  
  after do
    @dispatcher.verify
  end
  
  it "adds routes to the dispatcher" do
    @dispatcher.expect :add_route, nil, [["*"], nil]
    @generator.map "route_name", ["*"], nil
  end
  
  it "defines a method on the url_writer" do
    generator = Webmachine::URLGenerator.new Webmachine::Dispatcher
    generator.map "another_route_name", ["*"], Arf::Resource
    generator.url_writer.instance_method(:another_route_name_path).wont_be_nil
  end
end
