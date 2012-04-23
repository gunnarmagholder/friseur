class CustomerValidator < ActiveModel::Validator 
  def validate(record)
    if record.customer_id == 0 and !record.custname
      record.errors[:base] << "No customer information given"
    end
  end
end

class Appointment < ActiveRecord::Base
  belongs_to :employee
  before_save :copy_employee_name 
  before_save :check_schedule

  attr_accessible :app_date, :app_time, :confirmed, :custname, :customer_id, :email, :notes, :product_id, :telephone

  validates_with CustomerValidator

  def to_block
   convert_time_to_block(self.app_time)
  end
  
  def day_matrix
    
  end

  def check_schedule
    true
  end

  def copy_employee_name
    if self.employee
      self.custname = self.employee.name
    end
  end
end