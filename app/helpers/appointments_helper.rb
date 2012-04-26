module AppointmentsHelper
  include ApplicationHelper

  def checkschedule(matrix, search_matrix)
    return_arr = []
    matrix_length = binary_length(matrix)
    search_length = binary_length(search_matrix)
    prefix = 2**(matrix_length+2)
    matrix_mask = (2**(matrix_length+3))-1
    matrix += prefix
    matrix = matrix^matrix_mask
    for i in 0..matrix_length do 
      if ((matrix & search_matrix) == search_matrix)
        return_arr << i
      end
      search_matrix = search_matrix << 1
    end
    return_arr 
  end  
  

end
