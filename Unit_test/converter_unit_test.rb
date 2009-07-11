#!/usr/bin/env ruby

require "test/unit"
require "../converter"

class ConverterUnitTest < Test::Unit::TestCase
  
  def setup
    @converter = Converter.new
  end
  
  def test_first_twenty_numbers
    assert_equal "zero", @converter.convert_number_to_words(0)
    assert_equal "one", @converter.convert_number_to_words(1)
    assert_equal "two", @converter.convert_number_to_words(2)
    assert_equal "three", @converter.convert_number_to_words(3)
    assert_equal "four", @converter.convert_number_to_words(4)
    assert_equal "five", @converter.convert_number_to_words(5)
    assert_equal "six", @converter.convert_number_to_words(6)
    assert_equal "seven", @converter.convert_number_to_words(7)
    assert_equal "eight", @converter.convert_number_to_words(8)
    assert_equal "nine", @converter.convert_number_to_words(9)
    assert_equal "ten", @converter.convert_number_to_words(10)
    assert_equal "eleven", @converter.convert_number_to_words(11)
    assert_equal "twelve", @converter.convert_number_to_words(12)
    assert_equal "thirdteen", @converter.convert_number_to_words(13)
    assert_equal "fourteen", @converter.convert_number_to_words(14)
    assert_equal "fifteen", @converter.convert_number_to_words(15)
    assert_equal "sixteen", @converter.convert_number_to_words(16)
    assert_equal "seventeen", @converter.convert_number_to_words(17)
    assert_equal "eighteen", @converter.convert_number_to_words(18)
    assert_equal "nineteen", @converter.convert_number_to_words(19)
  end
  
end
