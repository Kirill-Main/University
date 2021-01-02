# frozen_string_literal: true

def intg(b, a, func)
  h = 1e-5
  n = (b - a) / h
  result = 0
  x = a
  (1..n).each do |_i|
    result += block_given? ? yield(x) : func.call(x)
    x += h
  end
  result * (b - a) * 1.0 / n
end
