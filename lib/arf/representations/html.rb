require "arf/markup"

require "action_view/helpers/number_helper"
require "action_view/helpers/sanitize_helper"
# require "action_view/helpers/date_helper"
require "action_view/helpers/debug_helper"

require "arf/helpers/text_helper"
require "arf/helpers/translation_helper"
require "arf/helpers/url_helper"

module Arf
  module Representations
    module HTML
      MIME = "text/html".freeze
      
      extend ActiveSupport::Concern
      
      included do
        provides_content_type MIME, :html_content
      end
      
      include Mab
      include Arf::Helpers::TranslationHelper
      include ActionView::Helpers::NumberHelper
      include ActionView::Helpers::TextHelper
      # include ActionView::Helpers::DateHelper
      include ActionView::Helpers::DebugHelper
      
      def html_content
        mab do
          doctype
          html do
            head { head_content }
            body { body_content }
          end
        end
      end
    
      def head_content
        title { page_title }
        assets
      end
    
      def assets
      end

      def doctype
        text { "<!DOCTYPE html>" }
      end
    
      def body_content
        p "This page unintentionally left blank."
      end
  
      def page_title
        self.class.name.titlecase
      end
  
    end
  end
end
