require 'open-uri'
require 'json'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  array = ("A".."Z").to_a
  generated_grid = []
  for i in (1..grid_size)
    generated_grid << array[rand(27)]
  end
  generated_grid
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  hash = {}
  hash[:time] = end_time - start_time
  if check_if_included?(attempt, grid)
    if translation(attempt).nil?
      hash[:translation] = nil
      hash[:score] = 0
      hash[:message] = "not an english word"
    else
      hash[:translation] = translation(attempt)
      hash[:score] = "#{attempt.split(//).count + 1.to_f / (end_time - start_time)}"
      hash[:message] = "well done"
    end
  else
    hash[:translation] = translation(attempt)
    hash[:score] = 0
    hash[:message] = "not in the grid"
  end
  return hash
end

def check_if_included?(attempt, grid)
  letters = attempt.upcase.split(//)
  letters.all? { |letter| letters.count(letter) <= grid.count(letter) }
end

def translation(attempt)
  translated_word = ""
  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
  api_return = {}
  open(api_url) do |stream|
    api_return = JSON.parse(stream.read)
  end
  if api_return.has_key?("Error")
    translated_word = nil
  else
    translated_word = api_return["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
  end
  return translated_word
end

