file = File.open('input.txt')

file_data = file.readlines.map(&:chomp)

numbers_dict = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, 
                seven: 7, eight: 8, nine: 9 }

digit_sum = 0

def first_word(string)
  numbers_dict = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, 
                seven: 7, eight: 8, nine: 9 }
  first_word = []
  numbers_dict.each do |k, v|
    key = k.to_s
    value = v.to_s
    # work on searching for key and value at the same time and comparing which one's 
    # index starts first so that this function outputs the first occurance as a digit to be added to the last part
    if !string.index(key).nil?
      first_word << string.index(key)
      first_word << key
      return first_word
    end
  end
  return nil
end

def last_word(string)
  numbers_dict = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, 
                seven: 7, eight: 8, nine: 9 }
  last_word = []
  numbers_dict.each do |k, v|
    key = k.to_s

    if !string.rindex(key).nil?
      last_word << string.rindex(key)
      last_word << key
      return last_word
    end
  end
  return nil
end

file_data.each do |str|
  first_digit_idx = str.index(/\d/)
  last_digit_idx = str.rindex(/\d/)

  print first_word(str)
  print last_word(str)
  if first_digit_idx.nil? || last_digit_idx.nil?
    next
  end

  first_digit = str[first_digit_idx]
  last_digit = str[last_digit_idx]

  digit_string = first_digit + last_digit
  digit_sum += digit_string.to_i
end

puts digit_sum
puts numbers_dict