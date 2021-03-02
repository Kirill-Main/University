# frozen_string_literal: true

def change(array)
  new_array = []
  array.each do |str|
    new_str = ''
    str.split.each do |word|
      word.each_char do |letter|
        new_str += letter != 'я' ? (letter.ord + 1).chr : 'а'
      end
      new_str += ' ' unless str.end_with? word
    end
    new_array.push(new_str)
  end
  new_array
end
