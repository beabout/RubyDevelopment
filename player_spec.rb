# Author: Clay Beabout
# Updated: Jan 9, 2019

require_relative 'player'
require 'rspec' #guarantees use of rspec methods

describe Player do

  #removes method outputs from console
  before do
    $stdout = StringIO.new
  end

  #initialize instance variables for the file
  before do
    @initial_health = 150
    @player = Player.new("larry",@initial_health)
  end

  #has a capitalized name
  it "has a capitalized name" do
    @player.name.should == "Larry"
  end

  #has an initial health
  it "has an initial health" do
    @player.health.should == 150
  end

  #has a string representation
  it "has a string representation" do
    @player.to_s.should == "Larry has a health of 150 (Strong)"
  end

  #computes a score as the sum of its health and length of name
  it "computes a score as the sum of its health and length of name" do
    @player.score.should == 155
  end

  #increases health by 15 when w00ted
  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == 165
  end

  #decreases health by 10 when blammed
  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == 140
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end

  context "with health higher than 150" do
    before do
      @player = Player.new("Larry",150)
    end
    it "is strong" do
      @player.strong?.should == true
    end
  end

  context "with health lower than 150" do
    before do
      @player = Player.new("Larry",100)
    end
    it "is wimpy" do
      @player.should_not be_strong
    end
  end

end
