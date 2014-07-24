class View

  def ask_for_name
    puts "What is your name ?"
    return gets.chomp
  end

  def ask_for_password
    puts "What is your password ?"
    return gets.chomp
  end

  def display_customers(customers_list)
    customers_list.each do |customer|
      puts "#{customer.id} - #{customer.name}, #{customer.address}"
    end
  end

  def ask_for_customer_name
    puts "What is the name of the customer?"
    return gets.chomp
  end

  def ask_for_customer_address
    puts "What is the address of the customer?"
    return gets.chomp
  end

  def display_orders(orders_tab)
    orders_tab.each_with_index do |order, index|
      puts "#{index} - #{order.customer.name} : #{order.meals}, #{order.price} - Status #{order.status} - Time #{order.time}"
    end
  end

  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index} - #{employee.name}"
    end
  end

  def ask_for_meals
    puts "What do you want to order?"
    return gets.chomp
  end

  def ask_for_delivery_guy_name
    puts "What is the name of the delivery guy you to whom you want to assign the order?"
    return gets.chomp
  end

end