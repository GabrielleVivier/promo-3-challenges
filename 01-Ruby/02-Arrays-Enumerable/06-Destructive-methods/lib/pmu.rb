def pmu_format!(race_array)
  #TODO: modify the given array so that it is PMU-consistent

  horses_number = race_array.size
  i = 0
  while i < horses_number
    race_array[i] = "#{i + 1}-#{race_array[i]}!"
    i = i + 1
  end
  race_array = race_array.reverse!
end



puts pmu_format!(["Abricot du Laudot", "Black Caviar", "Brigadier Gerard"])

