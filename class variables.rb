class Test
  ABC = 2
  @var = ABC + 2
  @@classvar = 9
  class << self
    @var = 5
    def puts_var
      puts @var || "No @var"
      puts singleton_class.instance_variable_get(:@var) || "No singleton_class.@var"
      puts @@classvar
      puts ABC
    end
  end

  def get_var
    # @var = 6
    puts @var || "No @var"
    puts @@classvar
    puts ABC
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

ChildTest.puts_var
ChildTest.new.get_var