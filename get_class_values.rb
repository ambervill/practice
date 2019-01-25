class A
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end
  @a = 1
  @@a = 2
  a = 3
end


puts A.instance_variable_get(:@a)
puts A.class_variable_get(:@@a)
class A
  puts local_variables
end
puts A.send(:local_variables)
# aa = A.new
# puts aa.instance_variable_get(:@a)
# puts A.class_variable_get(:@@a)
# puts aa.send(:local_variables)