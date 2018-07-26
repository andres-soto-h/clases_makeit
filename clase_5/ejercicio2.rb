require 'pry'

class Telefono

    attr_accessor :calling, :contact, :phone
    
    @@devices=0
    @@total_time=0

    def initialize

        @calling=false
        @call_log=[]
        @call_ini=0
        @call_end=0
        @@devices+=1
        @directory={}
    
    end

    def self.get_devices
        p "Se han creado #{@@devices} instancias de la clase Telefono" 
    end

    def self.get_all_times
        p "La duracion de todas las llamadas realizadas es de #{@@total_time}" 
    end

    ##################  METODOS DE LA CLASE TELEFONO #####################

    def import_directory(file_name)

        n_contacts=0
    
        file_as_array=IO.readlines(file_name)
    
        

        file_as_array.each do |contact|
            
            dato_split=contact.split(";")
            
            #binding.pry
            
            @directory[dato_split[0]]=dato_split[1]
            n_contacts+=1
    
        end
    
        puts "--------------------------------------------------------------\n"+ 
        "Se importaron #{n_contacts} contactos desde el directorio local.\n"+
        "--------------------------------------------------------------\n"
    end
    
    def list_contacts(directory_name)
        directory_name.each_with_index do |(key,value),index|
            p "#{index}: Usuario:#{key} Teléfono: #{value.chop}"
        end
    end
    
    def create_contact(user_name,phone,directory_name,file_name)
        if !directory_name.has_key?(user_name)
            
            directory_name[user_name]=phone
            File.open(file_name,'a'){|file| file.puts("#{user_name};#{phone}")}
        
        else
            puts "Ya existe un usuario llamado: #{user_name} en el directorio.\n"
        end
    end
    
    def list_user_phone(user_name,directory_name)
        if directory_name.has_key?(user_name)
            "#{directory_name[user_name]}"
        else
            "No existe\n"
        end
    end
    
    def call_from_dir
        p "Ingrese un nombre para buscar:"
        user=gets.chomp
        ans=list_user_phone(user,@directory).chop

        #binding.pry

        if ans!="No existe"
            call(user,ans)
        else
            p "No se encontro el contacto en el directorio."
        end

    end

    def call(contact,phone)
        
        if !@calling

            @call_end=0

            @call_ini=0

            @calling=true
    
            @contact=contact
            
            @phone=phone

            @call_ini=Time.now.to_f

        else
            p "El teléfono está ocupado."
        end

    end

    def show_call_info

        @calling ? "Llamada con #{@contact} Tel: #{@phone} en curso..." : "No hay llamadas en curso."

    end

    def end_call

        if @calling

            @calling=false    
            
            @call_end=Time.now.to_f

            @call_dur= (@call_end-@call_ini)

            @@total_time+=@call_dur

            @current_call={contact: @contact, phone:@phone, call_dur: @call_dur}

            @call_log.push(@current_call)
        else
            p "El teléfono no está en uso."
        end
    end

    def call_history
        p @call_log
    end
    
end


# l1=Telefono.new
# l1.import_directory('../clase_4/directorio.csv')
# l1.call_from_dir
# p l1.show_call_info
# sleep(3)
# l1.end_call
# l1.call_history

# l1.call("Pedro",198292)

# sleep(3)

# l1.show_call_info

# l1.end_call

# l1.call("Jesus",8888)

# sleep(10)

# l1.end_call

# l2=Telefono.new

# l2.call("Juan",3983832)

# l2.show_call_info

# sleep(5)

# l2.end_call

# l1.call_history

# l2.call_history

# Telefono.get_devices
# Telefono.get_all_times


class Fax < Telefono

    attr_accessor :calling, :contact, :phone, :available
    
    def initialize(available)
        @available=available
        super()
    end

    def call(contact, phone, call_time_user)
        
        #binding.pry
        if !@available[:available].include?(call_time_user)
            ans_machine()
        end

        super(contact, phone)
        
    end

    def ans_machine
        p "#{@available[:custom_message]}"
        exit
    end

    def doc_send(file_read)
        
        file_as_array=File.read(file_read)

        File.write('fax_enviado.txt', file_as_array)
                
    end

end

class CellPhone < Telefono

    attr_accessor :calling, :contact, :phone
    
    def initialize
        super
    end

end


l1=Fax.new({ available: Array(8..17), custom_message: "En este momento no es posible atenderlo."})
l1.call("Andres",29291,10)
p l1.show_call_info
sleep(5)
l1.end_call
l1.call_history
l1.doc_send('archivo_fax.txt')