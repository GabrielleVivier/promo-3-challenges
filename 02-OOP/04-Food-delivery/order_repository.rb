require_relative 'order'
require "csv"

class OrderRepository

  attr_reader :orders

  def initialize
    @orders = []
  end

   def add_orders(order)
    @orders << order
  end

  def delete(order_id)
    @orders.delete_at(order_id)
  end

end

  # def initialize
  #   @orders = Hash.new  # key: id, value: orders
  # end

  # def add_orders(order)
  #   @counter += 1
  #   @orders.store(@counter, order)
  # end

  # def delete_order(order_id)
  #   @orders.delete(order_id)
  # end


  # attr_reader :order_tab
  # attr_accessor :restaurant

  # def initialize(order_file_path)
  #   @order_file_path = order_file_path
  #   @order_tab = []
  #   load_csv(@order_file_path)
  # end


  # def add_order(order)
  #   @order_tab << order
  #   save
  # end

  # def save
  #   count = 0
  #   CSV.open(@order_file_path, 'w') do |csv|
  #     @order_tab.each do |meal|
  #       csv << [order.customer, order.meals, order.price, order.time, order.status]
  #     end
  #   end
  # end

  # def load_csv(file)
  #   CSV.foreach(file) do |row|
  #     each_order = { customer: row[0], meals: row[1], price: row[2], time: row[3], status: row[4] }
  #     @order_tab << Order.new(each_order)
  #   end
  # end

  #  def remove_order(order_id)
  #   @orders_tab.delete_at(recipe_id - 1)

  #   save
  # end