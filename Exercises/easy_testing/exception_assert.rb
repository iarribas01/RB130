require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'employee'

class ExceptionTest < Minitest::Test 
  def test_exception
    employee = Employee.new
    # assert_raises(NoExperienceError) {employee.hire}
    employee.has_experience = false
    assert_raises(NoExperienceError) {employee.hire}
  end
end