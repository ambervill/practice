# Replace adjacent numbers with another number
mt = Array.new([ [0, 0, 1, 0, 1], [0, 1, 1, 0, 1], [0, 0, 1, 1, 0], [1, 0, 0, 0, 1], [1, 0, 0, 0, 1] ])

def mt.substitute(i, j, new_value)
  return if i > self[0].length || j > self.length || i < 0 || j < 0
  old_value = self[i][j]
  self[i][j] = new_value
  self.substitute(i + 1, j,  new_value) if self[i + 1] && self[i + 1][j] == old_value
  self.substitute(i, j + 1,  new_value) if self[i][j + 1] == old_value
  self.substitute(i - 1, j,  new_value) if self[i - 1] && self[i - 1][j] == old_value
  self.substitute(i, j - 1,  new_value) if self[i][j - 1] == old_value
end

mt.substitute(1, 1, 4)
mt.each do |row| row.each do |elem| print elem; print " " end; puts "" end