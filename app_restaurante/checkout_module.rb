require 'fileutils'
require_relative 'orders_module'

module Payments

    class RestaurantCheckout

        include Orders

        @@order_payments=[]
        @@total_income=0

        def initialize

            #Inicializo la clase con dos nuevas ordenes para probar

            ro=Orders::RestaurantOrder.new
            ro.add_item
            
            ro1=Orders::RestaurantOrder.new
            ro1.add_item
                        
        end

        def order_pay
            
            puts "Ingrese el número de la mesa que desea facturar:"
            table_num=gets.chomp.to_i
            total_payment=RestaurantOrder.table_total(table_num)

            puts "¿Desea proceder con el pago? (SI) (NO)"
            ans=gets.chomp
            table_index=0

            if ans=="SI"

                @@total_income+=total_payment

                RestaurantOrder.@@orders.each do |order|
                
                    if order[:table]==table_num
    
                        @@order_payments.push(RestaurantOrder.order)
                        
                    end

                end
     
            end
        end
    end
end

