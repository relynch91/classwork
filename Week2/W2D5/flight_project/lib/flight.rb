class Flight
    def initialize(flight, capacity)
        @flight_number = flight
        @capacity = capacity
        @passengers = Array.new
    end
    
    def passengers
        @passengers
    end

    def full?
        @passengers.length >= @capacity? true : false
    end

    def board_passenger(passenger)  
        if !full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end
    def list_passengers
        answer = Array.new
        @passengers.each do |passenger|
            answer << passenger.name
        end
        answer 
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger) 
        board_passenger(passenger)
    end
end