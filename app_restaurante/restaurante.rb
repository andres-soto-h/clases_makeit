require_relative 'checkout_module'
require_relative 'orders_module'
require_relative 'menu_module'


class Restaurant

    include Payments
    include Orders
    
    attr_reader :ro, :ck
    
    def initialize
        
        @ro=Orders::RestaurantOrder.new
        @ck=RestaurantCheckout.new
                     
    end

    def new_order
        @ro.add_item
    end

    def proced_checkout
        @ck.order_pay
    end


    def payment_resume
        @ck.get_payment
    end

    def total_income
        @ck.total_payments
    end

end