# frozen_string_literal: true

############ 1 ############

# returns the greatest value of the three arguments
# @param x [Integer]
# @param y [Integer]
# @param z [Integer]
# @return [Integer]
def greatest_value(num_1, num_2, num_3)
  [num_1, num_2, num_3].max
end

# Example usage:
puts greatest_value(1, 2, 3)
puts greatest_value(3, 2, 1)