require "minitest/autorun"

# Car class definition
class Car
  attr_reader :make, :model, :year

  def initialize(make, model, year)
    raise ArgumentError, "Year must be a positive integer" unless year.is_a?(Integer) && year.positive?

    @make = make
    @model = model
    @year = year
  end
end

# Unit tests for Car class
class CarTest < Minitest::Test
  def test_constructor_valid_input
    car = Car.new("Toyota", "Corolla", 2020)
    assert_equal "Toyota", car.make
    assert_equal "Corolla", car.model
    assert_equal 2020, car.year
  end

  def test_constructor_invalid_year
    assert_raises(ArgumentError) { Car.new("Honda", "Civic", -2020) }
    assert_raises(ArgumentError) { Car.new("Honda", "Civic", "2020") }
    assert_raises(ArgumentError) { Car.new("Honda", "Civic", 0) }
  end

  def test_constructor_missing_arguments
    assert_raises(ArgumentError) { Car.new("Ford", "Mustang") }
    assert_raises(ArgumentError) { Car.new("Ford") }
    assert_raises(ArgumentError) { Car.new }
  end
end
