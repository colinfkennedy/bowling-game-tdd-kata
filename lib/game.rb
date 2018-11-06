class Game

  attr_accessor :frames

  def initialize
    @score = 0
    @frames = []
  end

  def roll(pins)
    @frames << pins
    if strike?(pins)
      @frames << 0
    end
  end

  def score
    bonus = 0
    (0..9).step(2) do |i|
      if spare?(frames[i], frames[i+1])
        bonus += frames[i+2]
      end
      if strike?(frames[i])
        bonus += frames[i+3]
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

  private def strike?(pins)
    pins == 10
  end
end
