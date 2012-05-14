module CalendarsHelper
  include ApplicationHelper
  
  def build_comparison_matrix(starttime, searchMatrix)
    shiftFactor = convert_time_to_block(starttime)
    searchMatrix << shiftFactor
  end
end
