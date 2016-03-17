require 'pry'


def determinant(matrix, coeff = 1, determinant_value = 0)
  puts "enter method #{matrix}, #{determinant_value}"
  n = matrix.first.size

  return matrix.first if matrix.size == 1

  matrix.first.each_with_index do |col_item, i|
    # puts "col_item: #{col_item}"
    puts "#{sign(i)} * #{col_item} * #{determinant(minor(matrix, i), determinant_value)}"
    determinant_value += sign(i) * col_item * determinant(minor(matrix, i), coeff, determinant_value)
  end

  determinant_value
end

def sign(switch)
  switch.odd? ? -1 : 1
end

def minor(matrix, el_index)
  minor_size = matrix.first.size - 1
  minor_matrix = []

  for i in (1..minor_size) do
    for j in (0..minor_size) do
      minor_matrix << matrix[i][j] if j != el_index
    end
  end

  foo = minor_matrix.size == 1 ? minor_matrix : minor_matrix.each_slice(minor_size).to_a
# puts foo.inspect
  foo
end

# determinant([ [1, 3], [2,5]])
puts determinant([[2,5,3], [1,-2,-1], [1, 3, 4]])