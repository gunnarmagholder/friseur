require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  test "it should be valid out of the default factory" do
    @app = FactoryGirl.create(:appointment)
    assert @app.valid?
  end
  test "if there is no customer_id, than there has to be a customer name" do
    @app = FactoryGirl.create(:appointment)
    @app.customer_id = 0
    @app.custname = "Hamid Mofid"
    assert @app.valid?
    @app.custname = nil
    assert !@app.valid?
  end
  
  test "if there is a customer_id, then take the name from the customer model" do
    @app = FactoryGirl.create(:appointment)
    @cust = FactoryGirl.create(:customer)
    assert @app.valid?
    @app.customer_id = @cust.id 
    @app.save!
    assert @app.valid? 
    assert_equal @cust.name, @app.custname
  end  
  
  test "it must have a product associated" do
    @app = FactoryGirl.create(:appointment)
    @app.product = nil
    assert !@app.valid?
  end
  
  test "should respond to to_block" do
    @app1 = FactoryGirl.create(:appointment)
    assert_respond_to @app1, :to_block
  end
  

  
  test "after attaching the appointment to a calendar, the calendar must be valid" do
    @cal = FactoryGirl.create(:calendar)
    @app = FactoryGirl.create(:appointment)
    @app.app_time = Time.parse("08:00")
    # @cal.appointments<<@app
    @cal.attach_appointment(@app)
    assert @app.calendar.valid?
  end
  
  test "after attaching the appointment to a calendar, employee should return the calendar owner" do
    @cal = FactoryGirl.create(:calendar)
    @app = FactoryGirl.create(:appointment)
    @app.app_time = Time.parse("08:00")
    @cal.appointments<<@app
    @employee = @cal.employee
    assert_equal @employee, @app.employee
  end
  
end
