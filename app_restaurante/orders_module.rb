require 'fileutils'

module Orders

    class RestaurantOrder

        @@orders=[]

        attr_reader :order

        def initialize
            @order=[]
        end

        def add_item(table_num, order)
            @@orders.push({id: Time.now, table: table_num, detail: order})
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
