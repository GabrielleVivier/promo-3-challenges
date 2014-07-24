require_relative 'restaurant'
require_relative 'employee'

class Manager < Employee

  def manager?
    true
  end

  # def create_customer(customer)
  #   restaurant.customers << customer
  #   customer.restaurant = restaurant
  # end

  # def take_order(order)
  #   restaurant.orders << order
  # end


  # def assign(order, delivery_guy)
  #   order.status = :assigned
  #   delivery_guy.orders << order
  #   order.delivery_guy = delivery_guy
  # end

end





