def select_even_nums(array)
    array.select { |num| num % 2 == 0 }
end

def reject_puppies(array)
    array.reject { |dog| dog['age'] <= 2 } #dog = {"name"=>"Fido", "age"=> 3}
end

def count_positive_subarrays(array)
    array.count {|ele| ele.sum > 0}
end

def aba_translate(str)
    new_str = ""
    vowels = "aeiouAEIOU"
    str.each_char do |letter|
        if vowels.include?(letter.downcase)
            new_str << letter + "b" + letter
        else
            new_str << letter
        end
    end
    new_str
end

def aba_array(array)
    array.map do |word|
        aba_translate(word)
    end
end