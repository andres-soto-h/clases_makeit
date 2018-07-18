


# ran=rand(10-1) + 1

# p "Ingrese el número a comparar:"

# usr_num=gets.chomp.to_i

# if usr_num==ran

#     p "Ganaste! el número es #{ran}"

# else

#     p "Perdiste! el número es #{ran}"

# end

p "Ingrese su peso: (Kg)"

peso=gets.chomp.to_f

p "Ingrese su estatura: (m)"

estat=gets.chomp.to_f

bmi=(peso/(estat**2))

p "Tu indice de masa corporal es de: #{bmi}"

if bmi<18.5

    p "Tu peso es BAJO."

elsif bmi<25

    p "Tu peso es NORMAL."

else

    p "Tienes SOBREPESO"

end