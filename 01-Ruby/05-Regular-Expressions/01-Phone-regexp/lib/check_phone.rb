def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number.gsub(/\-|\s/, '') =~ /^(\+336|06)\d{8}$/ ? true : false
end


#OR
#phone_number.gsub(/\-|\s/, '') =~ /^(\+336|06)[1-9]\d{7}$/ ? true : false
#phone_number =~ /^(\+33|0)\D?6(\D?\d){8}$/ ? true : false