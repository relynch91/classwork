class Game

    attr_accessor :current_player

    def initialize(*players)
        @players = players
        @current_player = @players[0]
        @fragment = ""
        @dictionary = Set.new
        File.open("dictionary.txt").each do |line|
            @dictionary.add(line.chomp)
        end
    end

    def play_round

    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players.rotate!
    end

    def take_turn
        played = false
        until played
            input = gets.chomp
            if valid_play?(input)
                played = true
                @fragment += input
            else
                puts "invalid play, try again"
            end
        end
    end

    def valid_play?
        @dictionary.each { |word| return true if word.include?(@fragment) }
        false
    end

end


