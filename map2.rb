module Enumerable
   def map2
      ret = []
      self.each2 do |elem|
         ret << yield(elem)
      end
     ret
   end

  def each2
     for i in 0...self.length do
        yield self[i]
     end
  end
end