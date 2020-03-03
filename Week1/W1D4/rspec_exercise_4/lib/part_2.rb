def proper_factors(num)
    answer = Array.new
    (1...num).each do |i|
        answer << i if num % i == 0
    end
    answer
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(number)
    perf_numbs = Array.new
    i = 1
    while perf_numbs.length < number
        perf_numbs << i if perfect_number?(i)
        i += 1
    end
    perf_numbs
end