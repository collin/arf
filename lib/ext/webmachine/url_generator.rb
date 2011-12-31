module Webmachine
  class URLGenerator
    attr_accessor :url_writer
    
    def initialize(dispatcher)
      @dispatcher = dispatcher
      @named_routes = {}
      @url_writer = Module.new
    end
    
    def map(name, path_spec, resource)
      route = @dispatcher.add_route(path_spec, resource)
      @named_routes[name.to_sym] = route
      @url_writer.send :define_method, "#{name}_path" do |values={}|
        route.generate(values)
      end
      route
    end

  end
end