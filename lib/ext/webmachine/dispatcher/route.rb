module Webmachine
  module Dispatcher
    class Route
      def generate(values={})
        url_parts = @path_spec.map do |segment|
          if segment.is_a? Symbol
            values[segment] or raise("Invalid URL Generation (missing value for #{segment})")
          else
            segment
          end
        end
        
        "/" + url_parts.join("/")
      end
    end
  end
end
