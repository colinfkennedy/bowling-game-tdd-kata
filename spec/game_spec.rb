require_relative "../lib/game"

describe Game do

  describe "#roll" do
    it "responds to #roll" do
      game = Game.new
      expect(game).to respond_to(:roll)
    end
  end

  describe "#score" do
    it "responds to #roll" do
      game = Game.new
      expect(game).to respond_to(:score)
    end

    it "all misses score a zero" do
      game = Game.new
      20.times do
        game.roll(0)
      end
      expect(game.score).to eq(0)
    end

    it "all ones score 20" do
      game = Game.new
      20.times do
        game.roll(1)
      end
      expect(game.score).to eq(20)
    end

    it "A spare in the first frame, followed by three pins, followed by all misses scores 16." do
      game = Game.new
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times do
        game.roll(0)
      end
      expect(game.score).to eq(16)
    end

    it "A strike in the first frame, followed by three and then four pins, followed by all misses, scores 24." do
      game = Game.new
      game.roll(10)
      game.roll(3)
      game.roll(4)
      17.times do
        game.roll(0)
      end
      expect(game.score).to eq(24)
    end

    it "A perfect game (12 strikes) scores 300." do
      game = Game.new
      game.roll(10)
      game.roll(3)
      game.roll(4)
      17.times do
        game.roll(0)
      end
      expect(game.score).to eq(24)
    end
  end
end
