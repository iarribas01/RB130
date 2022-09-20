require 'minitest/autorun'
require_relative 'test'

class RestaurantTest < Minitest::Test 
  def test_serve_food
    restaurant = Restaurant.new
    input = StringIO.new("let's eat!\n")
    output = StringIO.new
    restaurant.serve_food(input: input, output: output)
  end
end