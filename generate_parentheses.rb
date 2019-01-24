#Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
# For example, given n = 3, a solution set is:
#
#    [
#       "((()))",
#       "(()())",
#       "(())()",
#       "()(())",
#       "()()()"
#    ]

def generate_parentheses(n)
  if n <= 1
    return ["()"]
  end
  ret = []
  generate_parentheses(n - 1).each do |pair|
    ret << pair + "()"
    ret << "(" + pair + ")"
    ret << "()" + pair
  end
  ret.uniq
end
puts generate_parentheses(3)