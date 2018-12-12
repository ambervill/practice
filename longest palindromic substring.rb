def length_of_longest_pal_substring(str)
  str.length.downto(1) do |len|
    (0..(str.length - len)).each do |start|
      if str[start, len].pal?
        return str[start, len]
      end
    end
  end
  ""
end

class String
  def pal?
    self == self.reverse
  end
end

puts length_of_longest_pal_substring("sabcbd")