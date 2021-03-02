# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class
class Test < MiniTest::Unit::TestCase
  def setup
    @radius = Random.rand(200)
  end

  def test_1
    eps = 1e-3
    length = calculate(@radius, eps).round(3)
    main_length = (2 * Math::PI * @radius).round(3)
    assert_equal(length, main_length)
  end

  def test_2
    eps = 1e-4
    length = calculate(@radius, eps).round(4)
    main_length = (2 * Math::PI * @radius).round(4)
    assert_equal(length, main_length)
  end
end
