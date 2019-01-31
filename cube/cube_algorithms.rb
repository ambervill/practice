require './cube'

cube = Cube.new
distribution = {}
3000.times do
  counter = 0
  algorithm = Algorithm.generate(41)
  begin
    cube.algorithm algorithm
    counter += 1
  end while !cube.solved?
  distribution[counter] ||= 0
  distribution[counter] += 1
end

distribution.keys.sort.each do |key|
  print key, "=", distribution[key], "\n"
end