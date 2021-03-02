# frozen_string_literal: true

require './main'

print 'Введите x: '
x = gets.chomp.to_f
print 'Введите y: '
y = gets.chomp.to_f
print 'Введите z: '
z = gets.chomp.to_f
result = calculate(x, y, z)
puts 'a = ', result
