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

    end

end

c1=Gatgests::Calculator.new

p c1.sum_ab(1,2)

p c1.sum_ab(3,2)
