# frozen_string_literal: true

# defines computer variables and methods
class Computer
  attr_reader :secret_code

  def initialize
    @secret_code = []
  end

  def create_secret_code
    i = 0
    temp = []
    array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    while i < 4
      i += 1
      temp.push(array.sample)
    end
    @secret_code = temp
  end
end
