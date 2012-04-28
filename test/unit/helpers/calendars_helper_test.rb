require 'test_helper'

class CalendarsHelperTest < ActionView::TestCase
  test "build comparison matrix should return a Fixnum" do
    starttime = "08:00"
    searchMatrix = 0b110011
    assert_kind_of Fixnum, build_comparison_matrix(starttime, searchMatrix), "is not returning a fixnum"
  end
  test "build comparison matrix at 8:00 should return the searchMatrix" do
    starttime = "08:00"
    searchMatrix = 0b110011
    assert_equal 0b110011, build_comparison_matrix(starttime, searchMatrix)
  end
  test "comparison matrix for 8:30 is searchMatrix leftshifted two times" do
    starttime = "08:30"
    searchMatrix = 0b110011
    assert_equal 0b11001100, build_comparison_matrix(starttime, searchMatrix)
  end
  test "comparison matrix for 12:00 is searchMatrix leftshifted 16 times" do
    starttime = "12:00"
    searchMatrix = 0b110011
    assert_equal 0b1100110000000000000000, build_comparison_matrix(starttime, searchMatrix)    
  end
end
