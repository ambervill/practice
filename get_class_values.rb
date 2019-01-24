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

define_method :dd, Proc.new {puts "defined"}
dd

# puts A.instance_variable_get(:@a)
# puts A.class_variable_get(:@@a)
# A.instance_eval do
#   puts a
# end
# # puts A.class_eval("a")
# aa = A.new
# puts aa.instance_variable_get(:@a)
# puts A.class_variable_get(:@@a)
# puts aa.instance_eval("a")