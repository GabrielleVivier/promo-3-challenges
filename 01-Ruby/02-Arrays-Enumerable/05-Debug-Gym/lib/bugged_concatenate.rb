def bugged_concatenate(array)
  concatenated_string = array.inject("") { |output, element| output.to_s + element.to_s }.upcase
end


def build_1984_title
  bugged_concatenate([1, "9", 84, " ", "George Orwell"])
end
