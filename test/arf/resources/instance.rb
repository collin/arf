require "./test/test_helper"

describe Arf::Resources::Instance do
  before do
    @request = MiniTest::Mock.new
    @response = MiniTest::Mock.new
    @instance = Arf::Resources::Instance.new(@request, @response)
  end
  
  it "has a nil instance" do
    @instance.instance.must_be_nil
  end
  
  it "does not exist" do
    @instance.resource_exists?.must_equal false
  end
  
  it "exists if instance is defined" do
    def @instance.instance
      true
    end
    
    @instance.resource_exists?.must_equal true
  end

end
