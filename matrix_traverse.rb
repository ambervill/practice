dim = 4
matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
(0..2*dim-2).each do |k|
  if k.even?
    ([0,k-dim+1].max..[k,dim-1].min).reverse_each do |first_index|
        puts matrix[first_index][k-first_index]
    end
  else
    ([0, k-dim+1].max..[k, dim-1].min).each do |first_index|
        puts matrix[first_index][k-first_index]
    end
  end
end