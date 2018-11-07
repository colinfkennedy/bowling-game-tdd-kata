require "game"

def roll_many(pins, times)
  times.times do
    game.roll(pins)
  end
end

def roll_spare
  game.roll(5)
  game.roll(5)
end

def roll_strike
  game.roll(10)
end

describe Game do
  let(:game) { Game.new }

  describe "#roll" do
    it "responds to #roll" do
      expect(game).to respond_to(:roll)
    end
  end

  describe "#score" do
    it "responds to #roll" do
      expect(game).to respond_to(:score)
    end

    it "Gutter game scores zero - When you roll all misses, you get a total score of zero." do
      roll_many(0, 20)
      expect(game.score).to eq(0)
    end

    it "All ones scores 20 - When you knock down one pin with each ball, your total score is 20." do
      roll_many(1, 20)
      expect(game.score).to eq(20)
    end

    it "A spare in the first frame, followed by three pins, followed by all misses scores 16." do
      roll_spare

      game.roll(3)

      roll_many(0, 17)
      expect(game.score).to eq(16)
    end

    it "A strike in the first frame, followed by three and then four pins, followed by all misses, scores 24." do
      roll_strike
      game.roll(3)

      game.roll(4)

      roll_many(0, 16)
      expect(game.score).to eq(24)
    end

    it "A perfect game (12 strikes) scores 300" do
      roll_many(10, 12)
      expect(game.score).to eq(300)
    end
  end
end
