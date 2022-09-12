# observation: setup is run every time
# between tests, setup re-initializes 
# instance variables

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test 
  def setup
    @object =  "stringer things"
  end

  def test_changes_instance
    @object << "!!"
    @object.upcase!

    assert_equal(@object, "STRINGER THINGS!!")
  end

  def test_object_value
    assert_equal(@object, "STRINGER THINGS!!")
  end
end