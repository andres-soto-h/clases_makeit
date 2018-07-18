

arreglo=[1,2,true,false,"hola"]


arreglo.each_with_index do |element, index|

    puts "#{index}: #{element}"

end


arreglo[1]="Andres"

arreglo.push('jacobo')

arreglo<<"Pepe"

arreglo.insert(3,'Sebastian')

arreglo.delete_at(3)

arreglo.each_with_index do |element, index|

    puts "#{index}: #{element}"

end


p arreglo.reverse
p arreglo


p arreglo.reverse!
p arreglo


array_string=%w{1 2 jose juan 4 5 sebastian Pepe}

p array_string

# p array_string+arreglo

# p array_string-arreglo

p array_string & arreglo


###Comparacion

p ["Pedro",1]<=>["Pedro",2]


p ["Pedro",1]<=>["Pedro",1]


p ["Pedro",1]<=>["Juan",1]


p arreglo[0]


ARGV.each do |arg|
    puts arg
end

