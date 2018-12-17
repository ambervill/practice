class Array
  def trapped_water
    water = 0
    max_height = self.max
    max_height.downto(1).each do |current_height|
      current_bars = self.map{|bar| bar >= current_height ? 1 : nil}
      current_bars_length = current_bars.compact.length
      if current_bars_length >= 2
        water += current_bars.rindex(1) - current_bars.index(1) - current_bars_length + 1
      end
    end
    water
  end
end

puts [3, 0, 0, 2, 0, 4].trapped_water
puts [2, 0, 3, 1, 2, 0, 4, 0, 1, 1, 2].trapped_water
puts [1, 4, 0, 3, 0, 2, 0, 1, 0, 2].trapped_water