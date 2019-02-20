require 'active_support/concern'
module B
  extend ActiveSupport::Concern

  def first
    puts "first"
  end

  def second
    puts "second"
  end

  class_methods do
    def third
      puts "third"
    end

    def fourth
      puts "fourth"
    end
  end

end

class A
  include B
end

a = A.new
a.second

a.third

