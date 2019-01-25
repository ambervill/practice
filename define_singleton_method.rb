animal = 'dog'
# Ways to define singleton speak() method

# 1. def animal.speak
def animal.speak
  puts 'Dog says Woof!'
end

# 2. singleton class
class << animal
  def speak
    puts 'Dog says Woof!'
  end
end

# 3. define_method
class << animal
  define_method(:speak) do
    puts 'Dog says Woof!'
  end
end

# 4. instance_eval
animal.instance_eval do
  def speak
    puts 'Dog says Woof!'
  end
end

# 5. module, extend
module Speak
    def speak
      puts 'Dog says Woof!'
    end
end
animal.extend Speak

# 6. module, include
module Speak
    def speak
      puts 'Dog says Woof!'
    end
end
class << animal
  include Speak
end

animal.speak

# 7. send, lambda
animal.singleton_class.send(:define_method, :speak, lambda{puts 'Dog says Woof!'} )
animal.speak
