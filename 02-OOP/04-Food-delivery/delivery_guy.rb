class DeliveryGuy < Employee

  attr_reader :access

  def initialize(name, password)
    super(name, password)
    @access = false
  end

  # def complete_order(order)
  #   @order.status = :complete
  # end

end