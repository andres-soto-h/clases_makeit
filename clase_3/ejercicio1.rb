

elementos=ARGV[0].to_i

array=[]
suma=0
promedio=0
par=0
impar=0
pares=[]
impares=[]

elementos.times do |i|

    array.push(rand(1..100))
    suma+=array[i]

    if array[i]%2==0
        par+=1
        pares.push(array[i])
    else
        impar+=1
        impares.push(array[i])
    end

end

p "El array tendrá #{elementos} elementos" 

p "El array es: #{array}"

p "La suma de los números es: #{suma}"

p "El promedio de los números es : #{suma/elementos}"

p "Existen #{par} par y #{impar} impar en el arreglo"

p "Pares:#{pares} Impares: #{impares}"