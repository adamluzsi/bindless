require "bindless"

class Test

  def self.hello_world
    puts "hello world!"
  end

  def self.test_call proc_obj
    proc_obj.call_with_binding(self.binding?)
  end

end

#> "hello world!"

Test.test_call Proc.new { self.hello_world }
Test.test_call lambda   { self.hello_world }
Test.test_call ->       { self.hello_world }