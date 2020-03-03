# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"
def is_prime?(factor)
    return false if factor < 2
    (2...factor).each do |ele|
        if factor % ele == 0
            return false
        end
    end
    return true 
end

def largest_prime_factor(numb)
    array =[]

    (2..numb).each do |ele|
        if is_prime?(ele) && numb % ele == 0
            array << ele
        end
    end
    array.sort[-1]
end

def unique_chars?(str)
    hash = Hash.new(0)
    # debugger
    str.each_char do |char|
        hash[char] += 1
    end
    return false if hash.values.uniq != [1]
    true
end

def dupe_indices(array)
    my_hash = Hash.new { |hash, key| hash[key] = []}
    array.each_with_index do |ele, idx|
        my_hash[ele] << idx
    end

    my_hash.each do |key, value|
        if my_hash[key].length < 2 
            my_hash.delete(key)
        end
    end
    my_hash
end

def ana_array(arr1, arr2)
    if arr1.length != arr2.length
        return false
    end

    my_hash = Hash.new(0)

    arr1.each do |ele|
        my_hash[ele] += 1
    end

    arr2.each do |ele|
        my_hash[ele] -= 1
    end

    my_hash.values.uniq == [0]
end














