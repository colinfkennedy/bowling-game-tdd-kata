class Game

  attr_accessor :frames, :count

  def initialize
    @score = 0
    @frames = []
    @count = 0
  end

  def roll(pin)
    @frames << pin
    @count += 1
  end

  def score
    bonus = 0
    (0..9).step(2) do |i|
      if spare?(frames[i], frames[i+1])
        bonus += frames[i+2]
      end
    end
    frame_sum + bonus
  end

  private def spare?(roll1, roll2)
    roll1 + roll2 == 10
  end

  private def frame_sum
    @frames.reduce(0, :+)
  end
end
