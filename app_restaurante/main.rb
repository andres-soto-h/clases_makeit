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
        puts "5. Crear nuevo producto."
        puts "6. Ver el menú."
        puts "7. Ver producto por código."

        option=gets.chomp
    
        break if option=="q"

        case option.to_i

            when 1

                puts "\n Ingrese el número de la mesa para la orden:"                
                table_num=gets.chomp.to_i
                item_id=0
                items=[]

                until item_id=="q" do
                    puts "\n Ingrese el código del producto que desea añadir a la orden:"                
                    item_id=gets.chomp
                    items.push(item_id)
                end

                restaurante.new_order(table_num, items)

            when 2

                puts "--------------------------------------------------------\n"
                "-------------------INICIA PROCESO DE PAGO---------------\n"
                "--------------------------------------------------------\n"

                @@orders_aux=[]
                puts "\n\nIngrese el número de la mesa que desea facturar:"
                table_num=gets.chomp.to_i
                total_payment=RestaurantOrder.table_total(table_num)
                puts "\n\n¿Desea proceder con el pago? (s) (n)\n\n"
                ans=gets.chomp

                if ans.upcase=="S"
                    @@orders_aux=RestaurantOrder.return_orders
                    restaurante.proced_checkout(orders_aux)
                    RestaurantOrder.delete_order(table_num)
                end

            when 3
                restaurante.payment_resume()
            when 4        
                restaurante.total_income()
            when 5       
                restaurante.insert_menu_item()
            when 6       
                restaurante.get_menu_items()
            when 7       
                restaurante.get_item_byid()
            else
                puts "La opción ingresada no es valida.\n\n"
        end
    end

    puts "\nHasta pronto..."

end

interface()