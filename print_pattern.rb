# Print a sequence of numbers starting with N, without using loop, in which  A[i+1] = A[i] - 5,  if  A[i]>0, else A[i+1]=A[i] + 5  repeat it until A[i]=N.
N = 17
@j = N
def print_pattern
  print @j, " "
  return if @j < 0
  @j -= 5
  print_pattern
  @j += 5
  print @j, " "
end

print_pattern