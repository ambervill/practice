require './cube'

cube = Cube.new
distribution = {}
200.times do
  counter = 0
  algorithm = Algorithm.generate(2)
  # puts algorithm
  begin
    cube.algorithm algorithm
    counter += 1
  end while !cube.solved?
  distribution[counter] ||= 0
  distribution[counter] += 1
end
# puts cube
# puts cube.solved?
puts distribution
puts distribution.keys.sort