require "./test/test_helper"

describe Arf::Application do
  it "includes a router in Arf::Resource" do
    app = Arf::Application.new
    Arf::Resource.ancestors.must_include app.router.url_writer
  end
  
  it "runs" do
    Webmachine::Adapters::Mock.expect :run, nil
    app = Arf::Application.new
    app.run
    Webmachine::Adapters::Mock.verify
  end
end