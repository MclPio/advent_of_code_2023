file = File.open('input.txt')

file_data = file.readlines.map(&:chomp)
instructions = file_data[0].split('')
# convert data line into hash table {"AAA" => ["BBB", "BBB"]}

hash_table = Hash.new
file_data[2..].each do |line|
  hash_table[line[0..2]] = line[7..-2].split(', ')
end

def start_nodes(table)
  # returns all keys ending with A
  hash = Hash.new()
  table.each do |k, v|
    hash[k] = v if k[2] == 'A'
  end
  hash
end

xxa_nodes = start_nodes(hash_table)

def end_nodes(table)
  # returns all keys ending with Z
  hash = Hash.new()
  table.each do |k, v|
    hash[k] = v if k[2] == 'Z'
  end
  hash
end

def ghost(hash_table, navigation, table_a)
  table_one = table_a
  table_two = {}
  instructions = navigation.cycle
  count = 0

  loop do
    table_two = {}
    direction = instructions.next
    #puts("#{table_one}, #{direction}")
    table_one.each do |_node, option|
      if direction == 'L'
        table_two[option[0]] = hash_table[option[0]]
      elsif direction == 'R'
        table_two[option[1]] = hash_table[option[1]]
      end
    end
    table_one = {}
    table_one = table_two
    count += 1
    break if key_end_with_z?(table_one)
  end
  count
end

def key_end_with_z?(table)
  memory = []
  table.each do |k, _v|
    if k[2] != 'Z'
      memory << false
    elsif k[2] == 'Z'
      memory << true
    end
  end
  memory.all?
end

def navigate(map, instructions)
  counter = 0
  current_line = map['AAA']
  direction = instructions.cycle
  current_direction = direction.next
  loop do
    counter += 1
    if current_direction == 'L'
      break if current_line[0] == 'ZZZ'
      current_line = map[current_line[0]]
    elsif current_direction == 'R'
      break if current_line[1] == 'ZZZ'
      current_line = map[current_line[1]]
    end
    current_direction = direction.next
  end
  counter
end

#puts navigate(hash_table, instructions)

puts ghost(hash_table, instructions, xxa_nodes)