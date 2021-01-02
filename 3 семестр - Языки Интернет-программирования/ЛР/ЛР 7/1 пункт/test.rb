# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test class
class Test < MiniTest::Unit::TestCase
  def setup
    File.delete('output.txt') if File.exist?('output.txt')
  end

  def test_1
    File.open('input.txt', 'w') do |file|
      file.write("ahelloag\nlloaawdwdwadwdwadw\naaoooooaap\n")
    end
    open_file('input.txt')
    assert(File.exist?('output.txt'))
    array = File.readlines 'output.txt'
    assert_equal(array[0], "hg\n")
    assert_equal(array[1], "awdd\n")
    assert_equal(array[2], "aoap\n")
  end

  def test_2
    File.open('input.txt', 'w') do |file|
      file.write("aaff\nhelloasammaarat\n")
    end
    open_file('input.txt')
    assert(File.exist?('output.txt'))
    array = File.readlines 'output.txt'
    assert_equal(array[0], "af\n")
    assert_equal(array[1], "smart\n")
  end
end
