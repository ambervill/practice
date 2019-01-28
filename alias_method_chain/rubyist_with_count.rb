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

  alias_method_chain(:count, :say!) do |feature, target, feature_with_target_name|
    puts "alias_method_chain: #{feature} with #{target} changed to #{feature_with_target_name}"
  end

end