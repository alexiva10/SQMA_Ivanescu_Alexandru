require "minitest/autorun"

# Calculator class definition
class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    raise ArgumentError, "Cannot divide by zero" if b == 0
    a / b.to_f
  end
end

# Unit tests for Calculator class
class CalculatorTest < Minitest::Test
  def setup
    @calculator = Calculator.new
  end

  def test_add
    assert_equal 5, @calculator.add(2, 3)
    assert_equal 0, @calculator.add(-1, 1)
  end

  def test_subtract
    assert_equal 1, @calculator.subtract(3, 2)
    assert_equal -2, @calculator.subtract(-1, 1)
  end

  def test_multiply
    assert_equal 6, @calculator.multiply(2, 3)
    assert_equal -3, @calculator.multiply(-1, 3)
    assert_equal 0, @calculator.multiply(0, 5)
  end

  def test_divide
    assert_in_delta 2.5, @calculator.divide(5, 2), 0.001
    assert_in_delta -2.5, @calculator.divide(-5, 2), 0.001
  end

  def test_divide_by_zero
    assert_raises(ArgumentError) { @calculator.divide(5, 0) }
  end
end
