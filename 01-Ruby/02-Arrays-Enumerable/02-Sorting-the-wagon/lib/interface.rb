require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name

  # TODO: Add the name we just gotto the students array
  students<<name
end while name != ""

# TODO: Call `wagon_sort` method and display the sorted student list

students.delete("")
sorted_students = wagon_sort(students)
number_students = sorted_students.count

puts "Congratulations! Your Wagon has #{number_students} students:"
index_maximum = number_students - 1
sentence_beginning = "-" + "#{sorted_students[0..(index_maximum-1)].join(', ')}"
sentence_ending = " and " + "#{sorted_students[index_maximum]}"
puts sentence_beginning + sentence_ending