require 'pry'
def determinant(matrix)
  minor = []
  n = matrix[0].size

  case n
  when 1
    return matrix[0][0]
  when 2
    return matrix[0][0] * matrix[1][1] - matrix[1][0] * matrix[0][1]
  else
    # Iterate through each element in first row
    for i in (0...n) do
      # Count minor matrix for element with index i
      for j in (1...n) do
        for k in (0...n).reject { |x| x == i }
          minor << matrix[j][k]
        end
      end
      minor = minor.each_slice(n - 1).to_a
      determinant(minor)
      minor = []
    end
  end
end

m0 = [[1]]
m1 = [[1,3], [2,5]]
m2 = [[2,5,3], [1,-2,-1], [1,3,4]]

puts determinant(m2)
