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
    @emp = FactoryGirl.create(:employee)
    @cust = FactoryGirl.create(:customer)
    assert @app.valid?
    assert @emp.valid?
    @app.employee = Employee.find(@emp.id)
    @app.customer_id = @cust.id 
    @app.save!
    assert @app.valid? 
    assert_equal @cust.name, @app.custname
  end  
  test "throw an error if appointsment overlap in time and employee" do
    @app1 = FactoryGirl.create(:appointment)
    @emp  = FactoryGirl.create(:employee)
    assert @app1.valid?
    assert @emp.valid?
    @app1.employee = Employee.find(@emp.id) 
    @app1.save!
    @app2 = FactoryGirl.create(:appointment, app_date: "2012-04-17", app_time: "15:00" )
    # assert !@app2.valid?
  end
  test "should respond to to_block" do
    @app1 = FactoryGirl.create(:appointment)
    assert_respond_to @app1, :to_block
  end
    test "should respond to day_matrix" do
    @app1 = FactoryGirl.create(:appointment)
    assert_respond_to @app1, :day_matrix
  end
  test "should respond with a block matrix for the given product" do
    @prod = FactoryGirl.create(:product)
    @app1 = FactoryGirl.create(:appointment, product_id: @prod.id)
    assert @app1.valid?
    assert @prod.valid?
  end
end
