module Arf
  module Resources
    class Instance < Arf::Resource
      def instance
        nil
      end
      
      def resource_exists?
        !!instance
      end
    end
  end
end
