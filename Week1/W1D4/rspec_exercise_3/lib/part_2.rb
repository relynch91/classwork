def element_count(arr)
    my_hash = Hash.new(0)

    arr.each do |ele|
        my_hash[ele] += 1
    end
    my_hash
end

def char_replace!(string, hash)
    string.each_char.with_index do |letter, i|
        string[i] = hash[letter] if hash.keys.include?(letter)
    end
end

def product_inject(arr)
    arr.inject { |acc, ele| acc * ele}
end