# Define your methods here.

def my_map!(array, &proc)
    (0...array.length).each do |i|
        result = proc.call(array[i])
        array[i] = result
    end
end

def two?(array, &proc)
    count = 0
    array.each do |ele|
        count += 1 if proc.call(ele)
    end
    return true if count == 2 
    false
end

def nor_select(array, proc_1, proc_2)
    answer = Array.new
    array.each do |ele|
        count = 0
        count += 1 if !proc_1.call(ele)
        count += 1 if !proc_2.call(ele)
        answer << ele if count == 2
    end
    answer
end

def array_of_hash_sum(array)
    count = 0
    array.each do |ele|
        count += ele.values.sum
    end
    count
end

def slangify(string)
    words = string.split(" ")
    new_words = []
    vowels = "aeiouAEIOU"
    words.each do |word|
        word.each_char.with_index do  |letter, idx|
            if vowels.include?(letter)
                word[idx] = ""
                break
            end
        end
        new_words << word
    end
    new_words.join(" ")
end

def char_counter (string, *letters)
    my_hash = Hash.new(0)
    letters.each do |thing|
        my_hash[thing] += 0
    end
    if letters.length == 0
        string.each_char do |ele|
            my_hash[ele] += 1
        end
        return my_hash
    end

    string.each_char do |char|
        if letters.include?(char)
            my_hash[char] += 1
        end
    end
    my_hash
end