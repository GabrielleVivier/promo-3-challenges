
  #TODO: sing the song
ARGV[0].to_i
nb_at_start = ARGV[0].to_i
if ARGV.empty?
  puts "No argument"
else
  for i in (0..nb_at_start-1)
    if nb_at_start-i > 1
      puts "#{nb_at_start-i} bottles of beer on the wall, #{nb_at_start-i} bottles of beer!" + "\n"
      puts "Take one down, pass it around, #{nb_at_start-i-1} bottles of beer on the wall!"
    else
      puts "1 bottle of beer on the wall, 1 bottle of beer!" + "\n"
      puts "Take one down, pass it around, no more bottles of beer on the wall!"
    end
  end
end




#> 5 bottles of beer on the wall, 5 bottles of beer!
#> Take one down, pass it around, 4 bottles of beer on the wall!
#> 4 bottles of beer on the wall, 4 bottles of beer!
#> Take one down, pass it around, 3 bottles of beer on the wall!
#> 3 bottles of beer on the wall, 3 bottles of beer!
#> Take one down, pass it around, 2 bottles of beer on the wall!
#> 2 bottles of beer on the wall, 2 bottles of beer!
#> Take one down, pass it around, 1 bottle of beer on the wall!
#> 1 bottle of beer on the wall, 1 bottle of beer!
#> Take one down, pass it around, no more bottles of beer on the wall!