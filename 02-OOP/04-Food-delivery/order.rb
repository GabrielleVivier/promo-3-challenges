require_relative "menu"
require_relative "meal"

require 'time'

class Order

  attr_reader :meals, :customer, :price, :time, :delivery_guy
  attr_accessor :status

  def initialize(customer, meals, delivery_guy)
    @delivery_guy = delivery_guy
    @meals = meals
    @customer = customer
    @time = Time.now
    @status = :pending
    @price = 0
  end

  def order_price
    @meals.each do |meal|
      @price += meal.price
    end
  end

  def mark_as_done
    @status = :complete
  end

end

# def add_customer_to_order(customer)
    #   @customer = customer
    #   customer.orders << self
    # end

  # def add_meals_to_order(meal)
  #   @meals << meal
  # end

     # (meals, customer)
    # @meals = meals
    # @status = :pending
    # @customer = customer
    # customer.orders << self