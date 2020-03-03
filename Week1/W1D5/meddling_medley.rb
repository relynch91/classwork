require 'byebug'
# duos
# Write a method duos that accepts a string as an argument 
# and returns the count of the number of times the same character 
# appears consecutively in the given string.

# Examples
def duos(string)
    count = 0
    # string.each_char.with_index do |ele, i|
    #     #debugger
    #     if string[i] == string[i + 1]
    #         count += 1
    #     end
    # end
    i = 0
    while i < string.length

        if string[i] == string[i + 1]
            count += 1
        end
        i += 1
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with 
# it's corresponding value in the hash. If a word does not exist as a key of 
# the hash, then it should remain unchanged.

# Examples

def sentence_swap(sentence,hash)
    words = sentence.split(" ")
    res = words.map do |word|
        if hash[word]
            hash[word]
        else
            word
        end
    end
    res.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the 
# original key when given to the block. Each value of the new hash should 
# be the result of the original values when passed into the proc.

# Examples
def hash_mapped(hash, proc, &prc)
    my_hash = Hash.new(0)
    hash.each do |key, value|
        my_hash[prc.call(key)] = proc.call(value)
    end
    my_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# counted_characters
# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string 
# that appeared more than twice. The characters in the output array should 
# appear in the same order they occur in the input string.

# Examples

def counted_characters(string)
    myHash = Hash.new(0)
    string.each_char do |char|
        myHash[char] += 1
    end
    #ans = []
    x = myHash.select {|k,v| v > 2}
    # x.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# triplet_true?
# Write a method triplet_true? that accepts a string as an argument 
# and returns a boolean indicating whether or not the string contains 
# three of the same character consecutively.

# Examples

def triplet_true(string)
    i = 0
    while i < string.length-2
        if string[i] == string[i + 1] && string[i] == string[1 + 2]
            return true
        end
        i += 1
    end
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# energetic_encoding
# Write a method energetic_encoding that accepts a string 
# and a hash as arguments. The method should return a new string 
# where characters of the original string are replaced with the 
# corresponding values in the hash. If a character is not a key of the hash, 
# then it should be replaced with a question mark ('?'). 
# Space characters (' ') should remain unchanged.

# Examples
def energetic_encoding(string,hash)
    newstr = ""
    string.each_char do |char|
        if char == " "
            newstr << " "
        elsif hash[char]
            newstr << hash[char]
        else
            newstr << "?"
        end
    end
    newstr
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# uncompress
# Write a method uncompress that accepts a string as an argument. 
# The string will be formatted so every letter is followed by a number. 
# The method should return an "uncompressed" version of the string where 
# every letter is repeated multiple times given based on the number that 
# appears directly after the letter.

# Examples

def uncompress(string)
    str = ""
    i = 1
    while i< string.length
        
            string[i].to_i.times do 
                str << string[i - 1]
            end
    
        i+=2
    end
    str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# conjunct_select
# Write a method conjunct_select that accepts an array and one or 
# more procs as arguments. The method should return a new array 
# containing the elements that return true when passed into all of 
# the given procs.

# Examples

def conjunct_select(arr,*procs)
    newarr = []
    arr.each do |ele|
        newarr << ele if procs.all? {|proc| proc.call(ele)}
    end
    newarr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' 
# to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come 
# before the word's first vowel to the end of the word and 
# add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, 
# they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.

# Examples
def convert_pig_latin(sentence)
    words = sentence.split(" ")
    result = []
    vowels = "aeiou"
    words.each do |word|
        if word.length < 3 
            result << word
            #break break will terminate any iteration you are in. 
            next # next will continue to the next iteration of the loop. 
        end

        word.each_char.with_index do |letter, i|
            if i == 0 && vowels.include?(letter.downcase)
                result << word + "yay"
                break
            elsif vowels.include?(letter)
                result << word[i..-1] + word[0...i] + "ay"
                break
            end
        end
    end
    result.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay 

# Write a method reverberate that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the 
# following rules:
# if the word ends with a vowel, simply repeat the word twice 
#     (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after 
#     the word's last vowel, including the last vowel itself 
#     (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, 
# they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.

# Examples



def reverberate(sentence)
    words = sentence.split(" ")
    res = []
    vowels = "aeiou"
    #debugger
    words.each do |word|
        if word.length < 3
            res << word
            # next
        elsif vowels.include?(word[-1])
            res << word + word
        else
            (0...word.length).reverse_each do |i|
                if vowels.include?(word[i].downcase)
                    res << word + word[i..-1]
                    break
                end
            end
        end
    end
    res.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *procs)
    result = Array.new
    array.each do |ele|
        result << ele if procs.any?{ |proc| proc.call(ele) }
    end
    result
    
end

# disjunct_select
# Write a method disjunct_select that accepts an array and one or 
# more procs as arguments. The method should return a new array containing 
# the elements that return true when passed into at least 
# one of the given procs.

# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between 
# having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are 
# the letters a, e, i, o, u.

# Examples

def alternating_vowel(sentence)
    words = sentence.split(" ")
    ans =[]
    i=0
    (i...words.length).each do |i|
        if i.even?
            ans<< first_vowel(words[i])
        else
            ans<< last_vowel(words[i])
        end
    end
    ans.join(" ")
end

def first_vowel(word) #word = "panther" 
    vowels = "aeiou"
    word.each_char.with_index do |char,i| 
        if vowels.include?(char)
            word[i] = ""
            return word
        end
    end    
end
def last_vowel(word)
    vowels = "aeiou"
    i = word.length-1
        while i>=0
            if vowels.include?(word[i])
                word[i]= ""
                return word
            end
            i-=1
        end    
end
# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday""

# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. 
# The method should translate each word of the sentence according to the 
# following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of 
#     the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be 
#     followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the 
# letters a, e, i, o, u.

# Examples
def change(word) 
    vowels = "aeiou"
    result = ""
    (0...word.length).each do |i|
        if vowels.include?(word[i].downcase)
            result += word[i] + "b" + word[i].downcase
        else 
            result += word[i]
        end
    end
    result
end

def silly_talk(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    result = Array.new
    words.each do |word|
        if vowels.include?(word[-1])
            result << word + word[-1]
        else
            result << change(word)
        end
    end
    result.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"



# compress
# Write a method compress that accepts a string as an argument. The 
# method should return a "compressed" version of the string where streaks 
# of consecutive letters are translated to a single appearance of the 
# letter followed by the number of times it appears in the streak. If a letter 
# does not form a streak (meaning that it appears alone), 
# then do not add a number after it.

# Examples
def compress(str)
    ans = Array.new
    count = 1
    #debugger
    (0...str.length-1).each do |i|
        if str[i]==str[i+1]
            count += 1
        else
            if count > 1
                ans << str[i] 
                ans << count.to_s
                count = 1
            else
                ans << str[i]
            end
        end
    end

    if count > 1
        ans << str[-1] 
        ans << count.to_s
    else
        ans << str[-1]
    end

    return ans.join("")
end
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"