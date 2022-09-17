require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class ValueTest < Minitest::Test

  def test_bool
    value = 3
    assert(value.odd?)
    value = 4
    refute(value.odd?)
  end
end