require "./test/test_helper"

describe Arf::Resource do
  before do
    @request = MiniTest::Mock.new
    @response = MiniTest::Mock.new
    @resource = Arf::Resource.new(@request, @response)
  end
  
  after do
    @request.verify
    @response.verify
  end
  
  it "exposes request.path_info as params" do
    @request.expect :path_info, {}
    @resource.params
  end
  
  it "has a class variable for content_types_provided" do
    class Provider < Arf::Resource
    end
    
    fake_type = ["fake/type", :fake_it]
    Provider.content_types_provided.must_equal []
    Provider.provides_content_type fake_type[0], fake_type[1]
    Provider.content_types_provided.must_equal [fake_type]
    
    Arf::Resource.content_types_provided.must_equal []
  end
end
