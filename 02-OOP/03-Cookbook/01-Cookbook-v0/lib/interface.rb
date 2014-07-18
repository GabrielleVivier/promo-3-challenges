class Interface

  def display(csv_tempo)
    csv_tempo.each_with_index do |index, receipt|
      puts "#{index+1}. #{receipt}"
    end
  end

  def get_new_recipe
    puts "Which recipe do you want to add?"
    added_recipe = gets.chomp
    puts "Your #{added_recipe} has been successfully added!"
  end

  def get_recipe_to_delete
    puts "Which recipe do you want to delete?"
    deleted_recipe = gets.chomp
    puts "Your #{deleted_recipe} recipe has been sucessfully deleted!"
  end

  def exit
    puts "Goodbye my friend!"
  end

end