require 'minitest/autorun'

class EmptyObjectTest < Minietst::Test 
  def test_empty_object
    arr = []
    assert_empty(arr)
  end
end