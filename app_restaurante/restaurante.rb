require_relative 'checkout_module'
require_relative 'orders_module'
require_relative 'menu_module'


class Restaurant

    include Payments
    include Orders
    
    attr_reader :ck
    
    def initialize
        
        @ck=Payments::RestaurantCheckout.new
                     
    end

    def new_order
        ro=Orders::RestaurantOrder.new
        ro.add_item
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