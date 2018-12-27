require 'delegate'
class Stats2
   def initialize
     @source = SimpleDelegator.new([])
   end

   def stats(records)
     @source.__setobj__(records)

     "Elements:  #{@source.size}\n" +
     " Non-Nil:  #{@source.compact.size}\n" +
     "  Unique:  #{@source.uniq.size}\n"
   end
 end

 s = Stats2.new
 puts s.stats(%w{James Edward Gray II})
 puts
 puts s.stats([1, 2, 3, nil, 4, 5, 1, 2])