module Arf
  module Resources
    class Page < Arf::Resource
      include Arf::Representations::HTML
    end
  end
end
