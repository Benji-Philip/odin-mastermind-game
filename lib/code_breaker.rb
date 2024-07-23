def generate_all_possible_codes
  array_of_arrays = [[0, 0, 0, 0]]

  i = 0

  while i < 10_000
    str = '000'.concat(i.to_s) if i.to_s.length == 1
    str = '00'.concat(i.to_s) if i.to_s.length == 2
    str = '0'.concat(i.to_s) if i.to_s.length == 3
    str = i.to_s if i.to_s.length == 4
    array_of_arrays.push(str.chars.map(&:to_i))
    i += 1
  end

  array_of_arrays
end

def answer(start, secret_code)
  feedback = [0, 0, 0, 0]
  start.each_with_index do |_element, index|
    feedback[index] = 0
    feedback[index] = 1 if secret_code.include?(start[index])
    feedback[index] = 2 if start[index] == secret_code[index]
  end
  feedback
end

def selected_codes(start, feedback, all_possible_codes)
  all_possible_codes.select { |code| feedback.sort == answer(start, code).sort }
end

all_possible_codes = generate_all_possible_codes
start = [0, 0, 1, 1]
i = 0
p start
while i < 12
  i += 1
  feedback = gets.chomp.chars.map(&:to_i)
  all_possible_codes = selected_codes(start, feedback, all_possible_codes)
  start = all_possible_codes[0]
  p start
end

# compare with secret code
# get 1 0 -1 values
# then select the codes which will have the same 1 0 -1 values if they were the secret code
# take the first element of this array and repeat above
