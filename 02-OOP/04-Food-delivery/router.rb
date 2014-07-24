require_relative 'controller'

class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the Food Delivery App!"
    puts "           --           "
    begin
    access = @controller.access
    end while access == "ACCESS DENIED"
    if access == "MANAGER"
        puts "Your access is #{access}"
        while @running
          display_tasks_manager
          action = gets.chomp.to_i
          print `clear`
          case action
          when 1 then @controller.list_customers
          when 2 then @controller.add_a_customer
          when 3 then @controller.view_orders
          when 4 then @controller.add_order
          when 5 then @controller.list_employees
          when 6 then stop
          end
        end
    elsif access == "DELIVERY GUY"
        puts "Your access is #{access}"
    end
  end

  def stop
    @running = false
  end

  private

  def display_tasks_manager
    puts ""
    puts "What would you like to do?"
    puts "Options:"
    puts "1 - List customers"
    puts "2 - Add customer "
    puts "3 - View orders"
    puts "4 - Add order"
    puts "5 - List employees"
    puts "6 - Log out"
  end

end

    # display_tasks_manager
  #     action = gets.chomp.to_i
  #     print `clear`
  #     case action
  #     when 1 then @controller.add_a_manager
  #     when 2 then @controller.add_delivery_guys
  #     when 3 then @controller.add_a_meal
  #     when 4 then
  #     when 5 then stop
  #     else puts "Please press 1, 2, 3, 4 or 5"
  #     end
  #   end
  # end