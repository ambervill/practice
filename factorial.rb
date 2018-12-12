def factorial_recursive(n)
  if n == 1 || n == 0
    return 1
  end
  n * factorial_recursive(n - 1)
end

def factorial(n)
  res = 1
  (1..n).each do |curr|
    res *= curr
  end
  res
end

def factorial_inject(n)
  (1..n).to_a.inject(1) { |sum, curr|  sum * curr }
end

puts factorial_recursive(24)
puts factorial(4)
puts factorial_inject(4)
