class Card
    attr_reader :face_value
    attr_accessor :directions
    def initialize(face_value, directions)
        @face_value = face_value
        @directions = directions #true = face up , false = face down
        
    end

    def display_info
         return @face_value if @directions == true
    end

    def hide
        @directions = false
    end

    def reveal 
        @directions = true
        self.display_info
    end

    def to_s
        @face_value.to_s
    end

    def ==(instance)
        self.face_value == instance.face_value
    end


end

a= Card.new(10,true)
p a.reveal
