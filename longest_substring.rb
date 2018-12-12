
def length_of_longest_substring(s)
  width = 1
  (0...s.length).each do |start|
    break if start + width >= s.length
    next unless s[start, width].uniq?
    if s[start, width].include? s[start + width]
      next
    else
      width += 1
      redo
    end
  end
  width
end

class String
  def uniq?
    self.each_char do |c|
      if self.count(c) > 1
        return false
      end
    end
    true
  end
end

puts length_of_longest_substring("abdeccabd")