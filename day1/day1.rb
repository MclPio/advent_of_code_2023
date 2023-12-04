file = File.open('input.txt')

file_data = file.readlines.map(&:chomp)

def first_word(string)
  numbers_dict = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }
  first_word = {}

  numbers_dict.each do |k, v|
    key = k.to_s
    value = v.to_s
    first_spelled_digit_idx = string.index(key)
    first_digit_idx = string.index(value)
    first_word[first_digit_idx] = value
    first_word[first_spelled_digit_idx] = value
  end

  first_word.delete(nil)

  if first_word.empty?
    nil
  else
    first_word.min[1]
  end
end

def last_word(string)
  numbers_dict = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }
  last_word = {}

  numbers_dict.each do |k, v|
    key = k.to_s
    value = v.to_s
    first_spelled_digit_idx = string.rindex(key)
    first_digit_idx = string.rindex(value)
    last_word[first_digit_idx] = value
    last_word[first_spelled_digit_idx] = value
  end

  last_word.delete(nil)
  if last_word.empty?
    nil
  else
    last_word.max[1]
  end
end

def calibration_sum(data)
  number_sum = 0
  data.each do |str|
    number_sum += (first_word(str) + last_word(str)).to_i
    puts("#{first_word(str)} + #{last_word(str)} = #{(first_word(str) + last_word(str)).to_i} #{number_sum} --> #{str}")
  end
  number_sum
end

puts calibration_sum(file_data)
