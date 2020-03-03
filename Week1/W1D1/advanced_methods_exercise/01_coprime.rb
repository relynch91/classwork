# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    min = num_1
    min = num_2 if num_2 < num_1
    (2..min).each do |i|
        x = num_1 % i
        y = num_2 % i
        if x == 0 && y == 0
            return false
        end
    end
    true
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
