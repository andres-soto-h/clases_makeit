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

            file_as_array=File.read("notas.txt")

            binding.pry

            if file_as_array.length>0

                file_as_array.each_with_index do |element, index|
                
                    data=element.split(";")
                    note=data[0]
                    note=data[1]

                    puts "Id #{index} Nota: #{data[0]} Fecha: #{data[1]}"
                
                end
                
                p "--------------------------------------------------"+
                "Ingrese la posición de la nota que desea eliminar:"+
                "--------------------------------------------------"

                ans=gets.chomp

                if is_numeric?(ans)
                    file_as_array.delete_at(ans)
                else  
                    p "Ingrese un valor númerico válido."
                end
                
            end

        end

        def get_note
        
            File.open('notas.txt','a'){|line| puts("#{line}")}

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
n1.delete_note
# n1.get_note
# n1.new_note
# n1.new_note
# n1.delete_note
# n1.get_note