class Test
  ABC = 2
  @var = ABC + 2
  @@classvar = 9
  class << self
    @var = 5
    def puts_var
      puts "@var=#@var" || "No @var"
      puts "singleton_class.instance_variable_get(:@var)=#{ singleton_class.instance_variable_get(:@var)}" || "No singleton_class.@var"
      puts "puts_var.@@classvar=#@@classvar"
      puts "ABC=#{ABC}"
    end
  end

  def get_var
    puts "get_var.@var=#@var" || "No @var"
    puts "get_var.@@classvar=#@@classvar"
    puts "get_var.ABC=#{ABC}"
  end

  def puts_module_var
    puts "puts_module_var.@module_var=#@module_var"
    puts "puts_module_var.@var=#@var"
  end
end

Test.puts_var
Test.new.get_var

puts

class ChildTest < Test
  def initialize
    @var = 7
  end
end
puts "child_test"
ChildTest.puts_var
ChildTest.new.get_var

puts
puts "module test"
module TestModule
  @module_var = 11
  puts "TestModule.@module_var=#@module_var"
  def self.module_puts_module_var
    puts "module_puts_module_var.@module_var=#@module_var"
  end
  def get_var
    puts "get_var in module"
  end
end
class Test
  include TestModule
end
Test.new.puts_module_var
TestModule.module_puts_module_var
Test.new.get_var