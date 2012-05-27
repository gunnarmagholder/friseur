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

  test "on an empty calendar, the daymatrix is 0" do
    @cal = FactoryGirl.create(:calendar)
    assert_equal 0, @cal.daymatrix()
  end

  test "when attaching the appointment to a calendar, the field calendar_id should hold the calendar id" do
    @cal = FactoryGirl.create(:calendar)
    @product = FactoryGirl.create(:product)
    @app = FactoryGirl.create(:appointment)
    @product.stubs(:block_matrix).returns(0x10011)
    @app.product_id = @product.id
    @cal.appointments<<@app
    assert_equal @app.calendar, @cal
  end
  
  test "when attaching an appointment to an empty calendar, than the result is the appointments product_id matrix" do
    @cal = FactoryGirl.create(:calendar)
    @product = FactoryGirl.create(:product)
    @product.stubs(:block_matrix).returns(0x10011)
    @app = FactoryGirl.create(:appointment)
    @app.app_time = "08:00"
    @app.product_id = @product.id
    @app.save!  
    @cal.appointments<<@app
    assert @app.valid?
    assert @product.valid?
    assert @cal.valid?
    assert_equal 25, @cal.daymatrix
  end
  
  test "calender must belong to an employee" do
    @cal = FactoryGirl.create(:calendar)
    assert @cal.employee.valid?
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
  


  test "it should respond to the class method get_appointments" do  
    assert Calendar.get_appointments(Time.now)
  end

  test "it shoud respond with the number of appointments for a given day" do
    @cal = FactoryGirl.create(:calendar)
    @product = FactoryGirl.create(:product)
    @product.stubs(:block_matrix).returns(0x10011)
    @app = FactoryGirl.create(:appointment)
    @app.app_time = "08:00"
    @app.product_id = @product.id
    @app.save!  
    @cal.appointments<<@app
    @app = FactoryGirl.create(:appointment)
    @app.app_time = "15:00"
    @app.product_id = @product.id
    @app.save!  
    @cal.appointments<<@app

    assert_equal 2, Calendar.get_appointments(Date.parse("23.04.2012"))
  end

  test "it shoud respond with the number of appointments for a given day for multiple calendars" do
    @cal = FactoryGirl.create(:calendar)
    @product = FactoryGirl.create(:product)
    @product.stubs(:block_matrix).returns(0x10011)
    @app = FactoryGirl.create(:appointment)
    @app.app_time = "08:00"
    @app.product_id = @product.id
    @app.save!  
    @cal.appointments<<@app
    @app = FactoryGirl.create(:appointment)
    @app.app_time = "15:00"
    @app.product_id = @product.id
    @app.save!  
    @cal.appointments<<@app
    @cal2 = FactoryGirl.create(:calendar)
    @product = FactoryGirl.create(:product)
    @product.stubs(:block_matrix).returns(0x10011)
    @app = FactoryGirl.create(:appointment)
    @app.app_time = "08:00"
    @app.product_id = @product.id
    @app.save!  
    @cal2.appointments<<@app
    assert_equal 3, Calendar.get_appointments(Date.parse("23.04.2012"))
  end

end
