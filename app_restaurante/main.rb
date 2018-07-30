require_relative 'restaurante'

def interface

    system "clear" 
    restaurante=Restaurant.new
    option=""

    until option=="q" do
        
        puts "\n\nBienvenido al sistema POS. Para continuar ingrese una opción:\n\n"                
        puts "1. Ingresar una orden."
        puts "2. Pagar una orden."
        puts "3. Resumen de los pagos."
        puts "4. Consultar facturación total."
        puts "5. Ingresar nuevo producto."

        option=gets.chomp
    
        break if option=="q"

        case option.to_i

            when 1
                restaurante.new_order()
            when 2
                restaurante.proced_checkout()
            when 3
                restaurante.payment_resume()
            when 4        
                restaurante.total_income()
            when 5       
                restaurante.insert_menu_item()
            else
                puts "La opción ingresada no es valida.\n\n"
        end
    end

    puts "\nHasta pronto..."

end

interface()