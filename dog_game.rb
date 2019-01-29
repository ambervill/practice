# http://ruby-metaprogramming.rubylearning.com/
class Dog
  MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}
  def initialize(name)
    @name = name
  end
  def can(*skills, &block)
    skills.each do |skill|
      define_singleton_method skill do
        if block_given?
          block.call(@name)
        else
          "#{@name} #{MSGS[skill]}"
        end
      end
    end
  end
  def method_missing(_method, *args, &block)
    "#{@name} doesn't understand #{_method}"
  end
end

lassie, fido, stimpy = %w[Lassie Fido Stimpy].collect{|name| Dog.new(name)}
lassie.can :dance, :poo, :laugh
fido.can(:poo){|name| "#{name} is smelly."}
stimpy.can(:cry){|name| "#{name} cried AHHHH"}

p lassie.dance
p lassie.poo
p lassie.laugh
puts
p fido.dance
p fido.poo
p fido.laugh
puts
p stimpy.dance
p stimpy.poo
p stimpy.laugh
p stimpy.cry