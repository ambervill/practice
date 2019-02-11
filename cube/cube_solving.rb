require './cube'

cube = Cube.new
algorithm = "l d f d b u di fi di" #Algorithm.generate(9)
# puts algorithm
cube << algorithm
puts cube
puts "_____________________________"
# cube.turn :radial, :counterclockwise
# cube.turn :radial, :clockwise
# cube.turn :radial, :clockwise
# cube.turn :radial, :clockwise
# puts cube
cube << "li"
puts cube
# puts cube[:f].color
