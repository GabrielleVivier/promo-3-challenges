# This file contains methods related to your shopping cart.
# You should complete it according to the instructions in the TODO comments

def add_to_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  cart << product
end

def cart_to_s(cart)
  # TODO: you get a cart, return a coma-separated String list of the contained products
  string = ""
  cart.each_with_index do |product, index|
    if index == cart.count - 1
      string += "#{product}"
    else
      string += "#{product},"
    end
  end
  return string
end

def cart_total_price(cart, store_items)
  # TODO: you get a cart and the store items with their prices. Return the total
  # price of the shopping cart
  total_price = 0
  cart.each do |product|
    if price_of_product(product).nil?
      total_price += 0
    else
      total_price += price_of_product(product)
    end
  end
  return total_price
end
