require 'byebug'

def zip(*array)
  #debugger  
my_hash = Hash.new{|h,k| h[k]=[]}
array.each do |arr|#individual array, array 
    (0...arr.length).each do |i| #arr == an array of elements
        my_hash[i] << arr[i]
    end
end
my_hash.values
end

def prizz_proc(array, proc_1, proc_2)
    result = Array.new
    array.each do |ele|
        if (proc_1.call(ele) || proc_2.call(ele)) && !(proc_1.call(ele) && 
            proc_2.call(ele))
            result << ele
        end
    end
    result
end

def zany_zip(*arrays)
    max = 0
    arrays.each{|arr| max = arr.length if arr.length > max}
    my_hash = Hash.new {|h,k| h[k]= []}
    arrays.each do |arr|
        (0...max).each do |i|
            if arr[i] 
                my_hash[i] << arr[i]
            else
                my_hash[i] << nil
            end
        end
    end
    my_hash.values
end

def maximum(array, &prc)
    res = []
    return nil if array.length == 0
    max = prc.call(array[0])
    #array.select { |ele| prc.call(ele) > max }
    
    array.each do |ele| 
        if prc.call(ele) >= max
            max = prc.call(ele)
            res << ele
        end
    end
    #res = array.select {|ele| prc.call(ele)==max}
    return res[-1]
end
#need to iterate through the array, find each, pass the element into the prc
#set a key value pair as: prc.call(ele), ele
def my_group_by(array, &prc) #1 array
    my_hash = Hash.new { |h, k| h[k] = Array.new }
    array.each do |ele|
        my_hash[prc.call(ele)] << ele
    end
    my_hash
end

def helper(value,max,proc)
    new_value = proc.call(value)
    new_max = proc.call(max)
    if new_value > new_max
        return true
    end
    false
end

def max_tie_breaker(arr, proc, &prc)
    #debugger
    return nil if arr.length == 0
    res = 0
    max = prc.call(arr[0])
    (0...arr.length).each do |i|
        value = prc.call(arr[i])
        if value > max  
           max = value
           res = i
        # elsif value == max
        #     if helper(value,max,proc)
        #         max = value
        #         res = i
        #     end
        end
    end
    arr[res]
end
#sentence = "hello" => sentence[1..3] = "ell"

def silly_syllables(sentence)
    vowels = "aeiou"
    words = sentence.split(" ")
    result = Array.new
    words.each do |word|
        idx = []
        word.each_char.with_index do |char, i|
            if vowels.include?(char)
                idx << i
            end
        end
        if idx.length >= 2
            idx_first = idx[0]
            idx_last = idx[-1]
            new_word = word[idx_first..idx_last]
            result << new_word
        else
            result << word
        end
    end
    result.join(" ")
end
