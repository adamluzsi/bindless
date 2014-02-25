require_relative "../lib/bindless"

test_proc= Proc.new{
  self.hello_world
}

class Test

  def self.hello_world
    puts "hello world!"
  end

  def self.test_call proc_obj
    proc_obj.call_with_binding(self.binding?)
  end

end

Test.test_call test_proc
#> "hello world!"