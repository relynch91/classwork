# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".


def compress_str(string)

    result = "" #[a]
    i = 0
    
    while i < string.length
        counter = 1
        while string[i] == string[i + 1]
            counter += 1
            i += 1
        end
        
        result += counter.to_s if counter > 1
        result += string[i]
        i += 1
    end
    result
end

# def compress_srt_2(string)
#     result = ""
#     counter = 1
#     (0...string.length).each do |i|
#         if string[i] == string[i + 1]
#             counter += 1
#         end
#         if string[i] != string[i +1]
#             if counter > 1
#                 result << counter.to_s
#                 counter = 1
#             else 
#                 result << string[i}]
#             end
# end

#abb

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
