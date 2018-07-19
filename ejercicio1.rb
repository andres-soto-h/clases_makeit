

elementos=ARGV[0].to_i

array=[]
suma=0
promedio=0

elementos.times do |i|

    array.push(rand(1..100))
    suma+=array[i]

end

p "El array tendrá #{elementos} elementos" 

p "El array es: #{array}"

p "La suma de los números es: #{suma}"

p "El promedio de los números es : #{suma/elementos}"