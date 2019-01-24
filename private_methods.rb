class Foo

  def caller(other)
    # other.private_method
    other.protected_method
  end

  private
  def private_method
    puts "private_method"
  end

  protected
  def protected_method
    puts "protected_method"
  end
end

class Bar < Foo

end

class Third
  def caller(other)
    other.protected_method
  end
end

x = Foo.new
y = Bar.new
x.caller(y)
y.caller(x)
z = Third.new
z.caller(x)