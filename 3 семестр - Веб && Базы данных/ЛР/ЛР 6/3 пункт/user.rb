# frozen_string_literal: true

require './main'

puts 'Первый способ (в виде lambda-выражения): '

func1 = ->(x) { Math.sin(x) * 1.0 / x }
func2 = ->(x) { Math.tan(x + 1) * 1.0 / (x + 1) }
puts "Первый интеграл равен #{intg(1, 0.1, func1)}"
puts "Второй интеграл равен #{intg(2, 1, func2)}"

puts "\n\Второй способ (в виде блока): "

intg1 = intg(1, 0.1, func1) { |x| Math.sin(x) * 1.0 / x }
intg2 = intg(2, 1, func2) { |x| Math.tan(x + 1) * 1.0 / (x + 1) }
puts "Первый интеграл равен #{intg1}"
puts "Второй интеграл равен #{intg2}"
