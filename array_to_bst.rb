require './sort'
require './tree'

class Array
  def to_bst
    self.quick_sort.to_tree
  end

  def to_tree
    return TreeNode.new(self[0]) if self.length == 1
    return nil if self.length == 0
    middle_index = self.length / 2
    root = TreeNode.new(self[middle_index])
    root.left = self[0...middle_index].to_tree
    root.right = self[(middle_index+1)...self.length].to_tree
    root
  end
end

print_tree [11,4,1,8,7,0,9,6,2,5,3,10].to_bst