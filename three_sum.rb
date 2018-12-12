
def three_sum(arr)
  arr.uniq!.sort!
  output = []
  (0..arr.length - 3).each do |i|
    j = i + 1
    k = arr.length - 1
    while j < k
      cur = arr[i] + arr[j] + arr[k]
      puts cur
      if cur == 0
        output << "#{arr[i]}, #{arr[j]}, #{arr[k]}"
        j += 1
        k -= 1
      elsif cur < 0
        j += 1
      elsif cur > 0
        k -= 1
      end
    end
  end

  output
end

arr = [-1, 0, 1, 2, -1, -4, -3, -5, -2, 3]
puts three_sum(arr)