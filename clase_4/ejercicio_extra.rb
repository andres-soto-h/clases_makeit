#App para leer datos de un directorio de telefonos e imprimir información.

@directory={}

def import_directory(path,file_name)

    n_contacts=0

    file_as_array=IO.readlines(file_name)

    file_as_array.each do |contact|
        
        dato_split=contact.split(";")
        @directory[dato_split[0]]=dato_split[1]
        n_contacts+=1

    end

    p "Se importaron #{n_contacts} de namera exitosa."

end

def list_contacts(directory_name)
    directory_name.each_with_index do |(key,value),index|
        p "#{index} Usuario:#{key} Teléfono: #{value}"
    end
end

