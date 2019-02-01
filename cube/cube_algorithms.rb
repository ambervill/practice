require './cube'

cube = Cube.new
distribution = {}
(100..199).each do |alg_length|
  50.times do
    counter = 0
    algorithm = Algorithm.generate(alg_length)
    begin
      cube.algorithm algorithm
      counter += 1
    end while !cube.solved?
    distribution[counter] ||= 0
    distribution[counter] += 1
  end
end
distribution.keys.sort.each do |key|
  print key, "=", distribution[key], "\n"
end