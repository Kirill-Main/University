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

print 'Введите фамилию больного: '
surname = gets.chomp

print 'Введите возраст больного: '
age = gets.chomp

print 'Введите год последней диспанцеризации: '
year = gets.chomp

puts "\n\n"
ill = IllUpgrade.new(surname, age, year)
ill.write
ill.determine
