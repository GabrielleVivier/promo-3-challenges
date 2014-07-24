require_relative "restaurant"
require_relative "menu"
require_relative "meal"
require_relative "employee"
require_relative "customer"
require_relative "delivery_guy"
require_relative "manager"
require_relative 'view'
require_relative "customers_repository"
require_relative "order_repository"
require_relative "order"

class Controller

  def initialize(restaurant)
    @view = View.new
    @restaurant = restaurant
    @menu = restaurant.menu
    @customer_list = restaurant.customers
    @employees = restaurant.employees
    @orders = OrderRepository.new
  end

  def access
    given_name = @view.ask_for_name
    password = @view.ask_for_password
    employee = Employee.find_employee(@employees, given_name)
    authentification = authenticate?(employee, password)
    if authentification == true
      if employee.manager? == true
        return "MANAGER"
      else
        return "DELIVERY"
      end
    else
      return "ACCESS DENIED"
    end
  end

  def authenticate?(employee, password)
    if employee.nil?
      return false
    end
    if employee.password == password
      return true
    else
      return false
    end
  end

  def list_customers
    @view.display_customers(@customer_list.customers_repository)
  end

  def add_a_customer
    customer_name = @view.ask_for_customer_name
    customer_address = @view.ask_for_customer_address
    @customer_list.create_customer(customer_name, customer_address)
  end

  def view_orders
    @view.display_orders(@orders.orders)
  end

  def add_order
    customer_name = @view.ask_for_customer_name
    customer = @customer_list.find_customer(customer_name)
    meals = @view.ask_for_meals
    meals = meals.split(' ')
    meal_tab = []
    meal_tab.each do |meal|
      meal_tab << @menu.find_meal(meal)
    end
    delivery_guy_name = @view.ask_for_delivery_guy_name
    delivery_guy = @restaurant.find_delivery_guy(delivery_guy)
    order = Order.new(customer, meal_tab, delivery_guy)
    order.order_price
    @orders.add_orders(order)
  end

  def list_employees
    @view.display_employees(@employees)
  end


end