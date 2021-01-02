# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class
class Test < MiniTest::Unit::TestCase
  def test_1
    func1 = ->(x) { Math.sin(x) * 1.0 / x }
    intg1 = intg(1, 0.1, func1) { |x| Math.sin(x) * 1.0 / x }
    assert_equal(intg(1, 0.1, func1), intg1)
  end

  def test_2
    func2 = ->(x) { Math.tan(x + 1) * 1.0 / (x + 1) }
    intg2 = intg(2, 1, func2) { |x| Math.tan(x + 1) * 1.0 / (x + 1) }
    assert_equal(intg(2, 1, func2), intg2)
  end
end
