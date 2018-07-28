require 'fileutils'
require 'pry'

module Gatgets

    class Calculator

        def sum_ab(a,b)
            a+b
        end

        def remainder(a,b)
            a-b
        end

    end

    class Thermometer
        
        def get_temperature(day_time)

            case day_time            
                when 0..9
                    p "La temperatura es #{rand(12..16)}° Centigrados."
                when 10..12
                    p "La temperatura es #{rand(22..30)} Centigrados."
                else
                    p "La temperatura es #{rand(17..20)} Centigrados."
            end

        end
    
    end

    class NotePad
        
        def initialize
            
            if !File.file?('notas.txt')
           
                p "No se encontró un archivo de notas, inicializando..."
                FileUtils.touch('notas.txt')

            end

        end

        def new_note

                p "Ingrese el texto a guardar:"
                text=gets.chomp
    
                File.open('notas.txt','a'){|file| file.puts("#{text};#{Time.now}")}

        end
        
        def delete_note

            file_as_array=IO.readlines('notas.txt')

            #binding.pry

            if file_as_array.length>0
                
                get_note
                
                puts "--------------------------------------------------\n"+
                    "Ingrese la posición de la nota que desea eliminar:\n"+
                    "--------------------------------------------------\n"

                ans=gets.chomp.to_i

                if is_numeric?(ans)

                    file_as_array.delete_at(ans)

                    if file_as_array.length>0

                        File.open('notas.txt','w'){|file| file.write("")}

                        file_as_array.each do |line|

                            File.open('notas.txt','a'){|file| file.puts("#{line.chop}")}
                        
                        end
                    
                    else

                            File.open('notas.txt','w'){|file| file.write("")}

                    end
                    
                else  
                    p "Ingrese un valor númerico válido."
                end
                
            end

        end

        def get_note
        

            puts "--------------------------------------------------\n"+
            "             Inicio de las notas:                      \n"+
            "--------------------------------------------------\n"

            
            file_as_array=IO.readlines('notas.txt')

                file_as_array.each_with_index do |element, index|
                
                    data=element.split(";")
                    note=data[0]
                    note=data[1]

                    puts "Id #{index} Nota: #{data[0]} Fecha: #{data[1]}"
                
                end


                puts "--------------------------------------------------\n"+
                "               Fin de las notas:                       \n"+
                "--------------------------------------------------\n"
    

        end

        def is_numeric?(obj) 
            obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
         end

    end

end

c1=Gatgets::Calculator.new

p c1.sum_ab(1,2)
p c1.sum_ab(3,2)

t1=Gatgets::Thermometer.new
t1.get_temperature(8)
t1.get_temperature(12)

n1=Gatgets::NotePad.new
n1.new_note
n1.new_note
n1.delete_note
n1.get_note
