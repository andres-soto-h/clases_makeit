require 'pry'

class Bus

    attr_accessor :speed, :passengers, :seating

    @@passengers_tot=0
    
    def initialize(seating)
        @seating=seating
        @speed=0
        @passengers=0
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


class MicroBus < Bus

    attr_accessor :routes
        
    def initialize(seating, routes)
        @routes=routes
        super(seating)
    end

    def validate_route(route_time)
        
        @routes.each do |key, value|

            dato_split=value.split("-")
            time_ini=dato_split[0].to_i
            time_end=dato_split[1].to_i

            if  route_time>=time_ini && route_time<=time_end
                p "La ruta de este bus es: #{key}"
            end

        end

    end
end


class SuperBus < Bus

    @@total_super_bus=0

    def initialize(seating, price)
        @price=price
        @money=0
        super(seating)
    end

    def add_passengers(n)
        super
        @money+=(n*@price)
        @@total_super_bus+=(n*@price)
    end

    def get_money
        p "En este bus has recaudado #{@money}"
    end
    
    def self.get_total_money
        p "En todos los buses has recaudado #{@@total_super_bus}"
    end
end

# b1=MicroBus.new(10,{ruta1: "6-9", ruta2: "10-12", ruta3: "13-17"})
# b1.add_passengers(5)
# p "Pasajeros: #{b1.passengers}" 
# b1.add_passengers(6)
# p "Pasajeros: #{b1.passengers}" 
# b1.validate_route(10)
# b1.validate_route(14)


b2=SuperBus.new(15,500)
b2.add_passengers(2)
p "Pasajeros: #{b2.passengers}" 
b2.add_passengers(3)
p "Pasajeros: #{b2.passengers}" 
b2.validate_route(10)
b2.validate_route(14)

