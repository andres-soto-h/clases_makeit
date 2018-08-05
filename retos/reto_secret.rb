# def secret_code(phrase)
#   words = phrase.split(' ')
#   compare_arr = %w[one two three four five six seven eight nine]
#   code = 0
#   words.each do |word|
#     compare_arr.each_with_index do |num, index|
#       code += (index + 1) if word == num
#     end
#   end
#   code
# end

def secret_code(phrase)
  numbers = { 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
              'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }

  value = 0
  phrase.split(/\W/).each do |word|
    value += numbers[word] if numbers[word]
  end

  value
end

puts secret_code('one on one') #=> 2
puts secret_code('five monkeys in three farms') #=> 8
puts secret_code('') #=> 0
puts secret_code('fivethreeone') #=> 0
