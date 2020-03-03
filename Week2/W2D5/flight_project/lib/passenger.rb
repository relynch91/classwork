require "byebug"

class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = Array.new
    end

    def has_flight?(flight)
        #debugger
        return true if @flight_numbers.include?(flight.upcase)
        false
    end

    def add_flight(flight)
        unless has_flight?(flight)
            @flight_numbers << flight.upcase
        end
    end
end