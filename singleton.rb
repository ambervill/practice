require 'singleton'
class A
  include Singleton
end

x = A.instance
y = A.instance
puts x == y