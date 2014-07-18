class View

  def display(recipes_list)
    @recipes_list.each_with_index do |index, element|
      puts "#{index+1}. #{element[:name]} #{element[:description]}"
    end
  end

  def get_new_recipe
    puts "Which recipe do you want to add?"
    added_recipe = gets.chomp
    puts "Your #{added_recipe} has been successfully added!"
    return added_recipe
  end

  def get_id_to_remove
    puts "Which recipe do you want to delete? (Give the id)"
    deleted_recipe = gets.chomp.to_i
  end

  def exit
    puts "Goodbye my lover, goodbye my friend!"
  end

end