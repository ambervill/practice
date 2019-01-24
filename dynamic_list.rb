class ListNode
  include Comparable
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

  def <=>(other_node)
    self.val <=> other_node.val
  end

  def to_s
    self.val.to_s
  end
end

class DynamicList
  include Enumerable
  attr_accessor :current
  @head = nil

  def initialize(*elements)
    elements.each.with_index(0) do |element, i|
      new_node = ListNode.new(element)
      if i == 0
        @head = new_node
        @current = new_node
      else
        @current.next = new_node
        @current = @current.next
      end
    end
  end

  def add(new_node)
    reset!
    if @current == nil
      @head = new_node
      @current = new_node
    else
      while @current != nil && @current.next != nil
        @current = @current.next
      end
      @current.next = new_node
    end
  end

  def add_value(new_value)
    add ListNode.new(new_value)
  end
  alias << add_value

  def prepend(new_node)
    reset!
    new_node.next = @current
    @head = new_node
  end

  def prepend_value(new_value)
    prepend ListNode.new(new_value)
  end
  alias >> prepend_value

  def reset!
    @current = @head
  end

  def reverse!
    return self if self.length <= 1
    reset!
    prev_node = nil
    current_node = @head
    next_node = nil

    while current_node != nil
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    @head = prev_node
    self
  end

  def merge_sort
    left_half, right_half = self.split
    left_half = left_half.merge_sort if left_half.length > 1
    right_half = right_half.merge_sort if right_half.length > 1
    DynamicList.merge_sorted_lists(left_half, right_half)
  end

  def split
    reset!
    fast = @head
    left_half = DynamicList.new
    right_half = DynamicList.new
    while fast != nil && fast.next != nil && fast.next.next != nil
      left_half.add_value @current.val
      @current = @current.next
      fast = fast.next.next
    end
    left_half.add_value @current.val if @current != nil
    while @current != nil && @current.next != nil
      @current = @current.next
      right_half.add_value @current.val
    end
    return left_half, right_half
  end

  def length
    reset!
    i = 0
    while @current != nil
      @current = @current.next
      i += 1
    end
    i
  end

  def each
    reset!
    while @current != nil
      yield @current if block_given?
      @current = @current.next
    end
    nil
  end

  def to_s
    self.to_a.join(", ")
  end

  class << self
    def merge_sorted_lists(list1, list2)
      list1.reset!
      list2.reset!
      res = new
      while list1.current != nil && list2.current != nil
        if list1.current <= list2.current
          res.add_value list1.current.val
          list1.current = list1.current.next
        else
          res.add_value list2.current.val
          list2.current = list2.current.next
        end
      end
      while list1.current != nil
        res.add_value list1.current.val
        list1.current = list1.current.next
      end
      while list2.current != nil
        res.add_value list2.current.val
        list2.current = list2.current.next
      end
      res
    end
  end

end

# DynamicList.new([9,8,7,6,5,4]).merge_sort.each do |elem|
#   puts elem.val
# end

x = DynamicList.new(9,8,7,6,5,4).merge_sort
x << 32
x >> 2
puts x
puts x.reverse!

require 'rspec/autorun'
RSpec.describe "test" do
  subject{ DynamicList.new(9,8,7,6,5,4).reverse!.to_s}
  it "should pass" do
    expect(subject).to eq("4, 5, 6, 7, 8, 9")
  end
end