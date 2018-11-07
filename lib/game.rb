class Game
  attr_accessor :score, :rolls

  def initialize
    @score = 0
    @rolls = []
  end

  def roll(pins)
    rolls.push(pins)
  end

  def score
    frame_index = 0
    10.times do
      if is_strike?(frame_index)
        @score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif is_spare?(frame_index)
        @score += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        @score += frame_score(frame_index)
        frame_index += 2
      end
    end
    @score
  end

  private def is_strike?(frame_index)
    rolls[frame_index] == 10
  end

  private def is_spare?(frame_index)
    frame_score(frame_index) == 10
  end

  private def frame_score(frame_index)
    rolls[frame_index] + rolls[frame_index + 1]
  end

  private def strike_bonus(frame_index)
    rolls[frame_index + 1] + rolls[frame_index + 2]
  end

  private def spare_bonus(frame_index)
    rolls[frame_index + 2]
  end
end
