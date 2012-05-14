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

  test "should respond to attach_appointment" do
    @cal = FactoryGirl.create(:calendar)
    assert_respond_to @cal, :attach_appointment
  end

  test "should respond to collide method" do
    @cal = FactoryGirl.create(:calendar)
    assert_respond_to @cal, :slot_available?
  end
  
  test "collide should return false if there is a collision with the daymatrix" do
    @cal = FactoryGirl.create(:calendar)
    @cal.stubs(:daymatrix).returns(0b10110011101110001101101)
    matrix = 0b10110011101110001101101
    start_time = "08:00"
    assert_equal false, @cal.slot_available?(start_time, matrix)
  end
  
  test "collide should return true if the wanted appointment fits into a timeslot" do
    @cal = FactoryGirl.create(:calendar)
    @cal.stubs(:daymatrix).returns(0b10110011101110001000110)
    matrix = 0b111001
    start_time = "08:00"
    assert_equal true, @cal.slot_available?(start_time, matrix)
  end
  

end
