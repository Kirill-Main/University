# frozen_string_literal: true

def calculate(x_num, y_num, z_num)
  Math.log((y_num - x_num.abs**0.5) * 1.0 / (x_num - y_num * 1.0 / (z_num + x_num**2)))
end
