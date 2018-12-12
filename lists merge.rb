# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    res = ListNode.new(nil)
    res_pointer = res
    while l1 != nil || l2 != nil
        if l1.nil?
            curr = l2.val
        elsif l2.nil?
            curr = l1.val
        else
            curr = [l1.val, l2.val].min
        end
        while l1 != nil && curr == l1.val
            res_pointer.next = ListNode.new(curr)
            res_pointer = res_pointer.next
            l1 = l1.next
        end
        while l2 != nil && curr == l2.val
            res_pointer.next = ListNode.new(curr)
            res_pointer = res_pointer.next
            l2 = l2.next
        end
    end
    res
end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)
l1.next.next = ListNode.new(4)
l1.next.next.next = ListNode.new(5)

l2 = ListNode.new(1)
l2.next = ListNode.new(3)
l2.next.next = ListNode.new(4)

result = merge_two_lists(l1, l2)
while result != nil
    puts result.val
    result = result.next
end
