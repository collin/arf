# Copyright (c) 2004-2011 David Heinemeier Hansson
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


require 'i18n/exceptions'

module I18n
  class ExceptionHandler
    include Module.new {
      def call(exception, locale, key, options)
        exception.is_a?(MissingTranslation) && options[:rescue_format] == :html ? super.html_safe : super
      end
    }
  end
end

module Arf
  module Helpers
    module TranslationHelper
      def translate(key, options = {})
        options.merge!(:rescue_format => :html) unless options.key?(:rescue_format)
        translation = I18n.translate(scope_key_by_resource(key), html_safe_options)
      end
      alias :t :translate
      
      # Delegates to <tt>I18n.localize</tt> with no additional functionality.
      def localize(*args)
        I18n.localize(*args)
      end
      alias :l :localize
      
      private
        def scope_key_by_resource(key)
          if key.to_s.first == "."
            self.class.name.split("::").join(".").downcase + "." + key.to_s
          else
            key
          end
        end
      
        def html_safe_translation_key?(key)
          key.to_s =~ /(\b|_|\.)html$/
        end
    end
  end
end