require "byebug"

# def range(start, finish)


#     arr = []
#     if finish <= start
#         return arr
#     else
#         arr += [start] + range(start+1, finish)
#     end
#     arr
# end

def range(start, finish)
    (start...finish).map do |i|
        i
    end
end

# p range(1, 5)

# def exp(b, n)
#     if n == 0
#         return 1
#     elsif n == 1
#         return b
#     else
#         b * exp(b, n-1)
#     end
# end

def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    if n % 2 == 0
        b * exp(b, n/2) ** 2
    else
        b * (exp(b, (n-1)/2) ** 2)
    end
end

# p exp(3, 3)
# p exp(4, 3)

class Array
    def deep_dup
        arr = []
        return self if self.length == 1
        self.each_with_index do |ele, idx|
            if ele.is_a?Array 
                arr << ele.deep_dup
            else
                arr += [ele] + self[idx + 1..-1].deep_dup
            end
        end
    end 

    # sample = [1, [2], [3, [4]]]
    # p sample.deep_dup
end

# def fibonacci(n)
#     ans = []
#     if n == 0
#         return [0]
#     elsif n == 1
#         return [1]
#     else
#         ans += fibonacci(n-1) + [fibonacci(n-1)[-1] + fibonacci(n-2)[-1]]
#     end
# end

def fibonacci(n)
    ans = [0, 1]
    if n == 0
        return [0]
    elsif n == 1
        return [0, 1]
    end

    while ans.length != n+1
        ele = ans[-1] + ans[-2]
        ans << ele
    end

    ans
end


# p fibonacci(6)

def bsearch(arr, target)
    #debugger
    
    return nil if !arr.include?(target)
    middle = arr.length/ 2
    if arr[middle] == target
        return middle
    elsif arr[middle] < target
        return middle + 1 + bsearch(arr[middle+1..-1], target)
    elsif arr[middle] > target
        bsearch(arr[0...middle], target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length == 0 || array.length == 1
    middle = array.length / 2
    left = merge_sort(array[0...middle]) 
    right = merge_sort(array[middle..-1])
    merge(left, right)
end

def merge(left, right)
    answer = []
    while left.length != 0 && right.length != 0
        if left[0] > right[0]
            answer << right.shift
        else
            answer << left.shift
        end

        if left.empty?
            answer += right
        elsif
            right.empty?
            answer += left
        end
    end
    
    answer 
end

#p merge_sort([1, 3, 5, 2, 8, 6, 9, 2])


def subsets(arr)
    answer = [[]]
    return answer if arr.length == 0
    return [arr] if arr.length == 1
    # answer += [arr] + subsets(arr[1..-1]) + subsets(arr[0...-1])
    # answer
end

# def sub2(arr)
#     answer = []
#     return [[]] if arr.length < 1
#     answer << arr if arr.length == 1
#     answer << [arr[0]] + [arr[-1]] + [arr[0], arr[-1]] + sub2(arr[1..-2])
# end

# p sub2([1, 2, 3])

#p subsets([]) # => [[]]
#p subsets([1]) # => [[], [1]]
#p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
 # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# 1     2       3   
# go through each number and temporarily remove it, creating two arrays
# add current number to array
# store each section into array
# call subsets on each section?
# add in complete num array to result array (once)
# add an empty array to the result array (once)

# Index from example: 
# none*, 0, 1, [0, 1], 2, [0, 2], [1, 2], [1, 2, 3]
# 3 with 1 char
# 3 with 2 char
# 1 with 3 char

def permutations(array)
    answer =[] 
    return [array[0]] if array.length == 1
    # ex arr of length 2 
    # 1,2   2,1
    # ex arr of length 3
    # 1,2,3   2,3,1   3,1,2   2,1,3   1,3,2   3,2,1 
    # switch index 0 with index 1
    # switch index 0 with index 2
    # if arr is greater than 3, then index 0 must be switched with every 
    # index except the last inde
    array.each_with_index do |ele, idx|
        answer << [[ele] + permutations(array[0...idx] + array[idx+1..-1])]
    end
end

# if array size = 1 return array element
# else 

p permutations([1, 2, 3])