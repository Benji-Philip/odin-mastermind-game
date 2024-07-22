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
    puts ''
    puts "Computer has chosen it's secret-code"
    @player = Player.new
    @history = []
  end

  def calculate_results
    @won = true if @player.guess == @computer.secret_code
    @player.guess.each_with_index do |_element, index|
      @feedback[index] = -1
      @feedback[index] = 0 if @computer.secret_code.include?(@player.guess[index])
      @feedback[index] = 1 if @player.guess[index] == @computer.secret_code[index]
    end
  end

  def present_results
    @player.history.each_with_index do |element, index|
      puts "#{element},#{@history[index]}"
    end
    puts ''
    puts "#{12 - @turn} guesses left" unless @won
  end

  def end_round
    puts 'Yes!!' if @won
    puts "The secret code is #{@computer.secret_code.join}"
    puts "You've guessed it in #{@turn} guesses!" if @won
  end

  def start_round
    until @turn > 12 || @won
      puts "\nEnter your guess :"
      @player.add_guess
      calculate_results
      @history.push(@feedback.sort.reverse)
      present_results
      puts ''
      @turn += 1 unless @won
    end
    end_round
  end
end
