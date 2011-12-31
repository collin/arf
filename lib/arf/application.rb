require "active_support/all"

require "arf/representations/html"

require "arf/resource"
require "arf/resources/collection"
require "arf/resources/instance"
require "arf/resources/page"

require "webmachine"

require "ext/webmachine/dispatcher/route"
require "ext/webmachine/url_generator"


module Arf
  class Application
    attr_accessor :router
    def initialize
      self.router = Webmachine::URLGenerator.new(Webmachine::Dispatcher)
      ::Arf::Resource.send :include, router.url_writer
    end
    
    def run
      Webmachine.run
    end
  end
end