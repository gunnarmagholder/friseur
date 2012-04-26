class Calendar < ActiveRecord::Base
  belongs_to :employee
  has_many :appointments
  attr_accessible :day
  
  def daymatrix
    self.appointments
    1
  end
  def collide(starttime, matrix)
    
  end
end
