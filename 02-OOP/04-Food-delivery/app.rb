require_relative 'restaurant'
require_relative 'menu'
require_relative 'controller'
require_relative 'router'
require_relative 'manager'
require_relative 'employee'
require_relative 'customers_repository'

MEALS_CSV_FILE = File.join(File.dirname(__FILE__), 'meals.csv')
menu = Menu.new(MEALS_CSV_FILE)
menu.create_meal("calzone", 10)
menu.create_meal("margarita", 12)
menu.create_meal("sergio", 11)
menu.create_meal("quatro fromaggi", 13)

restaurant = Restaurant.new(name: "Maria Luisa", location: "Paris", phone_number: "0145504655")
restaurant.add_menu(menu)

manager = Manager.new("Henri", "01234")
restaurant.add_manager(manager)

delivery1 = DeliveryGuy.new("Marcel", "12234")
restaurant.add_delivery_guy(delivery1)
delivery2 = DeliveryGuy.new("John", "12234")
restaurant.add_delivery_guy(delivery2)

restaurant.list_employees

CUSTOMERS_CSV_FILE = File.join(File.dirname(__FILE__), 'customers.csv')
customers_list = CustomersRepository.new(CUSTOMERS_CSV_FILE)
customers_list.create_customer("Gabrielle", "15 avenue de Breteuil")
restaurant.add_customer(customers_list)


controller = Controller.new(restaurant)

Router.new(controller).run