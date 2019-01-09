#Given a string, print all permutations of a given string.

class String
    def permutations
      if self.length <= 1
        return [self]
      end
      ret = []
      self.each_char.with_index do |sym, i|
        (self[0...i] + self[i+1..-1]).permutations.each do |permutation|
          ret << sym + permutation
        end
      end
      ret
    end
end

puts "abcd".permutations