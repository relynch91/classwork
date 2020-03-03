# strange_sums
# Write a method strange_sums that accepts an 
#array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.

# Examples
def strange_sums(array)
    count = 0
    array.each_with_index do |ele_1, idx_1|
        array.each_with_index do |ele_2, idx_2|
            if idx_2 > idx_1 && ele_2 + ele_1 == 0
                count += 1
            end
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

#pair_product
#Write a method pair_product that accepts an array of numbers and a product as arguments. 
#The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. 
#You may assume that the input array contains unique elements.

def pair_product(arr,product)
    hash=Hash.new(false)
    arr.each do |ele|
        return true if hash[ele]==true
        hash[product/ele]=true
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# rampant_repeats
# Write a method rampant_repeats that accepts a string 
# and a hash as arguments. The method should return a new 
# string where characters of the original string are repeated 
# the number of times specified by the hash. If a character does 
# not exist as a key of the hash, then it should remain unchanged.

# Examples

def rampant_repeats(string, hash)
    answer = ""
    string.each_char do |letter|
        if hash.include?(letter)
            hash[letter].times { answer << letter}
        else
            answer << letter
        end
    end
    answer
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaa

##perfect_square?
#Write a method perfect_square? that accepts a number as an argument. 
#The method should return a boolean indicating whether or not the argument is a perfect square. 
#A perfect square is a number that is the product of some number multiplied by itself. 
#For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(num)
    count=0
    i=1
    while count<=num
        count=i*i
        if count==num
            return true
        end
        i+=1
    end
    false
end


# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. 
# The method should return true if the given number has more divisors 
# than all positive numbers less than the given number. For example, 
# 24 is an anti-prime because it has more divisors than any positive 
# number less than 24. Math Fact: Numbers that meet this criteria are 
# also known as highly composite numbers.

# Examples

def helper(number)
    count = 0
    (2..number).each do |factor|
        count += 1 if number % factor == 0
    end
    count
end

def anti_prime?(numb)
    max = helper(numb)
    (2...numb).each do |divisor|
        if helper(divisor) > max
            return false
        end
    end
    return true
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

#matrix_addition
##Let a 2-dimensional array be known as a "matrix". 
#Write a method matrix_addition that accepts two matrices as arguments. 
#The two matrices are guaranteed to have the same "height" and "width". '
#The method should return a new matrix representing the sum of the two arguments. 
#To add matrices, we simply add the values at the same positions:

def matrix_addition(mat_1,mat_2)
    answer=Array.new(mat_1.length) {Array.new(mat_2[0].length)} 
    # # answer =  
    (0...mat_1.length).each do |i| # 0 to 1
        (0...mat_1[0].length).each do |j| #0 to 1
            answer[i][j]=mat_1[i][j]+mat_2[i][j]
            #answer[0][1] = mat_1[0][1] = 5  + mat_2[0][1] = 1
        
        end
    end
    answer
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as 
# arguments. The method should return an array containing all of the 
# common divisors shared among the arguments. For example, the common 
# divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the 
# arguments are positive integers.

# Examples

def mutual_factors(*args)
    sorted = args.sort #args min to max in array 
    new_array = Array.new
    first_num = sorted[0] #array of smallest factors 
    (1..first_num).each do |i|
        new_array << i if first_num % i == 0
    end
    args.each do |number|
        new_array.each do |factor|
            if number % factor != 0
                new_array.delete(factor)
            end
        end
    end
    return new_array
end


# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the 
# previous three numbers. The first six numbers of tribonacci sequence are:

# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, 
# and returns the n-th number of the tribonacci sequence.

# Examples
def tribonacci_number(n)
    return 1 if n==1
    return 1 if n==2
    answers=[1,1,2]
    while answers.length<n
        answers<<answers[-1]+answers[-2]+answers[-3]
    end            
    answers.pop
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number of matrices 
# as arguments. The method should return a new matrix representing the sum 
# of the arguments. Matrix addition can only be performed on matrices of 
# similar dimensions, so if all of the given matrices do not have the same 
# "height" and "width", then return nil.

# Examples

def height_width(matrix)
    height=matrix.length
    width=matrix[0].length
    [height,width]
end

def matrix_addition_reloaded(*matrix)
    return matrix[0] if matrix.length==1
    params=height_width(matrix[0])
    (1...matrix.length).each do |i|
        return nil if params!=height_width(matrix[i])
    end
    #debugger
    answer=Array.new(matrix[0].length) {Array.new }
    
    matrix.each do |ele|
        (0...matrix[0].length).each do |i|
            (0...matrix[0][0].length).each do |j|
                if answer[i][j] == nil
                    answer[i][j] = ele[i][j] 
                else
                    answer[i][j] += ele[i][j]
                end
            end
        end
    end
    answer
   
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # ni

#squarocol?
#Write a method squarocol? that accepts a 2-dimensional array as an argument. 
#The method should return a boolean indicating whether or not any row or 
#column is completely filled with the same element. 
#You may assume that the 2-dimensional array has "square" dimensions, 
#meaning it's height is the same as it's width.

def squarocol?(array)

    array.each do |ele| #ele = inividual array
        if ele.uniq.length == 1
            return true
        end
    end

    (0..array.length - 1).each do |i| 
        column = Array.new
        (0..array.length - 1).each do |j|
            column << array[j][i]
        end
        if column.uniq.length == 1
            return true
        end
    end
    false
end







# p squarocol?([
#     [:a, :x , :d], 00 01 02 
#     [:b, :x , :e], 10 11 12
#     [:c, :x , :f], 02 12 22 
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

# squaragonal?
# Write a method squaragonal? that accepts 2-dimensional array as an 
# argument. The method should return a boolean indicating whether or not 
# the array contains all of the same element across either of its diagonals. 
# You may assume that the 2-dimensional array has "square" dimensions, meaning 
# it's height is the same as it's width.

# Examples

def squaragonal?(arr)
    left_right=Array.new 
    right_left=Array.new 
    (0...arr.length).each do |i|
        left_right<<arr[i][i]
        right_left<<arr[i][arr.length-1-i]
    end
    return true if left_right.uniq.length==1 || right_left.uniq.length==1
    false
end


# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# pascals_triangle
# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. 
# The top of the pyramid is the number 1. To generate further levels of 
# the pyramid, every element is the sum of the element above and to the 
# left with the element above and to the right. Nonexisting elements are 
# treated as 0 when calculating the sum. For example, here are the first 5 
# levels of Pascal's triangle:

#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1
# Write a method pascals_triangle that accepts a positive number, n, 
# as an argument and returns a 2-dimensional array representing the 
# first n levels of pascal's triangle.

# Examples

def pascals_triangle(numb)
    return [1] if numb == 1
    return [1, 1] if numb ==2
    answer = [[1], [1, 1]]
    while answer.length != numb
        next_array = [1]
        (0...answer[-1].length - 1).each do |i|
            value = answer[-1][i] + answer[-1][i + 1]
            next_array << value 
        end
        next_array << 1
        answer << next_array
    end
    answer
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def prime(number)
    return false if number < 2
    (2...number).each do |i|
        if number % i == 0
            return false
        end
    end
    true
end

def mersenne_prime(numb)
    count = 0
    x = 0
    while count < numb
        if prime((2 ** x) - 1)
            count += 1
            
            x += 1
        else
            x += 1
        end
    end
    return 2 ** (x - 1) - 1
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    alphabet=('a'..'z').to_a
    count=0
    word.each_char do |lett|
        count+=alphabet.index(lett)+1
    end
    i=0
    i_count=0
    while i_count<count
        x=(i * (i + 1)) / 2
        if x==count
            return true
        end
        i_count=x
        i+=1
    end
    false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

'byebug'
def consecutive_collapse(array)
    sorted = true
    while sorted
        sorted = false
        #debugger
        (0...array.length - 1).each do |i|
            return array if array.length==1
            if array[i] - array[i + 1] == 1 || array[i] - array[i + 1] == -1
                2.times { array.delete_at(i)}
                sorted = true
                break
            end
        end
    end
    array
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12]) 
def positive_helper(num,n)
    answer=Array.new
    i=num+1
    while answer.length<n
        if prime(i)
            answer<<i
            i+=1
        else
            i+=1
        end
    end
    answer.pop
end

def negative_helper(num,n)
    answer=Array.new
    i=num-1
    while answer.length < (-n)
        if prime(i)
            answer<<i
            i-=1
        elsif i<2
            return nil

        else
            i-=1
        end
    end
    answer.pop
end

def pretentious_primes(arr,n)
    answer=Array.new
    arr.each do |num|
        if n>0
            answer<<positive_helper(num,n)
        else
            answer<<negative_helper(num,n)
        end
    end
    answer
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

