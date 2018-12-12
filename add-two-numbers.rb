class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end


l1 = ListNode.new(2)
l1.next = ListNode.new(9)
l1.next.next = ListNode.new(9)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)

def add_two_numbers(l1, l2)
  res = ListNode.new(nil)
  res_pointer = res
  mem = 0

  while l1 != nil || l2 != nil
    if l1.val + l2.val + mem > 9
      res_pointer.next = ListNode.new((l1.val + l2.val + mem) % 10)
      mem = (l1.val + l2.val) / 10
    else
      res_pointer.next = ListNode.new(l1.val + l2.val + mem)
      mem = 0
    end
    res_pointer = res_pointer.next
    l1 = l1.next
    l2 = l2.next
  end
  if mem > 0
    res_pointer.next = ListNode.new(mem)
  end
  res
end

result = add_two_numbers(l1, l2)
while result != nil
  puts result.val
  result = result.next
end