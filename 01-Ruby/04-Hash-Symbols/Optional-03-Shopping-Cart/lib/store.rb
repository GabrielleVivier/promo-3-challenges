# This file contains methods related to your store and its supplies.
# You should complete it according to the instructions in the TODO comments

def store_items
  store = {
    yogurts: 2,
    meat: 7,
    vegetables: 5,
    potatoes: 2,
    rice: 1
  }
  return store
end

def is_product_in_store?(product)
  store_product = store_items
  store_product.has_key?(product.to_sym.downcase)
end

def price_of_product(product)
  price = 0
  if is_product_in_store?(product)
    store_product = store_items
    price += store_product[product.to_sym]
  else
    price = nil
  end
  return price
end

def store_items_to_s
  string = ""
  store_product = store_items
  store_product.each do |key, value|
    string += "- #{key}: #{value}€\n"
  end
  string
end
