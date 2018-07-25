
class Telefono

    attr_accessor :calling, :contact, :phone

    @@devices=0

    def initialize

        @calling=false
        @call_log=[]
        @call_ini=0
        @call_end=0
        @@devices+=1

    end

    def self.get_devices
        p @@devices
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

        p "Llamada con #{@contact} Tel: #{@phone} en curso..."

    end

    def end_call
        @calling=false    
        
        @call_end=Time.now.to_f

        @call_dur= (@call_end-@call_ini)

        @current_call={contact: @contact, phone:@phone, call_dur: @call_dur}

        @call_log.push(@current_call)
    end

    def call_history
        p @call_log
    end
end

l1=Telefono.new

l1.call("Pedro",198292)

sleep(3)

l1.show_call_info

l1.end_call

l1.call("Jesus",8888)

sleep(10)

l2=Telefono.new

l2.call("Juan",3983832)

l2.show_call_info

sleep(5)

l2.end_call

l1.call_history
l2.call_history

Telefono.get_devices