# frozen_string_literal: true

# Calculate class
class Calculate
  include Enumerable

  def initialize(radius)
    @radius = radius
  end

  def each
    side = @radius
    i = 6
    prev = sum = i * side
    loop do
      prev = sum
      side = Math.sqrt(2 * @radius * @radius - 2 * @radius * Math.sqrt(@radius * @radius - side * side * 1.0 / 4))
      i *= 2
      sum = i * side
      yield prev, sum
    end
  end
end
