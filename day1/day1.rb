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

    if first_spelled_digit_idx.nil?
      if first_digit_idx.nil?
        next
      else
        first_word[first_digit_idx] = value
      end
    else
      first_word[first_spelled_digit_idx] = value
    end
  end

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

    first_spelled_digit_idx = string.index(key)
    first_digit_idx = string.index(value)

    if first_spelled_digit_idx.nil?
      if first_digit_idx.nil?
        next
      else
        last_word[first_digit_idx] = value
      end
    else
      last_word[first_spelled_digit_idx] = value
      #logic missing version where both digit and word are not nil
    end
  end
  puts last_word
  if last_word.empty?
    nil
  else
    last_word.max[1]
  end
end

def calibration_sum(data)
  number_sum = 0
  data.each do |str|
    if str.include?('oneight')
      number_sum += (first_word(str) + last_word(str)).to_i
      puts("#{first_word(str)} + #{last_word(str)} = #{number_sum} --> #{str}")
    end
  end
  number_sum
end

puts calibration_sum(file_data)
