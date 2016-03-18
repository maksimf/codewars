def determinant(matrix)
  minor = []
  minor_dets = 0
  n = matrix[0].size

  case n
  when 1
    return matrix[0][0]
  when 2
    matrix[0][0] * matrix[1][1] - matrix[1][0] * matrix[0][1]
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
      minor_det = determinant(minor)
      minor = []
      minor_dets += (minor_det * matrix[0][i] * (i.odd? ? -1 : 1)) if minor_det.is_a? Numeric
    end

    minor_dets
  end
end
