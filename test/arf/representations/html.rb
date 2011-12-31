require "./test/test_helper"

class HTMLResource < Arf::Resource
  include Arf::Representations::HTML
end

HTML = "<!DOCTYPE html><html><head><title>Html Resource</title></head><body><p>This page unintentionally left blank.</p></body></html>"

describe Arf::Representations::HTML do
  before do
    @request = MiniTest::Mock.new
    @response = MiniTest::Mock.new
    @resource = HTMLResource.new(@request, @response)
  end
  
  it "added html to content types" do
    HTMLResource.content_types_provided.must_equal [["text/html", :html_content]]
  end
  
  it "makes html" do
    @resource.html_content.must_equal HTML
  end
  
end
