class Stack
  def initialize
    @data = []
  end

  def top
    @data[-1]
  end

  def pop!
    @data.pop
  end

  def insert!(item)
    @data.push(item)
  end

  def print
    puts @data.join(" ")
  end

  def empty?
    @data.empty?
  end

  def depth
    @data.length
  end
end

class String
  def balanced?
    st = Stack.new
    self.each_char do |char|
      if char == "[" || char == "("
        st.insert! char
      end
      if char == "]"
        unless st.pop! == "["
          return false
        end
      end
      if char == ")"
        unless st.pop! == "("
          return false
        end
      end
    end
    st.empty?
  end
end

# x = Stack.new
# x.insert! 2
# x.insert! 4
# x.insert! 5
# x.insert! 6
# x.print
# x.top!
# x.print

str = "[()]{}{[()()]()}"
puts str.balanced?
