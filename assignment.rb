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
  (1..100).map do |i|
    mod_3 = (i % 3).zero?
    mod_5 = (i % 5).zero?

    if mod_3 && mod_5
       "FizzBuzz"
    elsif mod_3
       "Fizz"
    elsif mod_5
       "Buzz"
    else
       i
    end
  end
end

# Example usage:
puts print_fizz_buzz

############ 3 ############

# loops through the characters of a string and counts the occurrences of each character
# @param str [String]
# @return [Hash]
def character_count(str)
  str.each_char.with_object(Hash.new(0)) do |char, counts|
    counts[char] += 1 unless char == " "
  end
end

# Example usage:
input = "hello how are you"
output = character_count(input)
puts output.map { |key, value| "#{key}: #{value}" }.join(", ")

############ 4 ############

# converts a number from one number system to another
#   Step 1: Convert the original number to decimal
#   Step 2: Convert the decimal number to the target number system
# @param number [Integer]
# @param from [String]
# @param to [String]
# @return [Integer]
def convert_number(number, from:, to:)
  base = {
    "binary" => 2,
    "octal" => 8,
    "decimal" => 10,
    "hex" => 16
  }
  from_base = base[from]
  to_base = base[to]

  # NOTE: converted into string first; number.to_i(10) raises an error in Ruby
  number.to_s.to_i(from_base).to_s(to_base)
end

# Example usage:
puts convert_number(42, from: "decimal", to: "octal")
puts convert_number(42, from: "decimal", to: "binary")
puts convert_number("101010", from: "binary", to: "decimal")
puts convert_number("52", from: "octal", to: "decimal")
puts convert_number("2A", from: "hex", to: "decimal")

############ 5 ############

# prints a box with numbers from 1 to n
#   Step 1: Calculate the width of the box, if n = 99; each box width = 2
#   Step 2: Create the horizontal line for number box
#   Step 3: Combine horizontal line, numbers, and horizontal line
# @param n [Integer]
# @return [void]
def boxy(n)
  box_width = n.to_s.size
  horizontal_line = "#{' ' * box_width}-" * n

  numbers = (1..n).map { |i| format("%#{box_width}d", i) }
  output = "|#{numbers.join('|')}|"

  "#{horizontal_line}\n#{output}\n#{horizontal_line}"
end

puts boxy(3)
puts boxy(12)
puts boxy(50)
