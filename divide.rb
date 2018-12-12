def divide(dividend, divisor)
  res = 0
  while dividend >= divisor
    dividend -= divisor
    res += 1
  end
  return res, dividend
end

a = 15
b = 3
puts divide(a, b)
puts a
puts b

require 'rspec/autorun'
RSpec.describe "test" do
  it "should pass" do
    expect(divide(14, 3)).to eq([4, 2])
  end
end




