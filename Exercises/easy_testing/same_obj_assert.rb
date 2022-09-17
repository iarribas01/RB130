require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class SameObjectTest < Minitest::Test
  def test_equality
    list = [1, 2, 3]
    assert_same(list, list.rotate)
  end
end