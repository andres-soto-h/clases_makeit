
intentos=0

ran=rand(1..10)

while intentos <3


    p "Ingrese el número a comparar:"

    usr_num=gets.chomp.to_i

    if usr_num==ran

        p "Ganaste! el número es #{ran}"
        intentos=3

    else

        p "Perdiste!"

        if intentos==2
            p "El número es: #{ran}"
        end

    end

intentos+=1

end

