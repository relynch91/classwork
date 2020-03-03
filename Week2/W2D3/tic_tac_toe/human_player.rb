class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player #{@mark} enter a valid [row, col], two numbers with space in between"
        input = gets.chomp.split(" ")
        alphabet = ("A".."z").to_a
        return raise "Not a valid index" if input.length != 2
        return raise "Not a valid index" if input.any? { |ele| alphabet.include?(ele)}
        input.map { |ele| ele.to_i }
    end
end