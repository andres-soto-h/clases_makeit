require 'fileutils'
require_relative 'menu_module'

module Orders

    class RestaurantOrder

        @@orders=[]

        include Menu

        attr_reader :menu, :order

        def initialize
            @menu=RestaurantMenu.new
            @menu.load_menu
            @order=[]
        end

        def add_item
            
            item_id=""
            order_count=0
            table_num=0
            unavailable=0
            order_cost=0

            puts "\n Ingrese el número de la mesa para la orden:"                
            table_num=item_id=gets.chomp.to_i

            until item_id=="q" do

                @menu.show_menu
                
                puts "\n Ingrese el código del producto que desea añadir a la orden:"                
                item_id=gets.chomp
                
                break if item_id=="q"
                
                order_element=@menu.get_product_byid(item_id.to_i)

                    if order_element.length>0 && order_element[:available]
                        @order.push(order_element)
                        order_count+=1
                        order_cost+=order_element[:price]
                    else
                        unavailable+=1
                    end

            end

            puts "Se añadieron #{order_count} elementos a esta orden por un valor de: $#{order_cost}"
            puts "#{unavailable} elementos no existen o no están disponibles en el Menú."
  
            @@orders.push({id: Time.now, table: table_num, detail: @order})
          
        end

        def self.table_total(table_num_usr)
            
            total_money_tbl=0
            table_num=table_num_usr

            puts "--------------------------------------------------\n"+
            "              RESUMEN DE COMPRA\n"+
            "--------------------------------------------------\n\n"

            @@orders.each do |order|
                
                if order[:table]==table_num

                    puts "\n\nHora: #{order[:id]} Mesa: #{order[:table]} Detalle:\n\n"
                    
                    product=order[:detail]

                    product.each_with_index do |prod,index|
                        puts "#{index+1}: #{prod[:name]} Precio: #{prod[:price]}"
                        total_money_tbl+=prod[:price]
                    end
                    
                end
            end

            puts "\n\nTotal a pagar: $#{total_money_tbl}"

            total_money_tbl
        end

        def self.return_orders
            return @@orders
        end

        def self.delete_order(table_num)
        
            @@orders.each_with_index do |order,index|
                
                if order[:table]==table_num.to_i
                    @@orders.delete_at(index)
                end

            end

        end

        def self.order_resume

            puts "--------------------------------------------------\n"+
            "              RESUMEN DE PEDIDOS\n"+
            "--------------------------------------------------\n\n"

            @@orders.each do |order|
                puts "\n\nHora: #{order[:id]} Mesa: #{order[:table]} Detalle:\n\n"
                
                product=order[:detail]

                product.each_with_index do |prod,index|
                    puts "#{index+1}: #{prod[:name]}"
                end

            end

        end
        
    end

end
