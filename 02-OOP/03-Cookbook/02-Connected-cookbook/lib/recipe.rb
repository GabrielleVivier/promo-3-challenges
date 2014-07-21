class Recipe

  attr_reader :name, :description

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
  end

  def rating
    @rating ||= 0
  end
end