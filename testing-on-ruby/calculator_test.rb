require 'minitest/autorun'
require_relative 'calculator'

class CalculatorTest < Minitest::Test
  def setup
    @calculator = Calculator.new
  end

  def teardown
    puts 'After each test'
  end

  def test_adds_two_positive_numbers
    assert_equal 5, @calculator.add(2, 3)
    assert_equal 12, @calculator.add(4, 8)
    assert_equal 6, @calculator.add(3, 3)
    # refuse_equal
  end

  def test_multiply_two_numbers
    assert_equal 6, @calculator.multiply(2, 3)
    assert_equal 4, @calculator.multiply(-2, -2)
  end

  def test_divide_two_positive_numbers
    assert_equal 3, @calculator.divide_by(6, 2)
    assert_equal (2/4), @calculator.divide_by(2, 4)
  end

  def test_substract_two_positive_numbers
    assert_equal 5, @calculator.substract(8, 3)
  end

  def test_class_of_instance
    assert_instance_of Calculator, @calculator
  end

  def test_includes
    assert_includes @calculator.array_by_two([1, 2, 3]), 6
    # refuse_includes
  end
end
