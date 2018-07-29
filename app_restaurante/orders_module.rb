require 'fileutils'

module Orders

    class RestaurantOrder 

        @@products =[]

        def initialize
                    
            if !File.file?('menu.txt')
            
                p "No se encontró un archivo de menú, inicializando..."
                FileUtils.touch('menu.txt')

            end

        end

        def load_menu

            File.foreach('menu.txt') do |line|
       
                id, name, price, available = line.chomp.split(';')                
                @@products.push({id: id.to_i, name: name, price: price.to_i, available: available == "true" })

            end

            puts "Menú importado correctamente...\n\n"

        end

        def show_menu

            system "clear" 

            puts "--------------------------------------------\n"+
                 "              INICIO DEL MENU\n"+
                 "--------------------------------------------\n\n"

            puts "Código\t\tNombre\t\t\t\t\t\tPrecio\t\t¿Disponible?\n\n"
            state={true: "Disponible", false: "No disponible"}

            File.foreach('menu.txt') do |line|
       
                id, name, price, available = line.chomp.split(';')
                
                @@products.push({id: id.to_i, name: name, price: price.to_i, available: available == "true" })
                puts "#{id}\t\t#{adjust_text(name, 30)}\t\t\t#{price}\t\t #{state[available.to_sym]}\n\n"

            end

            puts "--------------------------------------------\n"+
                 "              FIN DEL MENU\n"+
                 "--------------------------------------------\n"
        
        end

        def add_product
            
        end

        def get_product_bycod
        
        end

        def adjust_text(text, length)
            text.length < length ? text.ljust(length) : text[0...length]
        end

        def to_b(str)
            str=="true" ? true : false
        end

    end

end

o1=Orders::RestaurantOrder.new
o1.load_menu
o1.show_menu