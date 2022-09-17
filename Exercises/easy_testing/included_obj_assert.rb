require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class IncludedObjectTest < Minitest::Test
  def test_included_object
    arr = [123, 'abc', 'xyz']
    assert_includes(arr, 'xyz')
  end
end