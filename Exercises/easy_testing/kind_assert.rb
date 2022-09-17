require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def test_type
    value = 3
    assert_kind_of(Numeric, value)
  end
end