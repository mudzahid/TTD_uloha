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
  
  def test_decimals
    assert_equal "ten", @converter.convert_number_to_words(10)
    assert_equal "twenty", @converter.convert_number_to_words(20)
    assert_equal "thirty", @converter.convert_number_to_words(30)
    assert_equal "fourty", @converter.convert_number_to_words(40)
    assert_equal "fifty", @converter.convert_number_to_words(50)
    assert_equal "sixty", @converter.convert_number_to_words(60)
    assert_equal "seventy", @converter.convert_number_to_words(70)
    assert_equal "eighty", @converter.convert_number_to_words(80)
    assert_equal "ninety", @converter.convert_number_to_words(90)
    
  end
  
  def test_cents
    assert_equal "one hundred", @converter.convert_number_to_words(100)
    assert_equal "two hundred", @converter.convert_number_to_words(200)
    assert_equal "three hundred", @converter.convert_number_to_words(300)
    assert_equal "four hundred", @converter.convert_number_to_words(400)
    assert_equal "five hundred", @converter.convert_number_to_words(500)
    assert_equal "six hundred", @converter.convert_number_to_words(600)
    assert_equal "seven hundred", @converter.convert_number_to_words(700)
    assert_equal "eight hundred", @converter.convert_number_to_words(800)
    assert_equal "nine hundred", @converter.convert_number_to_words(900)
    
  end
  
  def test_thousands
    assert_equal "one thousand", @converter.convert_number_to_words(1000)
    assert_equal "two thousand", @converter.convert_number_to_words(2000)
    assert_equal "three thousand", @converter.convert_number_to_words(3000)
    assert_equal "four thousand", @converter.convert_number_to_words(4000)
    assert_equal "five thousand", @converter.convert_number_to_words(5000)
    assert_equal "six thousand", @converter.convert_number_to_words(6000)
    assert_equal "seven thousand", @converter.convert_number_to_words(7000)
    assert_equal "eight thousand", @converter.convert_number_to_words(8000)
    assert_equal "nine thousand", @converter.convert_number_to_words(9000)
  end
  
  def test_random_number
    assert_equal "one thousand two hundred thirty four", @converter.convert_number_to_words(1234)
    assert_equal "nine thousand eight hundred sixty five", @converter.convert_number_to_words(9865)
    assert_equal "one hundred twenty three", @converter.convert_number_to_words(123)
    assert_equal "three hundred fourty five", @converter.convert_number_to_words(345)
    assert_equal "one thousand two hundred", @converter.convert_number_to_words(1200)
    assert_equal "one thousand two hundred thirty", @converter.convert_number_to_words(1230)
    assert_equal "one thousand two hundred eleven", @converter.convert_number_to_words(1211)
    assert_equal "two hundred eleven", @converter.convert_number_to_words(211)
    assert_equal "twenty one thousand one hundred twenty three", @converter.convert_number_to_words(21123)
    assert_equal "one hundred twenty three thousand four hundred fifty six", @converter.convert_number_to_words(123456)
    assert_equal "one hundred thousand one", @converter.convert_number_to_words(100001)
    assert_equal "eleven thousand three hundred twelve", @converter.convert_number_to_words(11312)
    assert_equal "one hundred thousand", @converter.convert_number_to_words(100000)
    assert_equal "one milion", @converter.convert_number_to_words(1000000)
    assert_equal "one hundred eleven milion one hundred eleven thousand one hundred eleven", @converter.convert_number_to_words(111111111)
    assert_equal "nine bilion nine hundred ninety nine milion nine hundred ninety nine thousand nine hundred ninety nine", @converter.convert_number_to_words(9999999999)
  end
  
  def test_bad_input
    assert_equal "This is not a number! Please enter an integer from 0 to 9999999999!", @converter.convert_number_to_words("string")
    assert_equal "This is not an integer! Please enter an integer from 0 to 9999999999!", @converter.convert_number_to_words(7.56)
    assert_equal "The integer is too large please enter an integer from 0 to 9999999999!", @converter.convert_number_to_words(566666663333)
  end
  
end
