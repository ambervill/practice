class A
  @@a = 1
  @a = 2
  a = 3

  @x = binding
end

# Expected output is '[1, 2, 3]'
p eval('[@@a, @a, a]', A.instance_variable_get(:@x))


