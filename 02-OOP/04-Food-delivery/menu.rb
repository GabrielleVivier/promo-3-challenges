require_relative 'meal'
require "csv"

class Menu

  attr_reader :menu_tab
  attr_accessor :restaurant

  def initialize(menu_file_path)
    @menu_file_path = menu_file_path
    @menu_tab = []
    load_csv(@menu_file_path)
  end


  def create_meal(name, price)
    id = next_id
    meal = Meal.new(id: id, name: name, price: price)
    @menu_tab << meal
    save
  end

  def next_id
    @menu_tab.map(&:id).last.to_i + 1
  end

  def find_meal(given_name)
    @menu_tab.each do |meal|
      return meal if meal.name == given_name
    end
    nil
  end

   def save
    CSV.open(@menu_file_path, 'w') do |csv|
      @menu_tab.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv(file)
    CSV.foreach(file) do |row|
      each_meal = { id: row[0], name: row[1], price: row[2] }
      @menu_tab << Meal.new(each_meal)
    end
  end


end



