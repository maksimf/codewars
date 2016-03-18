require 'pry'
def determinant(matrix, value = 0, depth = 0, totals = [])
  first_row = matrix.first
  @initial_matrix_size ||= first_row.size
  depth += 1

  return matrix[0][0] if @initial_matrix_size == 1

  return first_row if matrix.size == 1

  first_row.each_with_index do |col_item, i|
    minor_det = (i.odd? ? -1 : 1) * col_item * determinant(minor(matrix, i), value, depth, totals)
    value += minor_det

    (totals.push(minor_det) && value = 0) if depth == 1
  end

  binding.pry
  totals.size == @initial_matrix_size ? totals.reduce(:+) : value
end

def minor(matrix, el_index)
  minor_size = matrix.first.size - 1
  minor_matrix = []

  for i in (1..minor_size) do
    for j in (0..minor_size) do
      minor_matrix << matrix[i][j] if j != el_index
    end
  end

  minor_matrix.size == 1 ? minor_matrix : minor_matrix.each_slice(minor_size).to_a
end

# puts 'Should be -20'
# puts determinant([[2,5,3], [1,-2,-1], [1,3,4]])
puts 'Should be -1'
puts determinant([[1,3], [2,5]])
# puts 'Should be 1'
# puts determinant([[1]])
