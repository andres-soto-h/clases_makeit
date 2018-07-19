
datos=""

directorio={}

p "Ingrese un usuario y un teléfono separado por espacios: "
        
until datos=="q"

        datos=gets.chomp()
        
        break if datos.to_s=="q"

        p "Ingrese un usuario y un teléfono separado por espacios: "
        
        dato_split=datos.split(" ")
        p dato_split
        
        directorio[dato_split[0]]=dato_split[1]
        
end

p directorio
