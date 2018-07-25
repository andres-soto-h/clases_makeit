

require 'pry'




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


until option.to_s=="q"

    puts "clear"+
      "---------------------Ingrese una opción:---------------------\n"+
      "1. . \n"+
      "2. Buscar un teléfono. \n"+
      "3. Listar directorio de contactos. \n"+
      "Para salir ingrese q y presione la tecla enter.\n"
    option=gets.chomp()
    
    break if option.to_s=="q"

    case option.to_i

        when 1
            p "Ingrese un nombre:"
            user=gets.chomp
            p "Ingrese un teléfono:"
            phone=gets.chomp
            create_contact(user,phone,@directory,'directorio.csv')          
        when 2
            p "Ingrese un nombre para buscar:"
            user=gets.chomp
            list_user_phone(user,@directory)
        when 3
            list_contacts(@directory)
        else
            puts "La opción seleccionada no es válida, intente nuevamente.\n"
    end
    
end




# Se debe crear ciclo infinito con opciones + conectar con directorio