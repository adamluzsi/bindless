module Bindless

  module EXT
    module Object

      # return the object Binding
      def binding?
        return binding
      end

      alias :get_binding :binding?

    end
  end

end

Object.__send__ :include, Bindless::EXT::Object