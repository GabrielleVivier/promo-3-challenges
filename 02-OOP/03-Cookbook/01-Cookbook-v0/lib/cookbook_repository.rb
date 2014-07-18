require "csv"

class CookBookRepository

  attr_reader :csv_tempo

  def initialize
    @cookbook_file_path = "recipes.csv"
    @csv_tempo = []
    load_csv(@cookbook_file_path)
  end

  def add(recipe)
    @csv_tempo << recipe

    save
  end

  def save
    CSV.open(@cookbook_file_path, 'w') do |csv|
      @csv_tempo.each do |recipe|
      csv << recipe
      end
    end
  end

  def load_csv(file)
    CSV.foreach(file) do |row|
      @csv_tempo << row
    end
  end

  def delete(recipe)
    index = @csv_tempo.index(recipe)
    @csv_tempo.delete_at(index)

   save
 end

end