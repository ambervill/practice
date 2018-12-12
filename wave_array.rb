require './sort'
require './tree'

class Array
  def waved
    ret = []
    sorted = self.merge_sort
    (0..(self.length / 2 - 1)).each do |i|
      ret << sorted[i] << sorted[i + self.length / 2]
    end
    ret
  end
end

puts [11,4,1,8,7,0,9,6,2,5,3,10].waved