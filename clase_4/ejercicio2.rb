


#Leer y escribir en un nuevo archivo
#Leer de un archivo una lista de numeros y filtrar los que sean mayores a 10

# file_as_array=File.read("datos_ej.txt")

# File.write('datos_nuevo.txt', file_as_array)

# file_as_array2=File.read("datos_nuevo.txt")

# p file_as_array2

array_mayor=[]

file_as_array=IO.readlines('datos_ej.txt')

file_as_array.each do |num|
    
    if num.to_i > 10
        array_mayor.push(num.chomp)
    end
    
end

p array_mayor





