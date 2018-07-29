require 'fileutils'
require_relative 'menu_module'

module Orders

    class RestaurantOrder

        include Menu

        @@orders=[]

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
                    else
                        unavailable+=1
                    end

            end

            puts "Se añadieron #{order_count} elementos a esta orden."
            puts "#{unavailable} elementos no existen o no están disponibles en el Menú."
  
            @@orders.push({id: Time.now, table: table_num, detail: @order})
          
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

# ro=Orders::RestaurantOrder.new
# ro.add_item

# ro1=Orders::RestaurantOrder.new
# ro1.add_item

# Orders::RestaurantOrder.order_resume