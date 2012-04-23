require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "test the factory for correctness" do 
    @prod = FactoryGirl.create(:product)
    assert @prod.valid?
  end
end
