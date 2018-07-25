require 'pry'

class Bus

    attr_accessor :speed, :passengers, :seating

    def initialize(seating)
        @seating=seating
        @speed=0
        @passengers=0
        @@passengers_tot=0
    end

    def self.all_passengers
        p "En todos los buses tenemos #{@@passengers_tot} pasajeros"
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
            @@passengers_tot+=n
            @seating-=n
        else
            p "El bus está lleno, solo pueden subir #{@seating} pasajeros"
            @passengers+=@seating
            @@passengers_tot+=@seating
            @seating=0
        end
    end

    def leave_passengers(n)
        if (@passengers-n)>0
            @passengers-=n
            @@passengers_tot-=n
            @seating+=n
        else
            p "El bus está vacio, solo pueden bajar #{@passengers} pasajeros"
            @passengers=0
            @@passengers_tot=0
        end
    end

end

b1=Bus.new(10)
b2=Bus.new(15)

b1.add_passengers(5)

p "Pasajeros: #{b1.passengers}" 

b1.add_passengers(6)

p "Pasajeros: #{b1.passengers}" 

b2.add_passengers(2)

p "Pasajeros: #{b2.passengers}" 


binding.pry

Bus.all_passengers

