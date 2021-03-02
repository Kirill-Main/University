# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class
class Test < MiniTest::Unit::TestCase
  def setup
    # XXX/ Use this code only when you have troubles on Windows with russian
    if Gem.win_platform?
      Encoding.default_external = Encoding.find(Encoding.locale_charmap)
      Encoding.default_internal = __ENCODING__

      [$stdin, $stdout].each do |io|
        io.set_encoding(Encoding.default_external, Encoding.default_internal)
      end
    end
  end

  def test_1
    array = ['я дома', 'как тут', 'находится он']
    data = ['а епнб', 'лбл уфу', 'обцпейута по']
    array = change(array)
    assert_equal(array, data)
  end

  def test_2
    array = ['я не дома', 'как ты тут']
    data = ['а ож епнб', 'лбл уь уфу']
    array = change(array)
    assert_equal(array, data)
  end
end
