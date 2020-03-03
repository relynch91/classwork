def average(num1, num2)
    return (num1 + num2)/2.0
end

def average_array(arr)
    return arr.sum.to_f/arr.length
end

def repeat(string, num)
    new_string = ""
    num.times {new_string << string}
    new_string
end

def yell(string)
    string.upcase! + "!"
end

def alternating_case(str)
    new_str = []
    words = str.split(" ")

    words.each_with_index do |word, idx|
        if idx % 2 == 0
            new_str << (word.upcase)
        elsif idx % 2 == 1
            new_str << (word.downcase)
        end
    end
    p new_str.join(" ")
end