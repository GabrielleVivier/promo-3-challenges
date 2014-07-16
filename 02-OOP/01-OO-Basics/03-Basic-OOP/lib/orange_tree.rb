class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)

  attr_accessor :height, :fruits

  def initialize()
    @age = 0
    @fruits = 0
    @height =  0
  end

  def one_year_passes!
    if @age < 10
      @age += 1
      @height += 1
    elsif (10..100).include?(@age)
      @age += 1
    end
    update_fruits
  end

  def dead?
  probability_array = Array.new(50, true)
    if @age <= 50
      false
    elsif @age == 100
      true
    elsif @age < 100
      (@age-50).times { |n| probability_array[n] = false }
      probability_array.sample
    end
  end

  def pick_a_fruit!
    @fruits -= 1
  end

  private

  def update_fruits
    if @age <= 5 || @age > 15
      @fruits = 0
    elsif @age <= 10
      @fruits = 100
    elsif @age <= 15
      @fruits = 200
    end
  end

end
