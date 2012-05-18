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
  
  test "should respond to to_block" do
    @app1 = FactoryGirl.create(:appointment)
    assert_respond_to @app1, :to_block
  end


  
end
