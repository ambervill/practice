class Array
  def bubble_sort!
    sorted = false
    while !sorted
      unsorted_flag = false
      (0..self.length - 2).each do |current_index|
        if self[current_index] > self[current_index + 1]
          self[current_index], self[current_index + 1] = self[current_index + 1], self[current_index]
          unsorted_flag = true
        end
      end
      sorted = !unsorted_flag
    end
    self
  end

  def bubble_sort2!
    (0..self.length).each do |i|
      (0..self.length - i - 2).each do |current_index|
        if self[current_index] > self[current_index + 1]
          self[current_index], self[current_index + 1] = self[current_index + 1], self[current_index]
        end
      end
    end
    self
  end

  def merge_sort
    length = self.length
    if length == 1
      return self
    elsif length.even?
      middle_index = self.length / 2 - 1
    elsif length.odd?
      middle_index = self.length / 2
    end
    first_half = self[0..middle_index]
    second_half = self[(middle_index+1)..(length - 1)]
    first_half = first_half.merge_sort
    second_half = second_half.merge_sort
    Array.merge_sorted_arrays(first_half, second_half)
  end

  def self.merge_sorted_arrays(first_half, second_half)
    res = []
    i = 0
    j = 0
    while i <= first_half.length - 1 && j <= second_half.length - 1
      if first_half[i] <= second_half[j]
        res << first_half[i]
        i += 1
      elsif first_half[i] > second_half[j]
        res << second_half[j]
        j += 1
      end
    end
    if i < first_half.length
      res += first_half[(i)..(first_half.length - 1)]
    end
    if j < second_half.length
      res += second_half[(j)..(second_half.length - 1)]
    end
    res
  end

  def quick_sort
    if self.length <= 1
      return self
    end
    pivot = self.pop
    left_part = self.select { |elem| elem < pivot }
    right_part = self.select { |elem| elem >= pivot }
    left_part.quick_sort + [pivot] + right_part.quick_sort
  end

  def insertion_sort
    ret = self.dup
    length = self.length
    (1..(length - 1)).each do |curr_index|
      if ret[curr_index] < ret[curr_index - 1]
        new_index = 0
        (0...curr_index).each do |i|
          if ret[i] > ret[curr_index]
            new_index = i
            break
          end
        end
        if new_index > 0
          ret = ret[0...(new_index)] + [ret[curr_index]] + ret[(new_index)...(curr_index)] + ret[(curr_index + 1)...length]
        else
          ret = [ret[curr_index]] + ret[(new_index)...(curr_index)] + ret[(curr_index + 1)...length]
        end
      end
    end
    ret
  end

  def recursive_insertion_sort
    ret = self.dup
    length = ret.length
    if length <= 1
      return ret
    end
    ret = ret[0..(length - 2)].recursive_insertion_sort + [ret[length - 1]]
    new_index = -1
    (0..(length - 2)).each do |i|
      if ret[i] > ret[length - 1]
        new_index = i
        break
      end
    end
    if new_index == -1
      # no changes
    elsif new_index > 0
      ret = ret[0..(new_index - 1)] + [ret[length - 1]] + ret[(new_index)..(length - 2)]
    else
      ret = [ret[length - 1]] + ret[0..(length - 2)]
    end
    ret
  end
end


# x = [2, 3, 5, 2, 8, 2, 1, -8]
# puts x.merge_sort
# x = [2, 3, 5, 2, 8, 2, 1, -8]
# puts x.bubble_sort2!
# x = [2, 3, 5, 2, 8, 2, 1, -8]
# puts x.bubble_sort!
# x = [2, 3, 5, 2, 8, 2, 1, 4]
# puts x.quick_sort
# x = [2, 3, 5, 2, 8, 2, 1, 4]
# puts x.recursive_insertion_sort
# x = [2, 3, 5, 2, 8, 2, 1, 4]
# puts x.insertion_sort

