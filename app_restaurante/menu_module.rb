require 'fileutils'

module Menu

    class RestaurantMenu

        @@products =[]
        
        attr_reader :state

        def initialize

            @state={true: "Disponible", false: "No disponible"}
                    
            if !File.file?('data/menu.txt')
            
                p "No se encontró un archivo de menú, inicializando..."
                FileUtils.touch('data/menu.txt')

            end

        end

        def load_menu

            File.foreach('data/menu.txt') do |line|
       
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
 
            File.foreach('data/menu.txt') do |line|
       
                id, name, price, available = line.chomp.split(';')
                
                @@products.push({id: id.to_i, name: name, price: price.to_i, available: available == "true" })
                puts "#{id}\t\t#{adjust_text(name, 30)}\t\t\t#{price}\t\t #{@state[available.to_sym]}\n\n"

            end

            puts "--------------------------------------------\n"+
                 "              FIN DEL MENU\n"+
                 "--------------------------------------------\n"
        
        end

        def add_product

            puts "Ingrese los datos del producto separados por (;)\n\n"
            puts "Código\t\tNombre\t\t\t\t\t\tPrecio\t\t¿Disponible (true o false)?\n\n"

            text=gets.chomp

            File.open('data/menu.txt','a'){|file| file.puts("\n#{text}")}

        end

        def get_product_byid(product_id)

            system "clear" 
            product_exist=false
            resultado=""
            product_array=[]

            @@products.each do |product|

                if product[:id]==product_id 

                    product_array=product
                    resultado="Producto: '#{product[:name]}' Precio: $ #{product[:price]} Estado: #{@state[to_sym(product[:available])]}"
                    product_exist=true
            
                end
            
            end
            

            puts "--------------------------------------------------\n"+
            "              CONSULTA DE PRODUCTOS\n"+
            "--------------------------------------------------\n\n"

            if product_exist
                p resultado
            else
                p "El producto que buscas no existe."
            end

            product_array

        end

        def adjust_text(text, length)
            text.length < length ? text.ljust(length) : text[0...length]
        end

        def to_b(str)
            str=="true" ? true : false
        end

        def to_sym(bool)
            bool ? :true : :false
        end
    end

end

# o1=Menu::RestaurantMenu.new
# o1.load_menu
# o1.show_menu
# o1.get_product_byid(1033)
