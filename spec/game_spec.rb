require_relative "../lib/game"

describe Game do

  describe "#roll" do
    it "responds to #roll" do
      game = Game.new
      expect(game).to respond_to(:roll)
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
  end

  describe "#score" do
    it "responds to #roll" do
      game = Game.new
      expect(game).to respond_to(:score)
    end
  end
end
