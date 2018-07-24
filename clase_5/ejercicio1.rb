class Bus

    attr_accessor :speed, :passengers, :seating

    def initialize(seating)
        @seating=seating
        @speed=0
        @passengers=0
    end

    def acelerate(acel)
        @speed+=acel
    end

    def breaks
        @speed=0
    end

    def add_passengers(n)
        if (@passengers+n)<@seating
            @passengers+=n
            @seating-=n
        else
            p "El bus está lleno, solo pueden subir #{@seating} pasajeros"
            @passengers+=@seating
            @seating=0
        end
    end

    def leave_passengers(n)
        if (@passengers-n)>0
            @passengers-=n
        else
            p "El bus está vacio, solo pueden bajar #{@passengers} pasajeros"
            @passengers=0
        end
    end

end

b1=Bus.new(10)

p "Velocidad: #{b1.speed}" 

b1.acelerate(10)

p "Velocidad: #{b1.speed}" 

b1.acelerate(10)

p "Velocidad: #{b1.speed}" 

p "Pasajeros: #{b1.passengers}" 

p "Asientos: #{b1.seating}" 

b1.add_passengers(5)

p "Pasajeros: #{b1.passengers}" 

p "Asientos: #{b1.seating}" 

b1.breaks

p "Velocidad: #{b1.speed}" 

b1.add_passengers(6)

p "Asientos: #{b1.seating}" 

p "Pasajeros: #{b1.passengers}" 

b1.add_passengers(2)
