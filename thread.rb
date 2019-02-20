
mutex1 = Mutex.new
mutex2 = Mutex.new
x = 0
thread1 = Thread.new do
  mutex1.synchronize do
    10.times do
      print "#{x += 1}\n"
    end
  end
end
thread1.priority = -1

thread2 = Thread.new do
  mutex1.synchronize do
    10.times do
      print "#{x -= 1}\n"
    end
  end
end
thread2.priority = 1
thread1.join
thread2.join
