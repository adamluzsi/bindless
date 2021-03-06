module Bindless

  module EXT
    module Proc

      def call_with_binding(bind, *args)
        ::Bindless::Model.new([bind]).run_proc(self, *args)
      end

      def call_with_obj(obj, *args)
        m = nil
        p = self
        ::Object.class_eval do
          define_method :a_temp_method_name, &p
          m = instance_method :a_temp_method_name
          remove_method :a_temp_method_name
        end
        m.bind(obj).call(*args)
      end

    end
  end

end

Proc.__send__ :include, Bindless::EXT::Proc