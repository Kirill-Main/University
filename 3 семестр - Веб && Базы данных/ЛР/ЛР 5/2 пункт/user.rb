# frozen_string_literal: true

require './main'

# XXX/ Use this code only when you have troubles on Windows with russian
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts 'Введите последовательность строк'
array = []
new_str = gets.chomp
until new_str.empty?
  array.push(new_str)
  new_str = gets.chomp
end

puts "\nИсходная последовательность: "
array.each do |str|
  puts(str)
end

array = change(array)

puts "\nНовая последовательность: "
array.each do |string|
  puts string
end
