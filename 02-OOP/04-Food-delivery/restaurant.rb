require_relative 'menu'
# require_relative 'customers_repository'

class Restaurant

  attr_reader :name, :location, :phone_number, :manager, :delivery_guys, :menu, :customers, :employees

  def initialize (attributes = {})
    @name = attributes[:name]
    @location = attributes[:location]
    @phone_number = attributes[:phone_number]
    @delivery_guys = []
    @manager = nil
    @menu = nil
    @customers = []
    @orders = []
    @employees = []
  end

   def add_menu(menu)
    @menu = menu
    @menu.restaurant = self
  end

  def add_manager(manager)
    @manager = manager
    @manager.restaurant = self
  end

  def add_delivery_guy(delivery_guy)
    @delivery_guys << delivery_guy
    delivery_guy.restaurant = self
  end

  def add_customer(customers_list)
    @customers = customers_list
    @customers.restaurant = self
  end

  def list_employees
    @employees = @delivery_guys
    @employees << @manager
  end

  def find_delivery_guy(given_name)
    @delivery_guys.each do |delivery_guy|
      return delivery_guy if delivery_guy.name == given_name
    end
    nil
  end
end

