# Define the following class without class MaskedString, def tr_vowel and def self.tr_vowel
# class MaskedString < String
#   def tr_vowel
#     tr 'aeiou', '*'
#   end
#   def self.tr_vowel(str)
#     str.tr 'aeiou', '*'
#   end
# end
#
# d = MaskedString.new("abcd")
# puts d.tr_vowel


# 1. instance_eval, class_eval, define_method
# String.class_eval do
#   define_method :tr_vowel do
#     tr 'aeiou', '*'
#   end
# end
# class << String
#   instance_eval do
#     define_method :tr_vowel2 do |str|
#       str.tr 'aeiou', '*'
#     end
#   end
# end
# puts "abcd".tr_vowel
# puts String.tr_vowel2("efgh")

# 2. module, extend, extended
module TrWovel
  def self.extended(base)
    base.class_eval do
      include InstanceMethods
    end
  end
  def tr_vowel2(str)
     str.tr 'aeiou', '*'
  end
  module InstanceMethods
    def tr_vowel
      tr 'aeiou', '*'
    end
  end
end
class String
  extend TrWovel
end
puts "abcd".tr_vowel
puts String.tr_vowel2("efgh")


# 3. module, include, included
# module TrWovel
#   def self.included(base)
#     base.extend ClassMethods
#   end
#   def tr_vowel
#     tr 'aeiou', '*'
#   end
#   module ClassMethods
#     define_method :tr_vowel2 do |str|
#       str.tr 'aeiou', '*'
#     end
#   end
# end
# class String
#   include TrWovel
# end
# puts "abcd".tr_vowel
# puts String.tr_vowel2("efgh")