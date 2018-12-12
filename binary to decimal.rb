class String
  def to_decimal
    result = 0
    self.reverse.each_char.with_index(0) do |char, i|
      if char == "1"
        result += 2 ** i
      end
    end
    result
  end
end

puts "0010".to_decimal

require 'rspec/autorun'
RSpec.describe "test" do
  it "should pass" do
    expect("101001".to_decimal).to eq(41)
  end
end