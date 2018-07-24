class Telefono

    attr_accessor :calling

    def initialize
        @calling=false
    end
    
    def call
        if !@calling
            @calling=true
        else
            p "El teléfono está ocupado"
        end
    end

    def show_call_info

    end

    def end_call

    end

    def call_history
    
    end
end