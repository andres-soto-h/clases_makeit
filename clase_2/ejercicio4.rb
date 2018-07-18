


ran=rand(10-1) + 1

p "Ingrese el número a comparar:"

usr_num=gets.chomp.to_i

if usr_num==ran

    p "Ganaste! el número es #{ran}"

else

    p "Perdiste! el número es #{ran}"

end