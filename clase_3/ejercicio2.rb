

datos=""

@directorio={}

p "Ingrese un usuario y un teléfono separado por espacios: "

def insertar_contacto (dato)

        dato_split=dato.split(" ")

        @directorio[dato_split[0]]=dato_split[1]

end

until datos=="q"

        
        datos=gets.chomp()
        
        break if datos.to_s=="q"

        p "Ingrese un usuario y un teléfono separado por espacios: "
        
        insertar_contacto(datos)
        
end



p @directorio
