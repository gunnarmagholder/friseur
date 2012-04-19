require 'test_helper'

class AppointmentsHelperTest < ActionView::TestCase
  test "converting 08:00 to block 0" do
    assert_equal 0, convert_time_to_block("08:00")
  end
  test "converting 12:00 to block 16" do
    assert_equal 16, convert_time_to_block("12:00")
  end
  test "converting 16:15 to block 33" do  
    assert_equal 33, convert_time_to_block("16:15")
  end
  test "converting block 33 to 16:15" do
    assert_equal "16:15", convert_block_to_time(33)
  end
  test "converting block 0 to 08:00" do
    assert_equal "08:00", convert_block_to_time(0)
  end
  test "converting block 16 to 12:00" do
    assert_equal "12:00", convert_block_to_time(16)
  end
end
