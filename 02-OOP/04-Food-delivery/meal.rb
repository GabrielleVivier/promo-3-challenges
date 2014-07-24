require_relative "menu"

class Meal

  attr_reader :name, :price, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

end