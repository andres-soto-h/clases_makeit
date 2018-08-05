def secret_code(phrase)
    compare_arr=['one','two','three','four','five','six','seven','eight','nine']
    code=0
    compare_arr.each_with_index |num, index|    
        if phrase.include?(num)
            code+=1
        end
    end
    code
end

puts secret_code("one on one")