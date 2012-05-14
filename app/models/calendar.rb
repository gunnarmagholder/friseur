class Calendar < ActiveRecord::Base
  include CalendarsHelper
  
  belongs_to :employee
  has_many :appointments
  attr_accessible :day
  
  def daymatrix
    return_matrix = 0
      if self.appointments
        self.appointments.each do |app|
          return_matrix
        end
    end
    return_matrix
  end
  
  def attach_appointment(thisAppointment)
    
  end

  def slot_available?(starttime, matrix)
    matrix = build_comparison_matrix(starttime, matrix)
    this_matrix = invert_matrix(self.daymatrix)
    if ((this_matrix & matrix) == matrix)
      true
    else
      false
    end
  end
end
