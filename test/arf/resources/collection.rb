require "./test/test_helper"

describe Arf::Resources::Instance do
  before do
    @request = MiniTest::Mock.new
    @response = MiniTest::Mock.new
    @collection = Arf::Resources::Collection.new(@request, @response)
  end
  
  it "has an empty collection" do
    @collection.collection.empty?.must_equal true
  end
  
end
