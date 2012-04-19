require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "employee factory works" do
    @emp = FactoryGirl.create(:employee)
    assert @emp.valid?, "Employee Factory is broken"
  end
end
