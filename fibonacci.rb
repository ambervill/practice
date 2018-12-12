def fib(n)
  if n == 1
    return [1]
  elsif n == 2
    return [1,1]
  else
    ret = [1,1]
    (2..(n - 1)).each do |cur|
      ret << ret[cur - 1] + ret[cur - 2]
    end
    return ret
  end
end

def fib_recursive(n)
  if n <= 1
    return 1
  end
  fib_recursive(n - 1) + fib_recursive(n - 2)
end

# puts fib(10)
puts fib_recursive(10)




