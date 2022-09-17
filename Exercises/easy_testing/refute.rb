require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class RefuteTest < Minitest::Test
  def test_refutation
    arr = [123, 'abc', 'Xyz']
    refute_includes(arr, 'xyz')
  end
end