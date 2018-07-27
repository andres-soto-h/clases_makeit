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
        p "En este bus has recaudado $ #{@money}"
    end
    
    def self.get_total_money
        p "En todos los buses has recaudado $ #{@@total_super_bus}"
    end
end


module Conexiones

    class GPS

        attr_reader :lat_lng

        def initialize()
            @lat_lng=[]
        end

        def location    
            lat_lng.push(rand(-90.0000000..90.0000000))
            lat_lng.push(rand(-180.0000000..180.0000000))
        end

    end

    class Internet

        def speed
            p "La velocidad de conexión es: #{rand(5.00..20.00).round(2)} MB"
        end

    end

    class TV

        attr_accessor :channels

        def initialize(channel_list)
            @channels=channel_list
        end

        def movie_on_channel(channel_name)
            if @channels.has_key?(channel_name) 
            
                list=@channels[channel_name]
                n=rand(0..list.length-1)
                p "Estamos presentando: #{list[n]} en #{channel_name.to_s.upcase}"

            else

                p "No tienes #{channel_name.to_s.upcase} en tu paquete de TV."
            
            end
        end

    end


    class Climate

        def get_forecast(day_time)

            try=0
            forecast_result=0

            options={soleado: Array(7..10), lluvia: Array(11..12), nublado: Array(13..16)}

            options.each do |key,value|

            if value.include?(day_time)  
                    p "El pronóstico para las #{day_time} es: #{key.to_s}"
                else 
                    try+=1
                end
            
            end

            if try==3
                 p "No hay pronosticos para las #{day_time}"
            end

        end

    end
    
end

puts "--------------------------------------------------------------\n" +
"                      SISTEMAS ADICIONALES DEL BUS                 \n" +
"--------------------------------------------------------------" 

GPS1=Conexiones::GPS.new
p "La ubicación es: #{GPS1.location}"
internet1=Conexiones::Internet.new
internet1.speed

tv_programs={hbo: ['Game of Thrones','Westworld','Big Little Lies'],
    fox: ['The Simpsons','Family Guy'], 
    discovery: ['A Crime To Remember','Alaska: The Last Frontier'] }

tv1=Conexiones::TV.new(tv_programs)
tv1.movie_on_channel(:hbo)
tv1.movie_on_channel(:caracol)
tv1.movie_on_channel(:discovery)

for1=Conexiones::Climate.new

puts "--------------------------------------------------------------\n" +
"                      INICIA PRONÓSTICO DEL CLIMA                  \n" +
"--------------------------------------------------------------" 

for1.get_forecast(8)
for1.get_forecast(11)
for1.get_forecast(14)
for1.get_forecast(22)


# p "-------------RESULTADOS RUTAS---------------"

# b0=MicroBus.new(10,{ruta1: "6-9", ruta2: "10-12", ruta3: "13-17"})
# b0.add_passengers(5)
# p "Pasajeros: #{b0.passengers}" 
# b0.add_passengers(6)
# p "Pasajeros: #{b0.passengers}" 
# b0.validate_route(10)
# b0.validate_route(14)

# p "-------------RESULTADOS SUPER BUS 1---------------"

# b2=SuperBus.new(15,500)
# b2.add_passengers(2)
# p "Pasajeros: #{b2.passengers}" 
# b2.add_passengers(3)
# p "Pasajeros: #{b2.passengers}" 
# b2.get_money()


# p "-------------RESULTADOS SUPER BUS 2 + TOTAL DE RECAUDO---------------"

# b3=SuperBus.new(15,500)
# b3.add_passengers(1)
# p "Pasajeros: #{b3.passengers}" 
# b3.add_passengers(1)
# p "Pasajeros: #{b3.passengers}" 
# b3.get_money()

# SuperBus.get_total_money

