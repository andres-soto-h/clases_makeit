class palindrome < String
    self.palindrome?(phrase)
    phrase_new=""
    reverse=""    
        phrase.split(/\W/).each do |word|
            phrase_new+=word
        end
        
        reverse=phrase_new.reverse

        if reverse==phrase_new
            true
        else
            false
        end
    end
end 

"anita lava la tina".palindrome? # => true
"hora de irse".palindrome? # => false