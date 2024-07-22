# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/computer'
require_relative 'lib/game'

# 12 turns
# 4 colors
# guess the code
# numbers are 0 1 2 3 4 5 6 7 8 9
# computer generates 4 digit code
# player has 12 chances to guess it right
# computer checks if any number exists in the code
# computer checks if the number is in the correct position if it does exist in the code
# if player guesses within 12 turns they win otherwise they lose

# components - player computer game game-rounds secret-code guesses feedback history-of-player

puts 'You will get 12 tries to figure out the secret code. Enter your guess as a 4 digit secret code (eg. 1234)'
puts "\n-1 implies a digit is not part of the code"
puts '0 implies a digit exists in the code'
puts '1 implies a digit is in the correlates to the same position as in the secret code'
puts 'order of the feedback does not correlate with the digits position in the guess or the secret code'
stop_playing = false
until stop_playing
  game = Game.new
  game.start_round
  puts 'Congraattss!!' if game.won
  puts "\nPlay again?(yes/no)"
  reply = gets.chomp
  if reply.downcase != 'yes' && reply.downcase != 'no' && reply.downcase != 'y' && reply.downcase != 'n'
    puts 'Invalid input'
  end
  puts ''
  stop_playing = true if reply.downcase == 'no' || reply.downcase == 'n'
end
