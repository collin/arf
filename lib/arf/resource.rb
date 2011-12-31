require "webmachine"
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/class/attribute"

module Arf
  class Resource < Webmachine::Resource
    class_attribute :content_types_provided
    self.content_types_provided = []
    delegate :content_types_provided, to: "self.class"
    
    def self.provides_content_type mime, method
      self.content_types_provided += [[mime, method]]
    end
    
    def params 
      request.path_info
    end
    
  end
end