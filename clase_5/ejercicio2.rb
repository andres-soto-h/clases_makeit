class Telefono

    attr_accessor :calling, :contact, :phone

    def initialize

        @calling=false
        @call_log=[]
        @call_ini=0
        @call_end=0
    
    end
    
    def call(contact,phone)
        
        if !@calling

            @call_end=0

            @call_ini=0

            @calling=true
    
            @contact=contact
            
            @phone=phone

            @call_ini=Time.now.to_i

            @call_dur= (@call_end-@call_ini)

            @current_call={contact: @contact, phone:@phone, call_dur: @call_dur}

        else
            p "El teléfono está ocupado."
        end

    end

    def show_call_info

        p "Llamada con #{@contact} en curso..."

    end

    def end_call
        @calling=false    
        @call_end=Time.now.to_i
        @current_call
        
        @call_log.push(@current_call)
    end

    def call_history
        p @call_log
    end
end

l1=Telefono.new


# Se debe crear ciclo infinito con opciones + conectar con directorio