
class String
  def to_int
    self.lstrip!
    if self.match /[^0-9-]./
      return 0
    end
    sign = 1
    if self[0] == "-"
      sign = -1
      self.delete! "-"
    end
    len = self.length
    hsh = {"0" => 0, "1" => 1, "2" =>2, "3" =>3, "4" =>4, "5" =>5, "6" =>6, "7" =>7, "8" =>8, "9" =>9 }
    num = 0
    (0...len).each do |index|
      num += 10 ** (len - index - 1) * hsh[self[index]]
    end
    num * sign
  end
end

puts "  348".to_int