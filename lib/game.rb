# frozen_string_literal: true

# defines the game methods
class Game
  attr_reader :won

  def initialize
    @won = false
    @feedback = [-1, -1, -1, -1]
    @turn = 1
    @computer = Computer.new
    @computer.create_secret_code
    @player = Player.new
  end

  def calculate_results
    @won = true if @player.guess == @computer.secret_code
    @feedback.each_with_index do |_element, index|
      @feedback[index] = -1
      @feedback[index] = 0 if @computer.secret_code.include?(@player.guess[index])
      @feedback[index] = 1 if @player.guess[index] == @computer.secret_code[index]
    end
    @feedback.sort
  end

  def end_round
    puts 'Yes!!' if @won
    puts "The secret code is #{@computer.secret_code.join}"
  end

  def start_round
    until @turn > 12 || @won

      @player.add_guess
      calculate_results
      @turn += 1
    end
    end_round
  end
end
