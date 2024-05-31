require 'rspec'
require_relative 'assignment'

########### 1 #################

RSpec.describe 'greatest_value' do
  subject(:find_greatest_value) { greatest_value(*input) }

  shared_examples 'returns the greatest value' do
    it 'returns the greatest value' do
      expect(find_greatest_value).to eq(expected_output)
    end
  end

  context 'when all inputs are integers' do
    context 'when all numbers are distinct' do
      let(:input) { [3, 2, 1] }
      let(:expected_output) { 3 }

      include_examples 'returns the greatest value'
    end

    context 'when two or more numbers are equal' do
      let(:input) { [3, 1, 1] }
      let(:expected_output) { 3 }

      include_examples 'returns the greatest value'
    end

    context 'when all numbers are equal' do
      let(:input) { [1, 1, 1] }
      let(:expected_output) { 1 }

      include_examples 'returns the greatest value'
    end
  end

  context 'when any of the input is not an integer' do
    let(:input) { [1, 2, '3'] }

    it 'raises an error' do
      expect { find_greatest_value }.to raise_error(ArgumentError)
    end
  end
end

############ 2 #################
RSpec.describe '#print_fizz_buzz' do
  subject(:fizz_buzz) { print_fizz_buzz }

  context 'when called' do
    let(:array) { (1..100).to_a }

    let(:fizz_buzz_indexes) do
      array.each_with_object({ mod_3_and_5: [], multiples_of_3: [], multiples_of_5: [] }) do |num, hash|
        index = array.index(num)

        if num % 3 == 0 && num % 5 == 0
          hash[:mod_3_and_5] << index
        elsif num % 3 == 0
          hash[:multiples_of_3] << index
        elsif num % 5 == 0
          hash[:multiples_of_5] << index
        end
      end
    end

    let(:number_indexes) do
      (0..99).to_a - fizz_buzz_indexes.values.flatten
    end

    it 'returns an array of 100 elements' do
      expect(fizz_buzz.count).to eq(100)
    end

    it 'returns "Fizz" for multiples of 3' do
      expect(fizz_buzz.values_at(*fizz_buzz_indexes[:multiples_of_3]).uniq).to eq(['Fizz'])
    end

    it 'returns "Buzz" for multiples of 5' do
      expect(fizz_buzz.values_at(*fizz_buzz_indexes[:multiples_of_5]).uniq).to eq(['Buzz'])
    end

    it 'returns "FizzBuzz" for multiples of both 3 and 5' do
      expect(fizz_buzz.values_at(*fizz_buzz_indexes[:mod_3_and_5]).uniq).to eq(['FizzBuzz'])
    end

    it 'returns the number itself for other cases' do
      expect(fizz_buzz.values_at(*number_indexes)).to eq(array.values_at(*number_indexes))
    end
  end
end

############ 3 #################

RSpec.describe 'character_count' do
  subject(:count_characters) { character_count(input_string) }

  let(:input_string) { 'hello how are you' }

  context 'when counting occurrences of each character in a string' do
    it 'returns a hash with the correct character counts' do
      expect(count_characters).to eq({ 'h' => 2, 'e' => 2, 'l' => 2, 'o' => 3, 'w' => 1, 'a' => 1, 'r' => 1, 'y' => 1, 'u' => 1 })
    end
  end

  context 'when incorrect character counts are produced' do
    it 'does not return incorrect character counts' do
      expect(count_characters).not_to eq({ 'h' => 3, 'e' => 2, 'l' => 1, 'o' => 2, 'w' => 1, 'a' => 2, 'r' => 1, 'y' => 1, 'u' => 1 })
    end
  end
end

# ########### 4 #################

RSpec.describe 'convert_number' do
  subject(:conversion) { convert_number(input_value, from: input_system, to: output_system) }

  context 'when converting a number from one system to another' do
    context 'converting decimal to octal' do
      let(:input_value) { 42 }
      let(:input_system) { 'decimal' }
      let(:output_system) { 'octal' }

      it 'converts decimal to octal' do
        expect(conversion).to eq('52')
      end
    end

    context 'converting decimal to binary' do
      let(:input_value) { 42 }
      let(:input_system) { 'decimal' }
      let(:output_system) { 'binary' }

      it 'converts decimal to binary' do
        expect(conversion).to eq('101010')
      end
    end

    context 'converting binary to decimal' do
      let(:input_value) { '101010' }
      let(:input_system) { 'binary' }
      let(:output_system) { 'decimal' }

      it 'converts binary to decimal' do
        expect(conversion).to eq('42')
      end
    end

    context 'converting octal to decimal' do
      let(:input_value) { '52' }
      let(:input_system) { 'octal' }
      let(:output_system) { 'decimal' }

      it 'converts octal to decimal' do
        expect(conversion).to eq('42')
      end
    end

    context 'converting hex to decimal' do
      let(:input_value) { '2A' }
      let(:input_system) { 'hex' }
      let(:output_system) { 'decimal' }

      it 'converts hex to decimal' do
        expect(conversion).to eq('42')
      end
    end
  end

  context 'when incorrect conversions are produced' do
    let(:input_system) { 'decimal' }
    let(:input_value) { 42 }
    let(:output_system) { 'octal' }

    it 'avoids incorrect conversion from decimal to octal' do
      expect(conversion).not_to eq('53')
    end

    it 'avoids incorrect conversion from decimal to binary' do
      expect(conversion).not_to eq('101011')
    end

    it 'avoids incorrect conversion from binary to decimal' do
      expect(conversion).not_to eq('43')
    end

    it 'avoids incorrect conversion from octal to decimal' do
      expect(conversion).not_to eq('43')
    end

    it 'avoids incorrect conversion from hex to decimal' do
      expect(conversion).not_to eq('41')
    end
  end
end

# ############ 5 #################

RSpec.describe 'boxy' do
  subject { boxy(input) }

  context 'when generating box output' do
    context 'when boxy parameter is 3 then value of n = 3' do
      let(:input) { 3 }
      let(:expected_output) do
        <<~BOX.chomp
           - - -
          |1|2|3|
           - - -
        BOX
      end

      it { is_expected.to eq(expected_output) }
    end

    context 'when boxy parameter is 12 then value of n = 12' do
      let(:input) { 12 }
      let(:expected_output) do
        <<~BOX.chomp
            -  -  -  -  -  -  -  -  -  -  -  -
          | 1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|
            -  -  -  -  -  -  -  -  -  -  -  -
        BOX
      end

      it { is_expected.to eq(expected_output) }
    end
  end

  context 'when not generating box output' do
    let(:invalid_output) { 'incorrect_output' }

    context 'for n = 3' do
      let(:input) { 3 }
      it { is_expected.not_to eq(invalid_output) }
    end

    context 'for n = 12' do
      let(:input) { 12 }
      it { is_expected.not_to eq(invalid_output) }
    end
  end
end

RSpec::Core::Runner.run([$FILE])
