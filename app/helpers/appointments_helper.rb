module AppointmentsHelper
  include ApplicationHelper

  def checkschedule(matrix, search_matrix)
    return_arr = []
    matrix_length = binary_length(matrix)
    search_length = binary_length(search_matrix)
    matrix = invert_matrix(matrix)
    for i in 0..matrix_length do 
      if ((matrix & search_matrix) == search_matrix)
        return_arr << i
      end
      search_matrix = search_matrix << 1
    end
    return_arr 
  end  
  

end
