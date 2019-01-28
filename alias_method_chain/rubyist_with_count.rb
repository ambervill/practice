require './rubyist'
require './aliasing'

class Rubyist
  extend RubyLearning::Aliasing

  def say_with_count!
    puts "Satish(#{@count}) starts greeting"
    say_without_count!
    puts "Satish(#{@count}) finished greeting"
    @count += 1
  end

  alias_method_chain(:count, :say!) do |feature, excl|
    puts "alias_method_chain:"
    puts "feature = #{feature}"
    puts "excl = #{excl}"
  end

end