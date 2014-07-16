class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)

  attr_accessor :height

  def initialize
    @age = 0
    @number_of_fruit = 0
    @height = height
  end

  def one_year_passes!
    if @age < 10
      @age += 1
      @height += 1
    elsif (10..100).include?@age
      @age += 1
    end
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
