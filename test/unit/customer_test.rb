require 'test_helper'

class CustomerTest < ActiveRecord::TestCase
  should validate_presence_of(:email)
  should_not allow_value("schnickschnackschnuck").for(:email)
  should allow_value("test@tester.de").for(:email)
  should allow_value("Bettina Bretthaar").for(:name)
  should allow_value("04040194676").for(:telephone)
  should_not allow_value("eine kleine Rattennase ging mal spazieren").for(:telephone)
  
  test "should be valid with the factory" do
      @user = FactoryGirl.build(:customer)
      assert @user.valid?
  end

  test "error witout an email" do
    @user = FactoryGirl.build(:customer, :email => nil)
    assert !@user.valid?
  end

end
