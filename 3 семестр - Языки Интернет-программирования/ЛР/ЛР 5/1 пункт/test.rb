# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class
class Test < MiniTest::Unit::TestCase
  def setup
    @array = Array.new(3) { rand(200) }
  end

  def test_1
    assert(calculate(@array[0], @array[1], @array[2]))
  end

  def test_2
    assert(calculate(@array[0], @array[1], @array[2]))
  end
end
