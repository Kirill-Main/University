# frozen_string_literal: true

require './main'

eps = 1e-3
# eps = 1e-4

print 'Введите радиус: '
radius = gets.chomp.to_f

length = calculate(radius, eps)

print 'length = ', length.to_s
