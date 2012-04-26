require 'test_helper'

class CalendarTest < ActiveSupport::TestCase
  test "Factory should be operational" do
    @cal = FactoryGirl.create(:calendar)
    assert @cal.valid?
  end
  test "responds to daymatrix with employee and day" do
    @cal = FactoryGirl.create(:calendar)
    assert_respond_to @cal, :daymatrix
  end
  test "daymatrix returns a fixnum" do
    @cal = FactoryGirl.create(:calendar)
    assert_kind_of Fixnum, @cal.daymatrix()
  end
  test "daymatrix calls appointments" do
    @cal = FactoryGirl.create(:calendar)
    @cal.expects(:appointments)
    assert_kind_of Fixnum, @cal.daymatrix()
  end
  test "should respond to collide method" do
    @cal = FactoryGirl.create(:calendar)
    assert_respond_to @cal, :collide
  end
  
  test "collide results in true or false" do
    
  end
  
end
