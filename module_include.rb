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

  # def self.included(base)
  #   base.extend ClassMethods
  #   # base.class_eval do
  #   #   scope :disabled, -> { where(disabled: true) }
  #   # end
  # end

  # module ClassMethods
  #   def third
  #     puts "third"
  #   end
  #
  #   def fourth
  #     puts "fourth"
  #   end
  # end

end

class A
  include B
end

a = A.new
a.second
# A.third
a.third
# puts A.instance_methods
