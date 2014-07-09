class PlayerMoving

  Grid_POSITIONS = (1..100).to_a

  def initialize(position)
    @position = position
    @iterations = 0
    unless Grid_POSITIONS.include? @position
      raise 'Initial position must be between 1 and 100'
    end
  end

  def move(distanceInMeters)
    @position += distanceInMeters
  end

  def play
    if self.Status_Player == :play
      if rand(1..100) < 50
        move(rand(1..10))
      else
        move(-rand(1..10))
      end
    end
  end

  def cheat
    @position = 101
  end

def Status_Player
    if @position > 100
      :win
    elsif @position < 0
      :loose
    else
      :play
    end
end

  def has_Won
    Status_Player == :win
  end

end

player = Player_moving.new(50)

player.play

puts player.Status_Player == :play # true

player.cheat

puts player.has_-Won == true

begin
  Player_moving.new(110)
rescue RuntimeError => e
  puts e.to_s == "Initial position must be between 1 and 100" # true
end