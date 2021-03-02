# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class
class Test < MiniTest::Unit::TestCase
  def test_1
    surname = 'Ivanov'
    age = 57
    year = 2020
    ill = IllUpgrade.new(surname, age, year)
    assert(ill.is_a?(Ill))
    assert(ill.instance_of?(IllUpgrade))
  end

  def test_2
    surname = 'Petrov'
    age = 60
    ill = Ill.new(surname, age)
    assert(ill.instance_of?(Ill))
  end
end
