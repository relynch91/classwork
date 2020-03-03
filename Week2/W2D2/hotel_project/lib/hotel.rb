require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = Hash.new
        rooms.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name 
        @name.split(" ").map do |word|
            word.capitalize
        end.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(name, room)
        if !room_exists?(room)
            p "sorry, room does not exist" 
        else
            if @rooms[room].add_occupant(name)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.any? do |key, value|
            !value.full?
        end
            
    end
    
    def list_rooms
        @rooms.each do |key, value|
            puts "#{key} #{value.available_space}"
            # p "#{room.key} #{room.available_space}"
        end
    end
end
