require 'nokogiri'
require 'open-uri'

class Marmiton

  attr_reader :marmiton_recipes

  def initialize(ingredient)
    @url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}"
    @marmiton_recipes = []
  end

  def import_recipes_from_marmiton
    doc = Nokogiri::HTML(open(@url))
    @marmiton_recipes += parse_recipes(doc)
  end

  def parse_recipes(doc)
    doc.search('.m_search_result').map do |element|
      parse_recipe(element)
    end
  end

  def parse_recipe(element)
    name = element.search('.m_search_titre_recette > a').inner_text
    description = element.search('.m_search_result_part4').inner_text.strip
    rating = "#{element.search('.etoile1').size} / 5"
    Recipe.new(name: name, description: description, rating: rating)
  end

end