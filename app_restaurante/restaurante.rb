require_relative 'checkout_module'
require_relative 'orders_module'
require_relative 'menu_module'

class Restaurant

    include Payments
    include Orders
    include Menu

    attr_reader :ck, :menu_local, :ro, :order 
    
    def initialize
        @menu_local=Menu::RestaurantMenu.new 
        @ck=Payments::RestaurantCheckout.new  
        @order=[]       
    end

    def new_order(table, items) 
        order_count=0
        order_cost=0
        unavailable=0
        item_id=0
        @ro=Orders::RestaurantOrder.new

        items.each do |item|
        
            order_element=@menu_local.get_product_byid(item)
            
            if order_element.length>0 && order_element[:available]
                @order.push(order_element)
                order_count+=1
                order_cost+=order_element[:price]
            else
                unavailable+=1
            end

        end
        
        @ro.add_item(table, @order)

        puts "Se añadieron #{order_count} elementos a esta orden por un valor de: $#{order_cost}"
         
        if unavailable>0
            puts "#{unavailable} productos no estaban disponibles."
        end
    end

    def proced_checkout(table_num, ans)

        orders_aux=[]

        if ans.upcase=="S"
            #binding.pry
            total_payment=Orders::RestaurantOrder.table_total(table_num)
            orders_aux=Orders::RestaurantOrder.return_orders
            @ck.order_pay(orders_aux,total_payment, table_num)
            Orders::RestaurantOrder.delete_order(table_num)
        end
        
    end

    def payment_resume
        @ck.get_payment
    end

    def total_income
        @ck.total_payments
    end

    def insert_menu_item
        @menu_local.add_product()
    end

    def get_menu_items
        @menu_local.show_menu
    end

    def get_item_byid
        puts "\n\nIngrese el código del producto a buscar:"
        product_id=gets.chomp.to_i
        @menu_local.get_product_byid(product_id)
    end

end