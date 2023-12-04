file = File.open('input.txt')

file_data = file.readlines.map(&:chomp)

#Sample Input:
# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
# Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
# Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
# Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
# Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

#Bag_content: 12 red, 13 green, 14 blue 
#Sum of IDs which should be 8 because game 1, 2, 5 are possible

reference_hash = {'red' => 12, 'green' => 13, 'blue' => 14}
test_hash = {'red' => 0, 'green' => 20, 'blue' => 0 }

def hash_valid?(reference_hash = {'red' => 12, 'green' => 13, 'blue' => 14}, test_hash)
  # Takes 2 hashes of red, green, blue format and compares if test hash is bigger than reference with same color key
  # returns true if all values of test are smaller, false if any of them are bigger
  # ex: test_hash = {'red' => 0, 'green' => 20, 'blue' => 0 }, reference_hash = {'red' => 12, 'green' => 13, 'blue' => 14}
  #     returns false as test_hash['green'] > reference_hash['green']
  test_hash.each do |k, v|
    return false if v > reference_hash[k]
  end
  true
end

def str_to_hash(str)
  # str from input format will be converted to a hash
  # ex1: 1 red, 2 green, 6 blue -> {"red"=>1, "green"=>2, "blue"=>6}
  # ex2: 2 green -> {"red"=>0, "green"=>2, "blue"=>0}

  str = str.split(',')
  hash = { 'red' => 0, 'green' => 0, 'blue' => 0 }

  str.each do |item|
    num = item.scan(/\d/).join('').to_i
    if item.include?('red')
      hash['red'] = num
    elsif item.include?('green')
      hash['green'] = num
    elsif item.include?('blue')
      hash['blue'] = num
    end
  end
  hash
end

def test_game(data)
  valid_games = []

  data.each do |line|
    line_arr = line[7..].split(';')
    game_number = line[..7].scan(/\d/).join('').to_i
    line_arr.each_with_index do |round, index|
      current_hash = str_to_hash(round)
      round_is_valid = hash_valid?(current_hash)

      break unless round_is_valid

      next unless index == line_arr.length - 1

      valid_games << game_number
    end
  end
  valid_games.sum
end

#puts hash_valid?(reference_hash, test_hash)
#puts str_to_hash('2 green')
puts test_game(file_data)
