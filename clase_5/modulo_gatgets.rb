module Gatgests

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

    end

end

c1=Gatgests::Calculator.new

p c1.sum_ab(1,2)
p c1.sum_ab(3,2)


t1=Gatgests::Thermometer.new
t1.get_temperature(8)
t1.get_temperature(12)
