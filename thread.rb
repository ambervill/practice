# x = 1
# thread3 = Thread.new do
#   puts Thread.current.status
#   sleep(rand(0))
#   x = 3
#   puts "Thread: x=#{x}"
# end
# # sleep(1)
# puts "Main: x=#{x}"
# puts thread3.status
# thread3.join

mutex1 = Mutex.new
mutex2 = Mutex.new
x = 0
thread1 = Thread.new do
  # mutex1.synchronize do
    10.times do
      # x += 1
      print "#{x += 1}\n"
    end
  # end
end
thread1.priority = -1

thread2 = Thread.new do
  # mutex2.synchronize do
    10.times do
      # x -= 1
      print "#{x -= 1}\n"
    end
  # end
end
thread2.priority = 1
thread1.join
thread2.join
