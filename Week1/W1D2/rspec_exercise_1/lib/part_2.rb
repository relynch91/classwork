def hipsterfy(word)
    vowels = "aeiouAEIOU"
    last_vowel = false
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            last_vowel = idx
        end
    end
    if last_vowel == false
        return word
    else
        word[last_vowel] = ""
        return word
    end
end

def vowel_counts(string)
    vowels = "aeiouAEIOU"
    empty_hash = Hash.new(0)
    string.each_char do |char|
        if vowels.include?(char)
            empty_hash[char.downcase] += 1
        end
    end
    empty_hash
end

def caesar_cipher(message, n)
    alpha = ("a".."z").to_a
    answer = ""
    message.each_char do |ele|
        if alpha.include?(ele)
            answer << helper(ele, n)
        else
            answer << ele
        end
    end
    answer
end

def helper(ele, n)
    alpha = ("a".."z").to_a
    idx = alpha.index(ele)

    return alpha[(idx + n) % 26]
end