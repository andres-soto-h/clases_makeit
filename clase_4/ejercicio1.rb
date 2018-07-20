

p "Ingrese un texto:"

texto=gets.chomp
text_reverse=texto.reverse.upcase

p "El texto ingresado al reves es: #{text_reverse}" 

if texto.upcase==text_reverse 
    p "El texto es un Palíndromo #{texto.upcase}: #{text_reverse}"
else
    p "El texto es no es un Palíndromo"
end

