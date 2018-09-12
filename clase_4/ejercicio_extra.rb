# App para leer datos de un directorio de telefonos e imprimir información.

@directory = {}

def import_directory(file_name)
  n_contacts = 0

  file_as_array = IO.readlines(file_name)

  file_as_array.each do |contact|
    dato_split = contact.split(';')
    @directory[dato_split[0]] = dato_split[1]
    n_contacts += 1
  end

  puts "--------------------------------------------------------------\n" \
       "Se importaron #{n_contacts} contactos desde el directorio local.\n" \
       "--------------------------------------------------------------\n"
end

def list_contacts(directory_name)
  directory_name.each_with_index do |(key, value), index|
    p "#{index}: Usuario:#{key} Teléfono: #{value.chop}"
  end
end

def create_contact(user_name, phone, directory_name, file_name)
  if !directory_name.key?(user_name)

    directory_name[user_name] = phone
    File.open(file_name, 'a') { |file| file.puts("#{user_name};#{phone}") }

  else
    puts "Ya existe un usuario llamado: #{user_name} en el directorio.\n"
  end
end

def list_user_phone(user_name, directory_name)
  if directory_name.key?(user_name)
    puts "El teléfono es: #{directory_name[user_name]} \n"
  else
    puts "Lo sentimos, la persona que buscas no existe.\n"
  end
end

import_directory('directorio.csv')

option = 0

until option.to_s == 'q'

  puts "---------------------Ingrese una opción:---------------------\n" \
       "1. Ingresar nuevo contacto. \n" \
       "2. Buscar un teléfono. \n" \
       "3. Listar directorio de contactos. \n" \
       "Para salir ingrese q y presione la tecla enter.\n"
  option = gets.chomp

  break if option.to_s == 'q'

  case option.to_i

  when 1
    p 'Ingrese un nombre:'
    user = gets.chomp
    p 'Ingrese un teléfono:'
    phone = gets.chomp
    create_contact(user, phone, @directory, 'directorio.csv')
  when 2
    p 'Ingrese un nombre para buscar:'
    user = gets.chomp
    list_user_phone(user, @directory)
  when 3
    list_contacts(@directory)
  else
    puts "La opción seleccionada no es válida, intente nuevamente.\n"
  end

end
