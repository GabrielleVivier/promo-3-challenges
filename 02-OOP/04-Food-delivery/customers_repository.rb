require_relative "customer"

require "csv"

class CustomersRepository

  attr_reader :customers_repository
  attr_accessor :restaurant

  def initialize(customer_file_path)
    @customer_file_path = customer_file_path
    @customers_repository = []
    load_csv(@customer_file_path)
  end

  def create_customer(name, address)
    id = next_id
    customer = Customer.new(id: id, name: name, address: address)
    @customers_repository << customer
    save
  end

  def find_customer(given_name)
    @customers_repository.each do |customer|
      return customer if customer.name == given_name
    end
    nil
  end

  def next_id
    @customers_repository.map(&:id).last.to_i + 1
  end

  def save
    CSV.open(@customer_file_path, 'w') do |csv|
      @customers_repository.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv(file)
    CSV.foreach(file) do |row|
      each_customer = { id: row[0], name: row[1], address: row[2] }
      @customers_repository << Customer.new(each_customer)
    end
  end

end


