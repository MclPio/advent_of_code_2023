# The engine schematic (your puzzle input) consists of a visual representation of the engine. 
# There are lots of numbers and symbols you don't really understand, but apparently any number adjacent to a symbol,
# even diagonally, is a "part number" and should be included in your sum. (Periods (.) do not count as a symbol.)

file = File.open('input.txt')

file_data = file.readlines.map(&:chomp)

def input_to_lines(data)
  line_array = []
  data.each do |line|
    line_array << line
  end
  line_array
end

input_array = input_to_lines(file_data)

def position_number(string)
  # Takes string input such as "467..114.."
  # Converts into numbers array: ["467", "114"]
  # Finds postion and stores in positions: [0, 5]
  # Returns a hash of { position => number }: {0=>"467", 5=>"114"}
  # Assumes there are no duplicates
  numbers = string.split(/[^0-9]/).reject { |num| num.empty? }
  positions = numbers.map { |number| string.index(number) }
  Hash[positions.zip(numbers)]
end

def positon_symbol(string)
  symbols = string.scan(/[^.\d ]/).reject { |symbol| symbol.empty? }
  positions = symbols.map { |symbol| string.index(symbol) }
  Hash[positions.zip(symbols)]
end

def check_sides(numbers, symbols)
  valid_numbers = []
  numbers.each do |n_position, n_value|
    min_pos = 0
    max_pos = n_value.length + n_position
    if n_position > 0
      min_pos = n_position - 1
    end

    symbols.each do |s_position, s_value|
      if s_position.between?(min_pos, max_pos)
        valid_numbers << n_value
      end
    end
  end
  valid_numbers unless valid_numbers.empty?
end

input_array.each do |line|
  #puts("symbols: #{positon_symbol(line)}, numbers: #{position_number(line)}")
  symbols = positon_symbol(line)
  numbers = position_number(line)
  puts check_sides(numbers, symbols)
end

# Test Input
# 467..114..
# ...2*2......
# ..35..633.
# ......#...
# 617*......
# .....+.58.
# ..592.....
# ......755.
# ...$.*....
# .664.598..
