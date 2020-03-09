require "byebug"

# def anagram?(str1, str2)
#   perms = str1.split("").permutation.to_a
#   perms.include?(str2.split(""))
# end

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

# def second_anagram?(str1, str2)
#   my_hash = Hash.new(0)
#   str1.each_char do |char|
#     my_hash[char] += 1
#   end
#   str2.each_char do |char|
#     my_hash[char] -= 1
#   end
#   my_hash.values
# end

# def second_anagram?(str1, str2)
#   arr = str2.split("")
#   #debugger
#   str1.each_char do |char| 
#     idx = arr.find_index(char) 
#     return false if idx == nil
#     arr.delete_at(idx)
#   end
#   return true if arr = []
# end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives") 


# def third_anagram?(str1, str2)
#   alphabet = ("a".."z").to_a
#   array1 = str1.chars
#   array2 = str2.chars
#   array1.map! { |ele| ele = alphabet.index(ele)}
#   array2.map! { |ele| ele = alphabet.index(ele)}
#   quicksort(array1) == quicksort(array2)
# end

# def quicksort(array)
#   return array if array.length <= 1
#   pivot = array.shift

#   left_array = array.select { |ele| ele < pivot }
#   right_array = array.select { |ele| ele >= pivot }
#   result_left = quicksort(left_array)
#   result_right = quicksort(right_array)
#   result_left + [pivot] + result_right
# end


# #p quicksort([2, 3, 4, 1, 7, 9])
# p third_anagram?("gizmo", "sally") #=> false
# p third_anagram?("elvis", "lives") #true 

def fourth_anagram?(str1, str2)
  my_hash = Hash.new(0)
  str1.each_char do |char|
    my_hash[char] += 1
  end
  str2.each_char do |char|
    my_hash[char] -= 1
  end
  my_hash.values.uniq == [0]
end

p fourth_anagram?("gizmo", "sally") #=> false
p fourth_anagram?("elvis", "lives") #true

# array = [1, 2, 5, 4]# looking for pair of 9 [ 5, 4]
# total = 9
# my_hash = Hash.new(true)
# array.each do |ele|
#   if my_hash[total - ele] == true 
#     return true
#   end
#   my_hash[ele] = true 
# end