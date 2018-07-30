require 'fileutils'
require 'pry'
require_relative 'orders_module'

module Payments

    @@orders_aux=[]

    class RestaurantCheckout

        include Orders
        
        @@order_payments=[]
        @@total_income=0

        def initialize

            #Inicializo la clase con dos nuevas ordenes para probar

            # ro=Orders::RestaurantOrder.new
            # ro.add_item
            
            # ro1=Orders::RestaurantOrder.new
            # ro1.add_item
                        
        end

        def order_pay
            
            puts "--------------------------------------------------------\n"
                 "-------------------INICIA PROCESO DE PAGO---------------\n"
                 "--------------------------------------------------------\n"

            puts "\n\nIngrese el número de la mesa que desea facturar:"
            table_num=gets.chomp.to_i
            total_payment=RestaurantOrder.table_total(table_num)

            puts "\n\n¿Desea proceder con el pago? (s) (n)\n\n"
            ans=gets.chomp

            if ans.upcase=="S"

                @@orders_aux=RestaurantOrder.return_orders

                ##binding.pry

                @@orders_aux.each do |order|
                    
                    if order[:table]==table_num.to_i
    
                        @@order_payments.push({payment_id: Time.now, table: table_num, detail: order[:detail]})
                        
                    end
                end
    
                RestaurantOrder.delete_order(table_num)
                @@total_income+=total_payment
            
            end
        end

        def get_payment
            
            @@order_payments.each_with_index do |payment, index|

                puts "------------------------------------------------\n\n"

                puts "#{index+1}. Id del pago: #{payment[:payment_id]} Mesa: #{payment[:table]} Productos:\n\n"
            
                payment[:detail].each do |payment_detail|
                    puts "#{payment_detail[:name]} --------- #{payment_detail[:price]}\n\n"
                end

                puts "------------------------------------------------\n\n"
            
            end
        end

        def total_payments

            puts "----------------------------------------------------------\n\n"
            puts "La facturación total ha sido de: #{@@total_income}\n\n"
            puts "----------------------------------------------------------\n\n"
        
        end

    end
end
