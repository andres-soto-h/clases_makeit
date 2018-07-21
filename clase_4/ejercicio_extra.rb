
array_mayor=[]

file_as_array=IO.readlines('datos_ej.txt')

file_as_array.each do |num|
    
    if num.to_i > 10
        array_mayor.push(num.chomp)
    end
    
end

p array_mayor



datos=""

@directorio={}

def insertar_contacto (dato)

        dato_split=dato.split(" ")
        @directorio[dato_split[0]]=dato_split[1]

end

until datos=="q"

        p "Ingrese un usuario y un teléfono separado por espacios: "
        datos=gets.chomp()
        break if datos.to_s=="q"
        insertar_contacto(datos)
        
end

p @directorio
