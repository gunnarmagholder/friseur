class Calendar < ActiveRecord::Base
  include CalendarsHelper
  
  belongs_to :employee
  has_many :appointments
  attr_accessible :day
  
  def self.get_appointments(day)
    return_value = 0
    @cals_per_day = self.where(:day => day)
    @cals_per_day.each do |cal|
      return_value += cal.appointments.count
    end
    return_value
  end

  def daymatrix
    return_matrix = 0
      if self.appointments
        self.appointments.each do |app|
          return_matrix = return_matrix | build_comparison_matrix(app.app_time, app.product.block_matrix)
        end
      end
    return_matrix
  end
  
  def attach_appointment(thisAppointment)
    if slot_available?(thisAppointment.app_time, thisAppointment.product.block_matrix)
      appointments<<thisAppointment
    else
      nil
    end
  end

  def slot_available?(starttime, matrix)
    matrix = build_comparison_matrix(starttime, matrix)
    this_matrix = invert_matrix(self.daymatrix,48)
    if ((this_matrix & matrix) == matrix)
      true
    else
      false
    end
  end
end
