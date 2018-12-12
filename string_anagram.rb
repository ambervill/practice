class String
  def anagram?(other_str)
    self.chars.sort == other_str.chars.sort
  end
end

puts "aebdx".anagram? "bedax"
