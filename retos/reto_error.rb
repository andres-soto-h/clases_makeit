class Person
    attr_accessor :name
    def initialize(name="")
        if name=="" || name.nil?
            raise ArgumentError.new("El argumento es inválido") 
            @name = name
        end
    end
  end


  p=Person.new("Andres")
  p.name=nil
