
module Payments
  class RestaurantCheckout
    @@order_payments = []
    @@total_income = 0

    def initialize; end

    def order_pay(ordenes, total_payment, table_num)
      ordenes.each do |order|
        if order[:table] == table_num.to_i
          @@order_payments.push(payment_id: Time.now, table: table_num, detail: order[:detail])
        end
        @@total_income += total_payment
      end
    end

    def get_payment
      @@order_payments.each_with_index do |payment, index|
        puts "------------------------------------------------\n\n"
        puts "#{index + 1}. Id del pago: #{payment[:payment_id]} Mesa: #{payment[:table]} Productos:\n\n"

        payment[:detail].each do |payment_detail|
          puts "#{payment_detail[:name]} --------- #{payment_detail[:price]}\n\n"
        end
        puts "------------------------------------------------\n\n"
      end
    end

    def total_payments
      puts "----------------------------------------------------------\n\n"
      puts "La facturación total ha sido de: #{@@total_income}\n\n"
      puts "----------------------------------------------------------\n\n"
    end
  end
end
