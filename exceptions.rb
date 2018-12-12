def func
  begin
    4.foo
    raise "Test error"
  rescue NoMethodError
    puts "NoMethodError"
  rescue StandardError
    begin
      puts "First rescue"
      raise "Second error"
    rescue RuntimeError
      puts "Second rescue"
    end
  end
end

func