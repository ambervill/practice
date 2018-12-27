#Given a keypad as shown in diagram, and an N digit number. List all words which are possible by pressing these numbers.

class Dialer
  @symbols = {
     2 => %w(a b c),
     3 => %w(d e f),
     4 => %w(g h i),
     5 => %w(j k l),
     6 => %w(m n o p),
     7 => %w(q r s),
     8 => %w(t u v),
     9 => %w(w x y z),
  }
  class << self
    def words(sequence)
      if sequence.length <= 1
        return @symbols[sequence[0]]
      end
      ret = []
      @symbols[sequence[0]].each do |sym|
        words(sequence[1..-1]).each do |rem|
          ret << sym + rem
        end
      end
      ret
    end
  end
end

puts Dialer.words([2, 3, 9])