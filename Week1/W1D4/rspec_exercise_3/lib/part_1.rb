def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    return true
end

def nth_prime(num)
    count = 0
    i = 0
    while count < num
        if is_prime?(i)
            count += 1
        end
        i += 1
    end
    return i - 1
end

def prime_range(min, max)
    range = Array.new
    i = min
    while i <= max 
        if is_prime?(i)
            range << i
        end
        i += 1
    end
    range
end

