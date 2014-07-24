require_relative "restaurant"
require_relative "menu"
require_relative "meal"
require_relative "employee"
require_relative "customer"
require_relative "delivery_guy"
require_relative "manager"
require_relative "customers_repository"

# Create a restaurant

restaurant = Restaurant.new(name: "Maria Luisa", location: "Paris 10", phone_number: "0145504655")
puts restaurant
puts restaurant.name

# Add a manager

puts henri = Manager.new("Henry", "H")
puts restaurant.add_manager(henri)
puts henri.name


# Create a customer

bob = Customer.new("bob", "b")
henri.create_customer(bob)



customers = CustomersRepository.new("customers.csv")

henri.create_customer("sandrine", "10 rue d'Hauteville, 75010")

menu = Menu.new

meal_1 =
meal_2 =

menu.add_meal(meal_1)