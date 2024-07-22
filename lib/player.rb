# frozen_string_literal: true

# defines player data
class Player
  attr_reader :guess, :history

  def initialize
    @history = [] # array of guess arrays
    @guess = [] # guess array
    @guess_is_valid = false
  end

  def validate_guess
    @guess.map!(&:to_i)
    @guess_is_valid = @guess.all? { |element| element.between?(0, 8) && @guess.length == 4 }
  end

  def add_guess
    @guess = gets.chomp.chars
    validate_guess
    until @guess_is_valid
      puts 'Invalid guess'
      @guess = gets.chomp.chars
      validate_guess
    end
    @history.push(guess)
  end
end
