class Restaurant

  #TODO add relevant accessors if necessary

  attr_reader :average_rating, :city

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0
    @ratings = []
  end

  #TODO: implement #filter_by_city and #rate methods

  def self.filter_by_city(restaurants, city)
    restaurants_list = []
    restaurants.each do |restaurant|
    restaurants_list << restaurant if restaurant.city == city
    end
    restaurants_list
  end

  def rate(rating)
    @ratings << rating
    @average_rating = (@ratings.inject(:+)) / (@ratings.size)
  end

end
