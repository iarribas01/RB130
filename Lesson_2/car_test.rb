require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
Minitest::Reporters.use!
SimpleCov.start

require_relative 'car'

class CarTest < MiniTest::Test

  def setup 
    @car = Car.new
    @other_car = Car.new
  end

  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end

  def test_equal
    assert_equal(@other_car, @car)
    assert(@other_car.is_a? Car)
    assert_equal(@other_car.name, @car.name)
  end

  def test_wheels
    assert_equal(nil, @car.wheels)
    assert_raises(ArgumentError) {Car.new(6)}
  end

  def test_custom_equality
    assert(@other_car == @car)
  end

  # def test_bad_wheels
  #   skip "not finished writing this test"
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  # def test_car_exists
  #   assert(@car)
  # end

  # def test_wheels
  #   assert_equal(4, @car.wheels)
  # end

  # def test_name_is_nil
  #   assert_nil(@car.name)
  # end

  # def test_raise_initialization_with_arg
  #   assert_raises(ArgumentError) do
  #     Car.new(name: "Joey")
  #   end
  # end

  # def test_instance_of_car
  #   assert_instance_of(Car, @car)
  # end

  # def test_includes_car
  #   arr = [1, 2, 3]
  #   arr << @car
  #   assert_includes(arr, @car)
  # end
end