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

############ 2 ############

# prints numbers from 1 to 100
# for multiples of 3, prints "Fizz"
# for multiples of 5, prints "Buzz"
# for multiples of 3 and 5, prints "FizzBuzz"
# @return [void]
def print_fizz_buzz
  (1..100).each do |i|
    mod_3 = (i % 3).zero?
    mod_5 = (i % 5).zero?

    if mod_3 && mod_5
      puts "FizzBuzz"
    elsif mod_3
      puts "Fizz"
    elsif mod_5
      puts "Buzz"
    else
      puts i
    end
  end
end