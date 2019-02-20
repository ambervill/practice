require './stack'
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  is_mirror(root.left, root.right)
end

def is_mirror(left, right)
  return true if left.nil? && right.nil?
  return false if left.nil? && !right.nil? || !left.nil? && right.nil?
  (left.val == right.val) && is_mirror(left.left, right.right) && is_mirror(left.right, right.left)
end

def print_tree(root, depth = 0, left = 0, right = 0)
  puts "  " * depth + "-" * right + root.val.to_s + "-" * left
  if root.left
    print_tree(root.left, depth + 1, 1, 0)
  end
  if root.right
    print_tree(root.right, depth + 1, 0, 1)
  end
end

def inorder(node)
  if node.left != nil
    inorder(node.left)
  end
  puts node.val
  if node.right != nil
    inorder(node.right)
  end
end

def preorder(node)
  puts node.val
  if node.left != nil
    preorder(node.left)
  end
  if node.right != nil
    preorder(node.right)
  end
end

def print_no_recursive(root)
  stack = Stack.new
  stack.insert!({el: root, left_printed: false, right_printed: false})
  puts stack.top[:el].val
  while !stack.empty?
    if stack.top[:el].left != nil && !stack.top[:left_printed]
      puts "  " * stack.depth + stack.top[:el].left.val.to_s
      stack.top[:left_printed] = true
      stack.insert!({el: stack.top[:el].left, left_printed: false, right_printed: false })
    elsif stack.top[:el].right != nil && !stack.top[:right_printed]
      puts "  " * stack.depth + stack.top[:el].right.val.to_s
      stack.top[:right_printed] = true
      stack.insert!({el: stack.top[:el].right, left_printed: false, right_printed: false})
    else
      stack.pop!
    end
  end
end

# Inorder sequence: D B E A C H F G
# Preorder sequence: A B D E C F H G
# Tree:
#             A
#           /  \
#         /     \
#        B       C
#       / \       \
#     /    \       \
#    D      E       F
#                 /  \
#               H     G
def tree_from_inorder_and_preorder(inorder, preorder)
  if inorder.length != preorder.length
    raise "Error in sequences."
  end
  if preorder.length == 1
    return TreeNode.new(preorder[0])
  end
  if preorder.length == 0
    return nil
  end
  current_root = preorder[0]
  root_index = inorder.index(current_root)
  raise "Error in sequences." unless root_index
  left_inorder = root_index.zero? ? [] : inorder[0..root_index - 1]
  right_inorder = inorder[root_index+1..inorder.length]
  left_preorder = preorder[1..left_inorder.length]
  right_preorder = preorder[left_inorder.length+1..preorder.length]

  root = TreeNode.new(current_root)
  root.left = tree_from_inorder_and_preorder(left_inorder, left_preorder)
  root.right = tree_from_inorder_and_preorder(right_inorder, right_preorder)
  root
end

root = tree_from_inorder_and_preorder(%w(D B E A C H F G), %w(A B D E C F H G))
print_tree root
