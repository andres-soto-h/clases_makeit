class String
  def palindrome?
    phrase_new = ''
    reverse = ''
    split(/\W/).each { |word| phrase_new += word }
    phrase_new.reverse == phrase_new
  end
end

puts 'anita lava la tina'.palindrome? # => true
puts 'hora de irse'.palindrome? # => false
